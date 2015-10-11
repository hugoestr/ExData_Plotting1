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
png("plot1.png", width = 480, height = 480)
hist(data$Global_active_power, main = "Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.off()


