#########################################################
## Function to retrieve data from 990s ## 
## Assumes you have: the 990s, ein_ts_filter.RDS  ###
## Author: Rose Evard
#########################################################

get_df <- function(variables,
                   filename, 
                   include_paths = TRUE) {
  
  # create column names with just the variables (no paths)
  variables_no_path <- gsub("*.*\\/", "", variables )
  
  xml_file <- read_xml(filename)
  xml_file <- xml_ns_strip(xml_file)
  
  # extract each variable; if it isn't present, put NA 
  extracted <- map(variables, ~{
    value <- xml_find_all(
      xml_file, 
      xpath =.x)
    value <- ifelse(length(value) ==0, 
                    NA, 
                    xml_text(value)) })
  
  names(extracted) <- variables_no_path
  
  extracted <- extracted %>%
    as_tibble()
  
  
  # add columns with the paths to each variable within the xml file
  if(include_paths) {
    paths <- map(variables, ~ {
      value <- xml_find_all(
        xml_file, 
        xpath = paste0(.x)) 
      value <- ifelse(length(value) ==0, 
                      NA, 
                      xml_path(value)) })
    
    names(paths) <- paste0(variables_no_path, "_path")
    
    extracted <- extracted %>%
      bind_cols(as_tibble(paths)) 
    
  }
  
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
    names(extracted) <- variables_no_path
    
    extracted <- extracted %>%
      as_tibble()
  }
  
  # add name of file to data frame
  extracted %>%
    mutate(filename = gsub("*.*\\/", "", filename))
}