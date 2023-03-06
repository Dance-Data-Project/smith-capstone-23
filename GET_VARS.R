#########################################################
## Function to retrieve data from 990s ## 
## Assumes you have: the 990s, ein_ts_filter.RDS  ###
## Author: Rose Evard
#########################################################
library(here)
library(tidyverse)

# variables: variables to retrieve
# filename: name of file to read
# names: column names (if different than names of variables to extract); optional
# note that input vectors variables and names should be the same length
# and in corresponding order
get_df <- function(variables,
                   filename,
                   names = c()) {
  
  naming_vars <- c("//Return//ReturnHeader//ReturnTs",  
                   "//Return//ReturnHeader//Filer//EIN")
  
  variables_full <- c(naming_vars, variables)
  variables_no_path <- gsub("*.*\\/", "", variables_full)
  # create column names with just the variables (no paths)
  # If they want specified names, uses provided column
  if(length(names) == 0) {
    variable_names <- variables_no_path
  } else {  
    variable_names <- c("ReturnTs", "EIN", names)
  }

  
  xml_file <- read_xml(filename)
  xml_file <- xml_ns_strip(xml_file)
  
  # extract each variable; if it isn't present, put NA 
  extracted <- map(variables_full, ~{
    value <- xml_find_all(
      xml_file, 
      xpath =.x)
    value <- ifelse(length(value) ==0, 
                    NA, 
                    xml_text(value)) })
  
  names(extracted) <- variable_names
  extracted <- extracted %>%
    as_tibble()
  
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
    
    extracted <- extracted %>%
      as_tibble()
  }
  
  # add name of file to data frame
  extracted %>%
    mutate(filename = gsub("*.*\\/", "", filename))
}

filter_ein <- function(dataset) {
  filter_vars <- readRDS(here("data", "ein_ts_filter.RDS"))
  filter_vars %>% 
    left_join(dataset, by = c("ReturnTs", "EIN", "filename")) %>%
    return()
}
