## Reading data

data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, 
                   na.strings = c("?"))
data$Time <- strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date,"%d/%m/%Y")

## Subsetting plot data

plotdata <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02",]
rm(data)

## Opening the device

png(png, file="plot2.png", width=480, height=480, units="px")

## Creating the plot

plot(plotdata$Time, plotdata$Global_active_power, type="l", xlab="", 
     ylab="Global Active Power (kilowatts)")

## Closing the device

dev.off()


## [EOF]