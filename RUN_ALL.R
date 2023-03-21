
##################################################################
# simple R script to knit all Rmarkdown file and generate outputs
# in the output_html directory within each file 
##################################################################

library(rmarkdown)
library(here)

# exploration folder
files <- dir(here("explorations_rmds"),
             full.names = TRUE)
output <- here("explorations_rmds", "output_html")

for (i in files) {
  render(i, output_dir = output)
}

# Infrastructure folder 
files <- dir(here("infrastructure_rmds"),
             full.names = TRUE)
output <- here("infrastructure_rmds", "output_html")

for (i in files) {
  render(i, output_dir = output)
}