data <- subset(read.table("household_power_consumption.txt", 
header = TRUE, sep = ";",na.strings = "?"), 
Date == '1/2/2007' | Date == '2/2/2007', )

dates <- as.character(data$Date)

times <- as.character(data$Time)

x <- unlist(lapply(paste(dates, times), function(x) return(paste(
	substr(x, 3, 4), substr(x, 1, 2), substring(x, 7)))))

x = strptime(x, "%m/%d/%y %H:%M:%S")

plot(x, data$Sub_metering_1, type = "l", ylab = "Energy sub metering", 
xlab = " ")

lines(x, data$Sub_metering_2, type = "l", col = "red")

lines(x, data$Sub_metering_3, type = "l", col = "blue")

legend("topright", lty = 1, col = c("black", "red", "blue"), 

legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.8)