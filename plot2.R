#plots the Global Active Power plot 2
#load libraries
library("data.table")
library("dplyr")

#load and filter the data
hpc <- fread("household_power_consumption.txt", na.strings="?")
data <- filter(hpc, grep("^[1,2]/2/2007", Date)) #only Feb 1st or 2nd 2007

#save to PNG
png("plot2.png")
plot(as.POSIXct(strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")),
     data$Global_active_power, type="l", ylab = "Global Active Power
     (kilowatts)", xlab = "")
dev.off()