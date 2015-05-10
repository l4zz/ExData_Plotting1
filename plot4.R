data <- read.table('household_power_consumption.txt', header=T, na.strings='?', sep=';')
oneFeb <- data[data$Date == '1/2/2007',]
twoFeb <- data[data$Date == '2/2/2007',]
# getting one dataset
data <- rbind(oneFeb,twoFeb)
# free some memory
rm(oneFeb, twoFeb)

# new column for datetimes
data$DateTime <- paste(data$Date,data$Time)
# let R understand datetime column
data$DateTime <- strptime(data$DateTime,format="%d/%m/%Y %H:%M:%S")
png("plot4.png", width=480, height=480, units="px", bg="white")
# do the plots..
# columns filled row-wise: top left to top right, then bottom left to right
par(mfrow = c(2,2))
#topleft
plot(data$DateTime, data$Global_active_power, type="l",
	xlab="",
	ylab="Global Active Power")
plot(data$DateTime, data$Voltage, type="l",
	xlab="",
	ylab="Voltage")
plot(data$DateTime, data$Sub_metering_1, type="n",
	xlab="", ylab="Energy sub metering")
# sub_metering_!
points(data$DateTime, data$Sub_metering_1, type="l", col="black")
points(data$DateTime, data$Sub_metering_2, type="l", col="red")
points(data$DateTime, data$Sub_metering_3, type="l", col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
	lty=c(1,1,1), col=c("black", "red", "blue"), bty="n")
plot(data$DateTime, data$Global_reactive_power, type="l",
	xlab="datetime", ylab="Global_reactive_power")
dev.off()