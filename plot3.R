#plots the Sub_meterings plot 3
#load libraries
library("data.table")
library("dplyr")

#load and filter the data
hpc <- fread("household_power_consumption.txt", na.strings="?")
data <- filter(hpc, grep("^[1,2]/2/2007", Date)) #only Feb 1st or 2nd 2007

# save to png
png("plot3.png") #call the png file to be saved to

#the plot, add lines for multiple lines in this graph
plot(as.POSIXct(strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")),
     data$Sub_metering_1, type="l", ylab = "Global Active Power
     (kilowatts)", xlab = "")
lines(as.POSIXct(strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")),
      data$Sub_metering_2, type="l", col = "red")
lines(as.POSIXct(strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")),
      data$Sub_metering_3, type="l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=c(1,1,1), col=c("black", "red", "blue"))

dev.off()