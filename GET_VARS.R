#########################################################
## Functions to retrieve and filter data from 990s ## 
## Assumes you have: the 990s, ein_ts_filter.RDS  ###
## Author: Rose Evard
#########################################################
library(here)
library(tidyverse)
library(xml2)
library(lubridate)

# variables: variables to retrieve
# filename: name of file to read
# names: column names (if different than names of variables to extract); optional
# note that input vectors variables and names should be the same length
# and in corresponding order
get_df <- function(variables = c(),
                   filename,
                   names = c(),
                   schedule = NULL) {
  
  
  if(length(variables)==0 & is.null(schedule)) {
    stop("Schedule or Variable Names Must be Provided")
  }
  
  xml_file <- read_xml(filename)
  xml_file <- xml_ns_strip(xml_file)
  
  # variables to always extract
  standard_vars <- c("//Return//ReturnHeader//ReturnTs",  
                   "//Return//ReturnHeader//Filer//EIN",
                   "//Return//ReturnHeader//TaxPeriodEndDt")
  
  # option for extracting all variables for given schedule
  if (!is.null(schedule)) {
    variables <- get_vars_by_schedule(xml_file, schedule)
  }
  
  variables_full <- c(standard_vars, variables)
  
  variables_no_path <- gsub("*.*\\/", "", variables_full)
  
  # create column names with just the variables (no paths)
  # If they want specified names, uses provided column
  if(length(names) == 0) {
    variable_names <- variables_no_path
  } else {  
    variable_names <- c("ReturnTs", "EIN", "TaxPeriodEndDt", names)
  }

  
  # extract each variable; if it isn't present, put NA 
  extracted <- map(variables_full, ~{
    value <- xml_find_all(
      xml_file, 
      xpath =.x)
    value <- ifelse(length(value) ==0, 
                    NA, 
                    xml_text(value)) })
  
  names(extracted) <- variable_names
  #Converting to tibble, adding fiscal_year
  extracted <- extracted %>%
    as_tibble() %>%
    mutate(TaxPeriodEndDt = as.Date(TaxPeriodEndDt, format = "%Y-%m-%d"),
           fiscal_year = year(TaxPeriodEndDt),
           fiscal_year = factor(fiscal_year)) %>%
    select(-TaxPeriodEndDt)
  
  # check how many of the entries are NA
  # if all NA, prefix 'irs:' may be needed
  columns_not_na <- map_dbl(as.data.frame(extracted), ~!is.na(.x)) %>% sum()
  
  # handle case where prefix 'irs' is in front
  if(columns_not_na == 0){
    
    extracted <- map(variables_no_path, ~ {
      value <- xml_find_all(xml_file, 
                            xpath = paste0("//irs:", .x)) 
      value <- ifelse(length(value) ==0, 
                      NA, 
                      xml_text(value)) })
    names(extracted) <- variable_names
    
    #Converting to tibble, adding fiscal_year
    extracted <- extracted %>%
      as_tibble() %>%
      mutate(TaxPeriodEndDt = as.Date(TaxPeriodEndDt, format = "%Y-%m-%d"),
             fiscal_year = year(TaxPeriodEndDt),
             fiscal_year = factor(fiscal_year)) %>%
      select(-TaxPeriodEndDt)
      
  }
  
  # add name of file to data frame
  extracted %>%
    mutate(filename = gsub("*.*\\/", "", filename))
}

# Filters the dataset based on previously gathered filenames, EIN, and ReturnTs
# dataset: the datafile of 990s, assumes has ReturnTs, EIN, and filename
# Assumse you've ran code in load_wrangle_filter to have ein_ts_filter
filter_ein <- function(dataset) {
  filter_vars <- readRDS(here("data", "ein_ts_filter.RDS"))
  filter_vars %>% 
    left_join(dataset, by = c("ReturnTs", "EIN", "filename")) %>%
    return()
}



get_vars_by_schedule <- function(file, schedule) {
  
  schedule_path <- paste0("//IRS990Schedule", toupper(schedule))

  schedule_children <- file %>% 
    xml_find_all(xpath = "//ReturnData") %>%
    xml_children() %>% 
    xml_find_all(schedule_path) %>%
    xml_children() 
  
  schedule_children %>%
    xml_path()
  
}


# convenience function to see what all children variables
# of some node are; often we will not want to extract
# all children due to duplicate names 
get_all_children <- function(filename, xpath, quiet = TRUE) {
  
  xml_file <- read_xml(filename)
  xml_file <- xml_ns_strip(xml_file)
  
  
  children <- xml_file %>% 
    xml_find_all(xpath = xpath) %>%
    xml_children() 
  
  new_nodes <- children
  
  all_paths <- children %>%
    xml_path()
  
  # assume depth of xml file is less than 100
  # breaks when no child nodes are found 
  for (i in 1:100) {
  
    new_nodes <- new_nodes %>%
      xml_children()
    
    if(length(new_nodes) == 0) break
    
    if(!quiet) message(paste0(
      "Iteration: ", i,
      "\nNew Nodes:\n", paste0(xml_path(new_nodes),
                               collapse="\n")))
    
    # add new node paths to existing list of paths
    all_paths <- c(all_paths, xml_path(new_nodes))
  }
  return(all_paths)
}







