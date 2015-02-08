# Read the data in from file
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";");

# Convert "Date" and "time" columns to new Date/Time class datetime
data$datetime <- strptime( paste (data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

# Select data for "2007-02-01" and "2007-02-02" only
data <- subset(data, datetime >= "2007-02-01 00:00:00" & datetime <= "2007-02-02 24:00:00");

# Convert Factor columns to character class first before converting to numeric 
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1));
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2));
data$Voltage <- as.numeric(as.character(data$Voltage));
data$Global_reactive_power <- as.numeric(as.character(data$Global_reactive_power))

# output to 480x480 PNG image
png("plot4.png", height=480, width=480);

# create image with 2x2 plots
par(mfrow = c(2,2));

with (data, {
  # 1st plot, Global_active_power against datetime
  plot(datetime, Global_active_power, type='l',
       ylab="Global Active Power", xlab="");
  
  # 2nd plot, voltage against date time
  plot(datetime, Voltage, type="l");

  # 3rd plot, Enery sub metering 1,2,3
  plot(datetime, Sub_metering_1, type='l', ylab = "Energy sub metering", xlab = "");
  lines(datetime, Sub_metering_2, col="red");
  lines(datetime, Sub_metering_3, col="blue");

  #create the legend at the topright corner of the plot
  legendlabels <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3");
  legendcolours <- c("black","red","blue");
  legend(x="topright",legend=legendlabels, col=legendcolours, lwd=0.75, bty='n');
  
  # 4th plot, Global_rective_power against datetime
  plot(datetime, Global_reactive_power, type="l");
})

# close output device
dev.off();