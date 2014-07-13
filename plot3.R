#Read data
dat <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'),header=F, sep=';')
colnames(dat) <-names(read.table('household_power_consumption.txt', header=TRUE,sep=";",nrows=1))
Sys.setlocale("LC_TIME", "English")
datetime <- paste(dat$Date,dat$Time)
dat$datetime_fixed  <- strptime(datetime,format ="%d/%m/%Y %H:%M:%S")

#Plot3 : directly to a png device
png(file ="plot3.png")

with(dat, plot(datetime_fixed,Sub_metering_1, type = "l",xlab = "", ylab = "Energy sub metering", col = "black" ))
with(dat, lines(datetime_fixed, Sub_metering_2, type = "l", col = "red"))
with(dat, lines(datetime_fixed, Sub_metering_3, type = "l", col = "blue"))

legend("topright",col = c("black", "red", "blue"),
       lty = c(1,1,1), 
       bty = "black",
       lwd = c(2,2,2),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Close Device
dev.off()