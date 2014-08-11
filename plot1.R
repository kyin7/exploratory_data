# process the original data file household_power_consumption.txt on Linux command as
# head -n 1 household_power_consumption.txt > power.txt
# grep '^[12]/2/2007' household_power_consumption.txt > power.txt
powr <- read.table("power.txt", sep=";", header=T,  na.strings="?")
powr$Date <- as.Date(powr$Date, format="%d/%m/%Y")
# plot the figure using graphics devices for PNG
png("plot1.png", width = 480, height = 480, units = "px")
hist(powr[["Global_active_power"]], main="Global active power", xlab="Global acitve power (kilowatts)", col="red")
dev.off()
