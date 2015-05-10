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
png("plot2.png", width=480, height=480, units="px", bg="white")
# do the plot!
plot(data$DateTime, data$Global_active_power, type="l",
	xlab="",
	ylab="Global Active Power (kilowatts)")
dev.off()
