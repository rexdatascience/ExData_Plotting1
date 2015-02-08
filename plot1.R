# Read the data in from file
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";");

# Convert "Date" column to Date/Time class
data$Date <- as.Date(data$Date,"%d/%m/%Y");

# Select data for "2007-02-01" and "2007-02-02" only
data <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")

# Convert "Global_active_power" column to character 1st before converting to numeric 
data$Global_active_power <- as.numeric(as.character(data$Global_active_power));

#output to 480x480 PNG file
png("plot1.png", height=480, width=480);

# Plot histogram
hist(data$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col="red");

#close output device
dev.off();