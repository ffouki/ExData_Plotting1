rm(list = ls())
library(lubridate)
library(dplyr)


data <- read.table("household_power_consumption.txt", header=TRUE, sep = ";", dec = ".")

data_power <- data %>% filter(data$Date=="1/2/2007" | data$Date =="2/2/2007")

data_power$Global_active_power <- as.numeric(data_power$Global_active_power)

data_power$timestamp <- strptime(paste(data_power$Date, data_power$Time,sep=" "), "%d/%m/%Y %H:%M:%S") 

png("plot2.png", width=480, height=480)

plot(data_power$timestamp, data_power$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()

