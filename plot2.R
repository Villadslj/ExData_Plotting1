# Load dataset

data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

data$DateTime <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Filter for the date range 
filtered_data <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

# plot and save to file
png("plot2.png")
plot(filtered_data$DateTime, filtered_data$Global_active_power, type = "l",
     xlab = "Datetime", ylab = "Global Active Power (kilowatts)",
     main = "Global Active Power Over Time")

dev.off()