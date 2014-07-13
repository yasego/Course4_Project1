#Read data
dat <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'),header=F, sep=';')
colnames(dat) <-names(read.table('household_power_consumption.txt', header=TRUE,sep=";",nrows=1))
Sys.setlocale("LC_TIME", "English")
datetime <- paste(dat$Date,dat$Time)
dat$datetime_fixed  <- strptime(datetime,format ="%d/%m/%Y %H:%M:%S")

#Plot4 : directly to a png device
png(file ="plot4.png")

par(mfrow = c(2,2))
with(dat, {
        #1st
        plot(datetime_fixed, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
        #2nd
        plot(datetime_fixed, Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
        #3rd
        plot(datetime_fixed, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", col = "black" )
        lines(datetime_fixed, Sub_metering_2, type = "l", col = "red")
        lines(datetime_fixed, Sub_metering_3, type = "l", col = "blue")
        legend("topright",col = c("black", "red", "blue"),
               lty = c(1,1,1), 
               bty = "black",
               lwd = c(2,2,2),
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        #4th
        plot(datetime_fixed, Global_reactive_power, type ="l", xlab = "datetime")
})

#Copy plot to png device
dev.off()