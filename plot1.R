# Author: Calvin Seto
# Date: June 4, 2015
# Title: R script to create plot1.png for Exploratory Data Analysis Course Project 1
#
# Abstract: This script reads our data set into the power R object.  Data is separated by semi-colons, first row is a header and 
# we don't want to convert strings to factors.
# Use sqldf package to filter data set and only select data for 2 days 2/1/2007 and 2/2/2007 into new R object ssPower.
# Create a new Date2 variable containing Date/Time types and convert the other variables to numeric types.
# Create histogram plot with the specified settings and save to 480x480 png file.
# - 1 column and 1 row
# - Background is transparent
# - red color, title, and label for x-axis

power <- read.table("../data/household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=FALSE)
library(sqldf)
ssPower <- sqldf("select * from power where Date='1/2/2007' or Date='2/2/2007'", drv="SQLite")
ssPower$Date2 <- strptime(paste(ssPower$Date, ssPower$Time), "%d/%m/%Y %H:%M:%S")
ssPower$Global_active_power <- as.numeric(ssPower$Global_active_power)
ssPower$Global_reactive_power <- as.numeric(ssPower$Global_reactive_power)
ssPower$Voltage <- as.numeric(ssPower$Voltage)
ssPower$Global_intensity <- as.numeric(ssPower$Global_intensity)
ssPower$Sub_metering_1 <- as.numeric(ssPower$Sub_metering_1)
ssPower$Sub_metering_2 <- as.numeric(ssPower$Sub_metering_2)
ssPower$Sub_metering_3 <- as.numeric(ssPower$Sub_metering_3)
png("plot1.png", height=480, width=480)
par(mfrow = c(1,1))
par(bg=NA)
with(ssPower, hist(ssPower$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)"))
dev.off()
