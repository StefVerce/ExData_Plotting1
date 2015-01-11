#----------------------------------------------------------------
# Coursera - Exploratory Analysis - Course Project 1
#----------------------------------------------------------------
# S.Vercellotti - January 2015
#----------------------------------------------------------------
# Plot2
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
## plot 2
##------------
png(file="plot2.png",width = 480, height = 480)  
plot(df$datetime,df$Global_active_power,type="l", xlab = "", ylab="Global Active Power (kilowatts)")
dev.off()
