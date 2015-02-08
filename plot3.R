# Read the data in from file
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";");

# Convert "Date" and "time" columns to new Date/Time class datetime
data$datetime <- strptime( paste (data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

# Select data for "2007-02-01" and "2007-02-02" only
data <- subset(data, datetime >= "2007-02-01 00:00:00" & datetime <= "2007-02-02 24:00:00");

# Convert "sub_metering_1" & "sub_metering_2" columns from factor to numeric 
# sub_metering_3 is already a numeric column
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1));
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2));

# Output to 480x480 PNG image
png("plot3.png", height=480, width=480);

# plot the graphs of sub_metering_1, 2 and 3
plot(data$datetime, data$Sub_metering_1, type ='l',  
     ylab = "Energy sub metering", xlab = "");
lines(data$datetime, data$Sub_metering_2, col="red");
lines(data$datetime, data$Sub_metering_3, col="blue");

# create the legend at the topright corner of the plot
legendlabels <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3");
legendcolours <- c("black","red","blue");
legend(x="topright",legend=legendlabels, col=legendcolours, lwd=0.75)

# close output device
dev.off();