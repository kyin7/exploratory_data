# process the original data file household_power_consumption.txt on Linux command as
# head -n 1 household_power_consumption.txt > power.txt
# grep '^[12]/2/2007' household_power_consumption.txt > power.txt
powr <- read.table("power.txt", sep=";", header=T,  na.strings="?")
powr$Date <- as.Date(powr$Date, format="%d/%m/%Y")
# plot the figure using graphics devices for PNG
png('plot2.png', width = 480, height = 480, units = "px")
date_time<-paste(powr$Date, powr$Time, sep=" ")
date_time<-strptime(date_time, "%Y-%m-%d %H:%M:%S")
first_date_time <- date_time[1]
time_diff <- date_time - first_date_time
first_day <- weekdays(date_time[1], abbreviate = T);
second_day <- weekdays(date_time[1]+24*3600, abbreviate = T)
third_day <- weekdays(date_time[1]+24*3600*2, abbreviate = T)
plot(time_diff, powr$Global_active_power, type="l", ylab="Global acitve power (kilowatts)", xlab="", xaxt="n")
ticks = c(time_diff[1], time_diff[1]+24*3600, time_diff[1]+24*3600*2)
axis(side = 1, at=ticks, labels=c(first_day, second_day, third_day));
dev.off()
