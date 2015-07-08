## Variables are separated by semi-colon, NA are ?
message("loading data..")
dt <- read.table('household_power_consumption.txt', header=T, na.strings='?', sep=';')
# limit data to two days in Feb
data <- dt[(dt$Date == '1/2/2007' | dt$Date == '2/2/2007'),]
# free some memory
rm(dt)
message("generating plot1.png")
png("plot1.png", width=480, height=480, units="px", bg="white")
# plot histogram
hist(data$Global_active_power, col="red", main="Global Active Power",
	xlab="Global Active Power (kilowatts)", ylab="Frequency")
# close it, or no file!
message("done")
dev.off()