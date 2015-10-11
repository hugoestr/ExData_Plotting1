# Create the data
# The script assumes that you have already downloaded the data and unzipped in 
# a 'data' folder that exists in the same directory as the script

# Load the data
# replace ? with NA
# based on code found in 
# https://class.coursera.org/exdata-033/forum/thread?thread_id=15
rawData <- read.table("data/household_power_consumption.txt", header=TRUE, sep=";", na.strings = c("?", "" ))

# Clean the date
# I am method shown in 
# https://class.coursera.org/exdata-033/forum/thread?thread_id=15
rawData$Date <- as.Date(rawData$Date, format="%d/%m/%Y")
rawData$temptime <- paste(rawData$Date, rawData$Time)
rawData$Time <- strptime(rawData$temptime, format="%Y-%m-%d %H:%M:%S")

#filter the data to the correct range
data <- rawData[rawData$Date>="2007-02-01" & rawData$Date<="2007-02-02",]

# Actual creation of the chart

# plotting
png("plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))

# chart 1
plot(data$Time, data$Global_active_power, type="l", ylab = "Global Active Power (kilowatts)", xlab="")

# Chart 2
plot(data$Time, data$Voltage, type="l", xlab="datetime", ylab="Voltage")

# Char 3
plot(data$Time, data$Sub_metering_1, type="l", ylab = "Energy Sub metering", xlab="")
lines(data$Time, data$Sub_metering_2, col="red")
lines(data$Time, data$Sub_metering_3, col="blue")
legend("topright", pch = 28, col = c("black", "red", "blue"), legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1))

# chart 4
plot(data$Time, data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()




