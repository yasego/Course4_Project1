
#Read data
dat <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'),header=F, sep=';')
colnames(dat) <-names(read.table('household_power_consumption.txt', header=TRUE,sep=";",nrows=1))
Sys.setlocale("LC_TIME", "English")
datetime <- paste(dat$Date,dat$Time)
dat$datetime_fixed  <- strptime(datetime,format ="%d/%m/%Y %H:%M:%S")

#Plot 1 : plot on the screen
with(dat, hist(Global_active_power, col = "red",main = "Global Active Power", 
               xlab ="Global Active Power(kilowatts)" )) 

#Copy plot to png device
dev.copy(png, file = "plot1.png")
dev.off()
