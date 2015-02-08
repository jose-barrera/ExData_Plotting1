## Reading data

data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, 
                   na.strings = c("?"))
data$Time <- strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date,"%d/%m/%Y")

## Subsetting plot data

plotdata <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02",]
rm(data)

## Opening the device

png(png, file="plot3.png", width=480, height=480, units="px")

## Creating the plot

plot(plotdata$Time, plotdata$Sub_metering_1, type="l", xlab="", 
     ylab="Energy sub metering", col="black")
lines(plotdata$Time, plotdata$Sub_metering_2, col="red")
lines(plotdata$Time, plotdata$Sub_metering_3, col="blue")
names = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
legend("topright", legend=names, col=c("black", "red", "blue"), lty=1, lwd=2)

## Closing the device

dev.off()


## [EOF]