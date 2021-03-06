# Peer-graded Assignment: Course Project 1
# plot 1

### clear enviroment
rm(list = ls())

### Load data
HPC <- read.table("household_power_consumption.txt",
                  header = TRUE, 
                  sep = ";",
                  na.strings = "?")

## transform date
HPC$Date <- as.Date(HPC$Date, "%d/%m/%Y")

## subset
HPC2 <- subset(HPC, HPC$Date >= "2007-02-01" & HPC$Date <= "2007-02-02")

## transform Date and time
HPC2$Datetime <- strptime(paste(HPC2$Date, HPC2$Time), "%Y-%m-%d %H:%M:%S")
HPC2$Datetime <- as.POSIXct(HPC2$Datetime)

# plot 1

# Open PNG device
png(file = "plot1.png", width = 480, height = 480, units = "px")

hist(HPC2$Global_active_power,
     col = "red",
     ylab = "Frequency",
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")

# Close PNG device!
dev.off()



