#plots the multiple plots - plot 4
#load libraries
library("data.table")
library("dplyr")

#load and filter the data
hpc <- fread("household_power_consumption.txt", na.strings="?")
data <- filter(hpc, grep("^[1,2]/2/2007", Date)) #only Feb 1st or 2nd 2007

#save to png
png("plot4.png")

#mfcol for placing column one, all rows first, then column two
par(mfcol=c(2,2))

#plot#1 from plot2.R
plot(as.POSIXct(strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")),
     data$Global_active_power, type="l", ylab = "Global Active Power
     (kilowatts)", xlab = "")

#plot#2 from plot3.R
plot(as.POSIXct(strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")),
     data$Sub_metering_1, type="l", ylab = "Global Active Power
     (kilowatts)", xlab = "")
lines(as.POSIXct(strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")),
      data$Sub_metering_2, type="l", col = "red")
lines(as.POSIXct(strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")),
      data$Sub_metering_3, type="l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=c(1,1,1), col=c("black", "red", "blue"), bty="n")

#plot#3
plot(as.POSIXct(strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")), 
     data$Voltage, type="l", ylab = "Voltage", xlab = "datetime")

#plot#4
plot(as.POSIXct(strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")),
     data$Global_reactive_power, type = "l", ylab="Global_reactive_power", 
     xlab = "datetime")

dev.off()