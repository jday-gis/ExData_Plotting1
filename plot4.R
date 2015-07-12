
setwd("c:/Google\ Drive/Coursera/Exploratory\ Data\ Analysis")

da =read.table("household_power_consumption.txt", header=T, sep=";", na.string="?", stringsAsFactors = FALSE);

data <- da

data$Date <- as.Date(da$Date, "%d/%m/%Y")

data$Time <- strptime(paste(da$Date, da$Time), "%d/%m/%Y %H:%M:%S", tz="")

data.sub <- data[data$Date >= '2007-02-01' & data$Date <= '2007-02-02',]

######### Plot 1
png(filename="./plot1.png", width = 480, height = 480, units = "px")
hist(data.sub$Global_active_power, xlab = "Global Active Power (kilowatts)", col="red", main = "Global Active Power")
dev.off ();
######### Plot 1

######### Plot 2
png(filename="./plot2.png", width = 480, height = 480, units = "px")
plot(data.sub$Time, data.sub$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off ();
######### Plot 2

######### Plot 3
png(filename="./plot3.png", width = 480, height = 480, units = "px")
plot(data.sub$Time, data.sub$Sub_metering_1, col="black", type="l", xlab="", ylab="Energy sub metering")
lines(data.sub$Time, data.sub$Sub_metering_2, col="red")
lines(data.sub$Time, data.sub$Sub_metering_3, col="blue")
legend(x = "topright", y=NULL, c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd= c(2.5,2.5,2.5), col = c("black","red","blue"))
dev.off ();
######### Plot 3


######### Plot 4
png(filename="./plot4.png", width = 480, height = 480, units = "px")
par(mfrow=c(2,2))
plot(data.sub$Time, data.sub$Global_active_power, type="l", xlab="", ylab="Global Active Power")
plot(data.sub$Time, data.sub$Voltage, type="l", xlab="date / time", ylab="Voltage")

plot(data.sub$Time, data.sub$Sub_metering_1, col="black", type="l", xlab="", ylab="Energy sub metering")
lines(data.sub$Time, data.sub$Sub_metering_2, col="red")
lines(data.sub$Time, data.sub$Sub_metering_3, col="blue")
legend(x = "topright", y=NULL, c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd= c(2.5,2.5,2.5), col = c("black","red","blue"))

plot(data.sub$Time, data.sub$Global_reactive_power, type="l", xlab="date / time", ylab="Global Reactive Power")
dev.off ();
######### Plot 4
