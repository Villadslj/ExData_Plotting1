# Load dataset

data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

data$DateTime <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Filter for the date range 
filtered_data <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))


png("plot4.png", width = 800, height = 800)

par(mfrow = c(2, 2))

# Global Active Power
plot(filtered_data$DateTime, filtered_data$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power (kilowatts)",
     main = "Global Active Power Over Time")

# Voltage
plot(filtered_data$DateTime, filtered_data$Voltage, type = "l",
     xlab = "datetime", ylab = "Voltage",
     main = "Voltage Over Time")

# Energy Sub-Metering
plot(filtered_data$DateTime, filtered_data$Sub_metering_1, type = "l",
     xlab = "", ylab = "Energy Sub-Metering",
     col = "black", main = "Energy Sub-Metering")
lines(filtered_data$DateTime, filtered_data$Sub_metering_2, col = "red")
lines(filtered_data$DateTime, filtered_data$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = 1, bty = "n")

# Global Reactive Power
plot(filtered_data$DateTime, filtered_data$Global_reactive_power, type = "l",
     xlab = "datetime", ylab = "Global Reactive Power (kilowatts)",
     main = "Global Reactive Power Over Time")

# Close the PNG device
dev.off()