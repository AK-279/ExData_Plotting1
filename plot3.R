## Loading and reading the data
library(lubridate)
dfile <- "./household_power_consumption.txt"
plotfile <- read.table(dfile, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".") ## Makes names of columns distinct, helps to reference the columnds of data
subset_plot <- subset(plotfile, plotfile$Date == "1/2/2007" | plotfile$Date == "2/2/2007") ## Subsetting the part of data set that we wish to plot

## plotting now
date_time <- strptime(paste(subset_plot$Date, subset_plot$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
weekday <- wday(date_time, label = TRUE)
globalActivePower <- as.numeric(subset_plot$Global_active_power)
subMetering1 <- as.numeric(subset_plot$Sub_metering_1)
subMetering2 <- as.numeric(subset_plot$Sub_metering_2)
subMetering3 <- as.numeric(subset_plot$Sub_metering_3)

plot(date_time, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(date_time, subMetering2, type="l", col="red")
lines(date_time, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
