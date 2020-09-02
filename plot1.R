## read the data 
data <- read.table("./household_power_consumption.txt", sep=";", header=TRUE)
dat <- data[(data$Date == "1/2/2007" | data$Date == "2/2/2007"),]
dat$timeStamp <- strptime(paste(dat$Date, dat$Time), "%d/%m/%Y %H:%M:%S")
dat$Global_active_power <- as.numeric(dat$Global_active_power)

## plot and save as png.
png("plot1.png", width = 480, height = 480)
hist(dat$Global_active_power, col="red", main="Global Ative Power", xlab="Global Active Power (kilowatts)")
dev.off()
