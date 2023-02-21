
##################################################################
# simple R script to knit all Rmarkdown file and generate outputs
# in the output_html directory
##################################################################

library(rmarkdown)

render("./load_wrangle_filter_data.Rmd", output_dir = "./output_html" )
render("./generate_table.Rmd", output_dir = "./output_html")
render("./filter_out_filings.Rmd",output_dir = "./output_html")
render("./retrieve_endowment.Rmd", output_dir = "./output_html")
render("./data_dictionary.Rmd", output_dir = "./output_html")
