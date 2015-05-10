## Variables are separated by semi-colon, NA are ?
data <- read.table('household_power_consumption.txt', header=T, na.strings='?', sep=';')
oneFeb <- data[data$Date == '1/2/2007',]
twoFeb <- data[data$Date == '2/2/2007',]
# getting one dataset
data <- rbind(oneFeb,twoFeb)
# free some memory
rm(oneFeb, twoFeb)
png("plot1.png", width=480, height=480, units="px", bg="white")
# plot histogram
hist(data$Global_active_power, col="red", main="Global Active Power",
	xlab="Global Active Power (kilowatts)", ylab="Frequency")
# close it, or no file!
dev.off()