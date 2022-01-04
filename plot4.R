
library(lubridate)
library(dplyr)


data <- read.table("household_power_consumption.txt", header=TRUE, sep = ";", dec = ".")

data_power <- data %>% filter(data$Date=="1/2/2007" | data$Date =="2/2/2007")

data_power$Global_active_power <- as.numeric(data_power$Global_active_power)
data_power$Sub_metering_1 <- as.numeric(data_power$Sub_metering_1)
data_power$Sub_metering_2 <- as.numeric(data_power$Sub_metering_2)
data_power$Sub_metering_3 <- as.numeric(data_power$Sub_metering_3)
data_power$Sub_metering_3 <- as.numeric(data_power$Voltage)
data_power$Global_reactive_power <- as.numeric(data_power$Global_reactive_power)

data_power$timestamp <- strptime(paste(data_power$Date, data_power$Time,sep=" "), "%d/%m/%Y %H:%M:%S")

png("plot4.png", width=480, height=480)

par(mfrow = c(2, 2)) 

#plot1
plot(data_power$timestamp, data_power$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

#plot2
plot(data_power$timestamp, data_power$Voltage, type="l",xlab="datetime",ylab="Voltage")

#plot3
plot(data_power$timestamp,data_power$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering", col = "black")
lines(data_power$timestamp,data_power$Sub_metering_2, col = "red")
lines(data_power$timestamp,data_power$Sub_metering_3, col = "blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd = 2, col=c("black", "red", "blue")) 

#plot4

plot(data_power$timestamp,data_power$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()

