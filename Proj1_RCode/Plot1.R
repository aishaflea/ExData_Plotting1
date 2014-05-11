data <- subset(read.table("household_power_consumption.txt", 
header = TRUE, sep = ";",na.strings = "?"), 
Date == '1/2/2007' | Date == '2/2/2007', )

png(filename = "plot1.png", width = 480, height = 480,
    units = "px", pointsize = 12, bg = "white", res = NA,
    restoreConsole = TRUE)

hist(data$Global_active_power, col = "red", main = "Global Active Power", 
xlab ="Global Active Power (kilowatts)", ylab ="Frequency")

dev.off()