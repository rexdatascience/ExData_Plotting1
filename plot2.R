# Read the data in from file
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";");

# Convert "Date" and "Time" columns to new Date/Time class datetime
data$datetime <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")

# Select data for "2007-02-01" and "2007-02-02" only
data <- subset(data, datetime >= "2007-02-01 00:00:00" & datetime <= "2007-02-02 24:00:00");

# Convert "Global_active_power" column to character 1st before converting to numeric 
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))

#output to 480x480 PNG image
png("plot2.png", height=480, width=480);

#plot line plot of Global_active_power (y-axis) against datetime (x-axis)
plot(data$datetime, data$Global_active_power, type ='l',  
     ylab = "Global Active Power (kilowatts)", xlab = "");

#close output device
dev.off();