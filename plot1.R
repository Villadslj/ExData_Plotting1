# Load dataset

data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

data$DateTime <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Filter for the date range 
filtered_data <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

# plot and save to file
png("plot1.png")
# Create a histogram
hist(filtered_data$Global_active_power,
     main = "Histogram of Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency",
     col = "red",
     breaks = 20) 


dev.off()