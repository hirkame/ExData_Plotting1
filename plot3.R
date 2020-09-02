## read the data 
data <- read.table("./household_power_consumption.txt", sep=";", header=TRUE)
dat <- data[(data$Date == "1/2/2007" | data$Date == "2/2/2007"),]

## Adjust the data.
dat$timeStamp <- strptime(paste(dat$Date, dat$Time), "%d/%m/%Y %H:%M:%S")
dat$Global_active_power <- as.numeric(dat$Global_active_power)
dat$Sub_metering_1 <- as.numeric(dat$Sub_metering_1)
dat$Sub_metering_2 <- as.numeric(dat$Sub_metering_2)

## plot and save as png.
png("plot3.png", width = 480, height = 480)
plot(dat$timeStamp, dat$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
points(dat$timeStamp, dat$Sub_metering_2, type="l", col="red")
points(dat$timeStamp, dat$Sub_metering_3, type="l", col="blue")
legend("topright", lty=c(1,1,1), col=c("black", "red", "blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
