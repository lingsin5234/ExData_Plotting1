#plots the Global Active Power plot 1
#load libraries
library("data.table")
library("dplyr")

#load and filter the data
hpc <- fread("household_power_consumption.txt", na.strings="?")
data <- filter(hpc, grep("^[1,2]/2/2007", Date)) #only Feb 1st or 2nd 2007

#save to PNG
png("plot1.png")
#Global Active Power are characters
hist(as.numeric(data[[3]]), col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.off()