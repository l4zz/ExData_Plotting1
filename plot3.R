## Variables are separated by semi-colon, NA are ?
message("loading data..")
dt <- read.table('household_power_consumption.txt', header=T, na.strings='?', sep=';')
# limit data to two days in Feb
data <- dt[(dt$Date == '1/2/2007' | dt$Date == '2/2/2007'),]
# free some memory
rm(dt)
# new column for datetimes
data$DateTime <- paste(data$Date,data$Time)
# let R understand datetime column
data$DateTime <- strptime(data$DateTime,format="%d/%m/%Y %H:%M:%S")
message("generating plot3.png")
png("plot3.png", width=480, height=480, units="px", bg="white")
# do the plot, but no data
plot(data$DateTime, data$Sub_metering_1, type="n",
	xlab="", ylab="Energy sub metering")
# sub_metering_!
points(data$DateTime, data$Sub_metering_1, type="l", col="black")
points(data$DateTime, data$Sub_metering_2, type="l", col="red")
points(data$DateTime, data$Sub_metering_3, type="l", col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
	lty=c(1,1,1), col=c("black", "red", "blue"))
message("done")
dev.off()
