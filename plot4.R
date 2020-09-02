## read the data 
data <- read.table("./household_power_consumption.txt", sep=";", header=TRUE)
dat <- data[(data$Date == "1/2/2007" | data$Date == "2/2/2007"),]

## Adjust the data.
dat$timeStamp <- strptime(paste(dat$Date, dat$Time), "%d/%m/%Y %H:%M:%S")
dat$Global_active_power <- as.numeric(dat$Global_active_power)
dat$Sub_metering_1 <- as.numeric(dat$Sub_metering_1)
dat$Sub_metering_2 <- as.numeric(dat$Sub_metering_2)


## Set mfrow and open up the graphics device.
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))

## Top Left: plot 2
with(dat, plot(timeStamp, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))

## Top Right 
with(dat, plot(timeStamp, Voltage, type="l", xlab="datetime"))

## Bottom Left: plot 3
plot(dat$timeStamp, dat$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
points(dat$timeStamp, dat$Sub_metering_2, type="l", col="red")
points(dat$timeStamp, dat$Sub_metering_3, type="l", col="blue")
legend("topright", bty="n", lty=c(1,1,1), col=c("black", "red", "blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

## Bottom Right
with(dat, plot(timeStamp, Global_reactive_power, type="l", xlab="datetime"))

dev.off()
