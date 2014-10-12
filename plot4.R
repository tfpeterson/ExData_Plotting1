##JHDSS, Exploratory Data Analysis, Course Project 1

##Individual household electric power consumption Data Set 
##https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption

#assumes "household_power_consumption.txt" is in current directory

hpc <- read.table("household_power_consumption.txt",header = T, sep=";", 
	na.strings = "?", stringsAsFactors = F)

hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")
hpc$datetime <- paste(hpc$Date, hpc$Time)
hpc$datetime <- strptime(hpc$datetime, "%Y-%m-%d %H:%M:%S")

hpc_02.2007 <- subset(hpc, hpc$Date >= as.Date("2007-02-01") &
	hpc$Date <= as.Date("2007-02-02"))

str(hpc_02.2007)

png(filename = "plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
plot(hpc_02.2007$datetime, hpc_02.2007$Global_active_power, type="l", xlab =
	"", ylab = "Global Active Power (kilowatts)")
plot(hpc_02.2007$datetime, hpc_02.2007$Voltage, type="l", xlab =
	"datetime", ylab = "Voltage")
plot(hpc_02.2007$datetime, hpc_02.2007$Sub_metering_1, type="l", xlab =
	"", ylab = "Energy sub metering", col = "black")
lines(hpc_02.2007$datetime, hpc_02.2007$Sub_metering_2, col = "red")
lines(hpc_02.2007$datetime, hpc_02.2007$Sub_metering_3, col = "blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2",
	"Sub_metering_3"), col = c("black", "red", "blue"), lwd = 1, bty = "n")
plot(hpc_02.2007$datetime, hpc_02.2007$Global_reactive_power, type="l", xlab =
	"datetime", ylab = "Global_reactive_power")
par(mfrow=c(1,1))
dev.off()
