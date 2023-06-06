## Loading and reading the data
library(lubridate)
dfile <- "./household_power_consumption.txt"
plotfile <- read.table(dfile, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".") ## Makes names of columns distinct, helps to reference the columnds of data
subset_plot <- subset(plotfile, plotfile$Date == "1/2/2007" | plotfile$Date == "2/2/2007") ## Subsetting the part of data set that we wish to plot

## plotting now
date_time <- strptime(paste(subset_plot$Date, subset_plot$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
weekday <- wday(date_time, label = TRUE)
globalActivePower <- as.numeric(subset_plot$Global_active_power)
plot(date_time, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")