# Plot 1. Data set should be in workdir with scripts.
setwd("./Documents/R/course 4/")
outdir<- getwd()

zipF<- "./exdata_data_household_power_consumption.zip"
dataFile <- unz(zipF, filename="household_power_consumption.txt", open = "r")

# Read Data
data <- read.csv("household_power_consumption.txt", na.string="?", sep=";")

# sub set data as required
data <- data[(data$Date=="1/2/2007" | data$Date=="2/2/2007"),]

# Combine Date and Time
data$DateTime <- strptime(paste(data$Date, data$Time, sep=" "), 
                          format="%d/%m/%Y %H:%M:%S")

# Open png device
png("plot1.png", width=480, height=480)

# Plot the graph
hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", col="red")

# Turn off device
dev.off()
