# Load dataset

data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

data$DateTime <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Filter for the date range 
filtered_data <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

# plot and save to file
png("plot3.png")
# Create a histogram of Global Active Power
plot(filtered_data$DateTime, filtered_data$Sub_metering_1, type = "l", col = "black",
     xlab = "Datetime", ylab = "Energy sub-metering")
lines(filtered_data$DateTime, filtered_data$Sub_metering_2, col = "red")
lines(filtered_data$DateTime, filtered_data$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = 1)

dev.off()