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

png(filename = "plot2.png", width = 480, height = 480)
plot(hpc_02.2007$datetime, hpc_02.2007$Global_active_power, type="l", xlab =
	"", ylab = "Global Active Power (kilowatts)")
dev.off()
