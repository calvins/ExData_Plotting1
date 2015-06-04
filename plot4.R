# Author: Calvin Seto
# Date: June 4, 2015
# Title: R script to create plot4.png for Exploratory Data Analysis Course Project 1
#
# Abstract: This script assumes you ran plot1.R and created power and ssPower R objects.
# Create multiple plots in 2 rows and 2 columns layout with the specified settings and save to 480x480 png file.
# - 2 columns and 2 rows with custom margins
# - Background is transparent
# - reuse code from plot 2 for Global Active Power.
# - create line plot showing voltage
# - reuse code from plot 3 for energy sub metering.
# - remove box around legend in energy sub metering plot.
# - create line plot of Global Reactive Power

png("plot4.png", height=480, width=480)
par(mfrow = c(2,2), mar= c(4,4,2,1), oma=c(0,0,2,0))
par(bg=NA)
with(ssPower, {
    with(ssPower, plot(ssPower$Date2, ssPower$Global_active_power, ylab="Global Active Power", xlab="", type="n"))
    lines(ssPower$Date2, ssPower$Global_active_power, type="l")
    plot(ssPower$Date2, ssPower$Voltage, ylab="Voltage", xlab="datetime", type="n")
    lines(ssPower$Date2, ssPower$Voltage, type="l")
    with(ssPower, plot(ssPower$Date2, ssPower$Sub_metering_1, ylab="Energy sub metering", xlab="", type="n"))
    lines(ssPower$Date2, ssPower$Sub_metering_1, type="l")
    lines(ssPower$Date2, ssPower$Sub_metering_2, type="l", col="red")
    lines(ssPower$Date2, ssPower$Sub_metering_3, type="l", col="blue")
    legend("topright", legend=c("Sub_Metering_1","Sub_Metering_2","Sub_Metering_3"),
           col=c("black", "red", "blue"), cex=0.9, lty=1, bty="n")
    plot(ssPower$Date2, ssPower$Global_reactive_power, ylab="Global_reactive_power", xlab="datetime", type="n")
    lines(ssPower$Date2, ssPower$Global_reactive_power, type="l")
})
dev.off()
