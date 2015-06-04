# Author: Calvin Seto
# Date: June 4, 2015
# Title: R script to create plot3.png for Exploratory Data Analysis Course Project 1
#
# Abstract: This script assumes you ran plot1.R and created power and ssPower R objects.
# Create line plot with the specified settings and save to 480x480 png file.
# - 1 column and 1 row
# - Background is transparent
# - line plot, no title, and label for y-axis, no label for x-axis
# - black line for kitchen metering
# - red line for laundry room metering
# - blue line for water-heater and air-conditioner metering
# - place legend in top right with black, red, and blue color lines.
# - make changes to legend text size and set legend line type

png("plot3.png", height=480, width=480)
par(mfrow = c(1,1))
par(bg=NA)
with(ssPower, plot(ssPower$Date2, ssPower$Sub_metering_1, ylab="Energy sub metering", xlab="", type="n"))
lines(ssPower$Date2, ssPower$Sub_metering_1, type="l")
lines(ssPower$Date2, ssPower$Sub_metering_2, type="l", col="red")
lines(ssPower$Date2, ssPower$Sub_metering_3, type="l", col="blue")
legend("topright", legend=c("Sub_Metering_1","Sub_Metering_2","Sub_Metering_3"),
       col=c("black", "red", "blue"), cex=0.9, lty=1)
dev.off()
