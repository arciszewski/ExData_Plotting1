# This file contains the definition of common functions, that are reused in other scripts


setwd('~/dev/coursera/datascience/c4/w1/ExData_Plotting1')

# Supplementary function makePath that concatenates parameters with "/" as a delimiter
# i.e. makePath("a", "b", "c") == "a/b/c"
makePath <- function(...) {
    paste(..., sep = "/")
}

dataDir <- "data"
archiveFile <- makePath(dataDir, "dataset.zip")

download.data.if.needed <- function() {
    archiveUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    
    if (!dir.exists(dataDir)) {
        dir.create(dataDir)
    }
    if (!file.exists(archiveFile)) {
        print("Trying to download file with input data")
        download.file(url = archiveUrl, destfile = archiveFile, method = "curl")
        unzip(zipfile = archiveFile, exdir = dataDir)
        print("Archive is downloaded and unzipped")
    }
}

get.filtered.data <- function() {
    require(dplyr)
    require(lubridate)
    full.df <- read.csv(
        file = makePath(dataDir, "household_power_consumption.txt"),
        sep = ";",
        na.strings = "?",
        stringsAsFactors = FALSE
    )
    # suplementary function to return dateTime
    date.time <- function(date, time) {
        dt <- paste(date, time)
        return(dmy_hms(dt))
    }
    filtered.df <- full.df %>%
        filter(Date %in% c("1/2/2007", "2/2/2007")) %>%
        mutate(datetime = date.time(Date, Time)) %>%
        select(datetime, Global_active_power:Sub_metering_3)
    return(filtered.df)
}
