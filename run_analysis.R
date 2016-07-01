
#Getting and Cleaning Data Project Script

#' Set Working Directory
setwd(".\\R\\GettingandCleaningData")

#`Dataset URL
fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"


#' Check if required data exists. Else download
if (!file.exists("UCI HAR Dataset")) {
  print("Dataset not Found")
  if (!file.exists("dataset")) {
        dir.create("dataset")
    }
    download.file(fileUrl, destfile="dataset/UCI_HAR_Dataset.zip", method="auto")
    unzip("dataset/UCI_HAR_Dataset.zip", exdir=".")
	}
if(file.exists("UCI HAR Dataset")) {
  print("Dataset Found")
}

#' Load Packages
rpack<-c("dplyr","data.table", "reshape2", "rmarkdown","knitr","markdown")
invisible(sapply(rpack, library ,character.only=TRUE))

#' Run Data cleaning script, Output Results in html and Create a codebook
rmarkdown::render("datacleaner_script.R",output_file="analysis_results.html",html_document())# creates md file and knits to html
knitr::knit('codebook_generator.rmd', 'codebook.md',encoding="ISO8859-1") # creates md file
markdownToHTML('codebook.md', 'codebook.html') # creates html file

#'Save Tidy Data as CSV file 
write.csv(datatidy, file = "independent_tidy_dataset.csv")

browseURL(paste(file.path(getwd(),'analysis_results.html')))
browseURL(paste(file.path(getwd(),'codebook.html')))

