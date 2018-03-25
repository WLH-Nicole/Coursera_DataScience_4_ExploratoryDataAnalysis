getwd()
file <- "./data/household_power_consumption.txt"
data <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

str(subData)
globalActivePower <- as.numeric(subData$Global_active_power)
dateTime <- strptime(paste(subData$Date, subData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# make plot2
png("plot2.png", width=480, height=480)
plot(x=dateTime, y=globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
