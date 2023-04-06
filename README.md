# Dance Data Project - Form 990 Analysis

## About 

The project is a part of Smith College Statistical and Data Science Capstone in Spring 2023, which is kindly sponsored by Dance Data Project® [“Dance Data Project”](“https://www.dancedataproject.com/”), a non-profit organization advocating for girls and women in dance. The project aims to look at the longitudinal record of dance company endowments before and after pandemic and analyze the their performances. Particularly, we looked at if there is any noticeable pattern and discrepancies exist in their usage of endowment over time. The repository contains open-access data bytes in html and pdf format that present our analyses.  

## Contributors

<!-- ALL-CONTRIBUTORS-LIST:START -->
| Contributions | Name (alpha order) |
| ----: | :---- |
| [🤔](# “Ideas and Planning") [🔢](# "Content") [💻](# "Code")  | [Ruth Button](DOI) |
|  [💻](# "Code") [🚇](# “Infrastructure”)  [🔢](# "Content") [🤔](# "Ideas and Planning") [👀](# “Reviewed Pull Requests”) | [Rose Evard](DOI) |
| [🔣](“Data”) [🤔](# "Ideas and Planning") [📆](# “Project Management”)| [Andrew Hoekstra](DOI) |
| [🔢](# "Content") [💻](# "Code") [🤔](# "Ideas and Planning")[👀](# “Reviewed Pull Requests”) | [Zhen Nie](DOI) |
|  [🔣](“Data”) [🔢](# "Content") [💻](# "Code") [🤔](# "Ideas and Planning") [👀](# “Reviewed Pull Requests”) | [Quinn White](DOI) | 
| [💼 ](# "Business") [🤔](# "Ideas and Planning") [📆](# “Project Management”)| [Elizabeth Yntema](DOI) | 


<!-- ALL-CONTRIBUTORS-LIST:END -->

(For a key to the contribution emoji or more info on this format, check out [“All Contributors.”](https://allcontributors.org/docs/en/emoji-key))

## Dependencies

This code is written for the R programming language and RStudio. Ensuring the most recent version of both R and RStudio is essential. Any operating system compatible with R and RStudio will work. The necessary packages to install to correctly run the code are ‘broom’, ‘moderndive’, ‘tidyverse’, ‘xml2’, ‘kableExtra’, ‘here’, ‘plotly’, ‘scales’, ‘readxl’, ‘purrr’, and ‘shiny’.   


## Getting Started  

### Prerequisites  
Before running these analyses, we obtained a set of xml files corresponding to companies of interest, where these xml files contain 990 form data in the format reported by the IRS. All R packages needed are installed using `INSTALL_ALL.R`.  

### Running Analyses  
The script `RUN_ALL.R` runs all files in the `infrastructure_rmds` directory as well as the  `exploration_rmds` directory. Html outputs are placed in the `output_html` subdirectories of `infrastructure_rmds` and `exploration_rmds`.   

## Definitions  

We defined “Dance Companies” as non-profit organizations that have filed an IRS form 990 within the past five years and whose primary purpose involves dance as a performing art.   
* “Building” refers to all land, buildings, leasehold improvements, equipment, and other fixed assets held for investment purposes.   
* “Net assets” refers to all liquid assets and all fixed assets a company reports in their IRS filings.  
* “Endowment” refers to endowment funds established by donor-restricted gifts that are maintained to provide a source of income for either a specified period of time or until a specific event occurs.  
* “Unpaid Labor” is defined as any given company’s use of volunteer work.  
* “Region” is conceptually defined as one of the five major regions of the United States according to the [National Geographic Society](https://education.nationalgeographic.org/resource/united-states-regions/): Northeast, Southeast, Southwest, Midwest, and West. 

## Data Sources

* A set of xml files in the format reported by the IRS corresponding to a set of dance companies tracked by the DDP.  
* A csv named `companies.csv` that maps the EIN to the company name for all companies tracked by the DDP. This provides a stable name for each EIN, since companies may change their names slightly or have small variations in the format of their reported business name in the xml files (e.g., differences in capitalization).  
* When companies amended their filings, we proceeded with the amended filing. Because endowment data variables for a filing for a given year contain values for each variable for the current year as well each year back until four years prior, we used the most recently reported values in our analyses. For example, we take the values for 2016-2020 from the 2020 filing (provided these values were reported).  



## Data Collection and Update Process   

Are any data processes automated? If so how often is the data updated? If the data needs to updated manually, how would someone go about doing that?

## Repo Architecture  

This repo contains all code created by Smith SDS Capstone `23 students for Dance Data Project.  There are two main files containing rmarkdowns utilized for analyses:    
* `infrastructure_rmds` : contains all wrangling, troubleshooting, dictionary, and testing code.  The most important files within this are `load_wrangle_filter.Rmd`, which establishes the base datasets and filters, and `handle_discrepancies.Rmd`, which identifies reported discrepancies within Form 990’s and produces more flexible dataset with endowment information from Schedule D.   
* `explorations_rmds` : all analyses, including examinations on labor, endowment balances, compensation, and location.     

All knitted HTML files from rmarkdowns are within a nested folder called `output_html` in the respective parent folder.   

R scripts with universal functions (`GET_VARS.R`, `INSTALL_ALL.R`, `RUN_ALL.R`) are within the main directory.    

Original data utilized for this project are not contained within this repo.  However, all data produced by infrastructure rmarkdowns are saved in a folder called `data` in `.RDS` form.  All analyses assume your data are stored in XML format, in a folder called `ballet_990_released_20230208`  

The folder `css` contains css code to produce standardized knitted HTMLs.  

## License   
This work is licenced under an [MIT license](​​https://github.com/Dance-Data-Project/smith-capstone-23/blob/main/LICENSE)

## How to Provide Feedback  

Questions, bug reports, and feature requests can be submitted to this repo's [issue queue](https://github.com/Dance-Data-Project/smith-capstone-23/issues).

## Have Questions?  
