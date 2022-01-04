library(lubridate)
library(dplyr)


data <- read.table("household_power_consumption.txt", header=TRUE, sep = ";", dec = ".")

data_power <- data %>% filter(data$Date=="1/2/2007" | data$Date =="2/2/2007")

data_power$Global_active_power <- as.numeric(data_power$Global_active_power)

png("plot1.png", width=480, height=480)

hist(data_power$Global_active_power, col="red",
     main="Global Active Power", xlab="Global Active Power(kilowatts)")

