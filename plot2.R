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
message("generating plot2.png")
png("plot2.png", width=480, height=480, units="px", bg="white")
# do the plot!
plot(data$DateTime, data$Global_active_power, type="l",
	xlab="",
	ylab="Global Active Power (kilowatts)")
message("done")
dev.off()
