
setwd("./R/course 4/")
getwd()

dsn <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetDsn <- subset(dsn, dsn$Date %in% c("1/2/2007","2/2/2007"))

datetime <- strptime(paste(subSetDsn$Date, subSetDsn$Time), format="%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetDsn$Global_active_power)
globalReactivePower <- as.numeric(subSetDsn$Global_reactive_power)
voltage <- as.numeric(subSetDsn$Voltage)

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, as.numeric(subSetDsn$Sub_metering_1), type="l", ylab="Energy Submetering", xlab="")
lines(datetime, as.numeric(subSetDsn$Sub_metering_2), type="l", col="red")
lines(datetime, as.numeric(subSetDsn$Sub_metering_3), type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="n")

plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
