#----------------------------------------------------------------
# Coursera - Exploratory Analysis - Course Project 1
#----------------------------------------------------------------
# S.Vercellotti - January 2015
#----------------------------------------------------------------
# Plot4
#----------------------------------------------------------------

## set the working directory
setwd("C:/Stéphane/Coursera/Data Science/Exploratory Data Analysis/CourseProject1")
## read data sets
data       <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?", stringsAsFactors = FALSE)
## add a datetime column
data$datetime <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y%H:%M:%S")
## Subset dataframe in order to keep only observations for 01/02/2007 and 02/02/2007
df <- subset(data, datetime >= strptime("01/02/2007 00:00:00", "%d/%m/%Y %H:%M:%S") & datetime <= strptime("02/02/2007 23:59:59", "%d/%m/%Y %H:%M:%S"))
## define local variable for language (labels on x axis)
Sys.setlocale("LC_TIME", "English")

##------------
## plot 4
##------------
png(file="plot4.png",width = 480, height = 480)  

par(mfrow=c(2,2))
par(mar=c(4,4,2,2))

# upper left
plot(df$datetime,df$Global_active_power,type="l",xlab = "",ylab="Global Active Power")
# upper right
plot(df$datetime,df$Voltage,type="l",xlab = "datetime",ylab="Voltage")
#lower left corner
plot(df$datetime,df$Sub_metering_1,type="n", xlab = "",ylab="Energy sub metering")
points(df$datetime,df$Sub_metering_1,type="l")
points(df$datetime,df$Sub_metering_2,type="l",col="red")
points(df$datetime,df$Sub_metering_3,type="l",col="blue")
legend("topright",pch="_",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#lower right corner
plot(df$datetime,df$Global_reactive_power,type="l",xlab = "datetime",ylab="Global_reactive_power")

dev.off()
