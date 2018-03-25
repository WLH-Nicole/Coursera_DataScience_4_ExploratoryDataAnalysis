getwd()
file <- "./data/household_power_consumption.txt"
data <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

str(subData)
globalActivePower <- as.numeric(subData$Global_active_power)
subMetering1 <- as.numeric(subData$Sub_metering_1)
subMetering2 <- as.numeric(subData$Sub_metering_2)
subMetering3 <- as.numeric(subData$Sub_metering_3)
voltage <- as.numeric(subData$Voltage)
globalReactivePower <- as.numeric(subData$Global_reactive_power)
dateTime <- strptime(paste(subData$Date, subData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#Make plot4
png("plot4.png", width=480, height=480)
par(mfcol = c(2, 2))

# make plot11
plot(x=dateTime, y=globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

# make plot21
plot(dateTime, subMetering1, type="l", xlab="", ylab="Energy Submetering")
lines(dateTime, subMetering2, type="l", col="red")
lines(dateTime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1, lwd=2.5)

# make plot12
plot(dateTime, voltage, type="l", xlab="datetime", ylab="Voltage")

# make plot22
plot(dateTime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
