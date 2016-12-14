

setwd("./course 4/")
getwd()

dsn <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

subSetDsn <- subset(dsn, dsn$Date %in% c("1/2/2007","2/2/2007"))

datetime <- strptime(paste(subSetDsn$Date, subSetDsn$Time), format="%d/%m/%Y %H:%M:%S")

GAP <- as.numeric(subSetDsn$Global_active_power)
png("plot2.png", width=480, height=480, units="px")
plot(datetime, GAP, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
