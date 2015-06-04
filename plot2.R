# Author: Calvin Seto
# Date: June 4, 2015
# Title: R script to create plot2.png for Exploratory Data Analysis Course Project 1
#
# Abstract: This script assumes you ran plot1.R and created power and ssPower R objects.
# Create line plot with the specified settings and save to 480x480 png file.
# - 1 column and 1 row
# - Background is transparent
# - line plot, no title, and label for y-axis, no label for x-axis

png("plot2.png", height=480, width=480)
par(mfrow = c(1,1))
par(bg=NA)
with(ssPower, plot(ssPower$Date2, ssPower$Global_active_power, ylab="Global Active Power (kilowatts)", xlab="", type="n"))
lines(ssPower$Date2, ssPower$Global_active_power, type="l")
dev.off()
