
##################################################################
# simple R script to knit all Rmarkdown file and generate outputs
# in the output_html directory
##################################################################

if (file.exists(".env")) {
  dotenv::load_dot_env()
}

rmarkdown::render("load_wrangle_filter_data.Rmd", output_dir = "./output_html")
# rmarkdown::render("generate_table.Rmd", output_dir = "./output_html")
# rmarkdown::render("filter_out_filings.Rmd", output_dir = "./output_html")
# rmarkdown::render("retrieve_endowment.Rmd", output_dir = "./output_html")
# rmarkdown::render("data_dictionary.Rmd", output_dir = "./output_html")
