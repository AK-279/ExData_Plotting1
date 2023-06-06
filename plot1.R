## Loading and reading the data
dfile <- "./household_power_consumption.txt"
plotfile <- read.table(dfile, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".") ## Makes names of columns distinct, helps to reference the columnds of data
subset_plot <- subset(plotfile, plotfile$Date == "1/2/2007" | plotfile$Date == "2/2/2007") ## Subsetting the part of data set that we wish to plot

## plotting now
hist(as.numeric(as.character(subset_plot$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)", ylab = "Frequency")
