data <- subset(read.table("household_power_consumption.txt", 
header = TRUE, sep = ";",na.strings = "?"), 
Date == '1/2/2007' | Date == '2/2/2007', )


dates <- as.character(data$Date)

times <- as.character(data$Time)

x <- unlist(lapply(paste(dates, times), function(x) return(paste(
	substr(x, 3, 4), substr(x, 1, 2), substring(x, 7)))))

x = strptime(x, "%m/%d/%y %H:%M:%S") 

png(filename = "plot2.png", width = 480, height = 480,
    units = "px", pointsize = 12, bg = "white", res = NA,
    restoreConsole = TRUE)

plot(x, data$Global_active_power, type = "l", xlab = "", 
ylab = "Global Active Power (kilowatts)")

dev.off()