## Read data from exdata-data-household_power_consumption

MyData <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?",
                   colClasses="character")

## Read and subset data from the dates 2007-02-01 and 2007-02-02

MyData <- MyData[MyData$Date == "2/2/2007" | MyData$Date == "1/2/2007",]
 
## put date & time together and creat ad day/time format 

MyData$Time <- strptime(paste(MyData$Date, MyData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

## Name the file and construct the plots and save it to a PNG file 
## with a width of 480 pixels and a height of 480 pixels

png(filename="plot4.png", width=480, height=480)

## Set up 2 panel x 2 panel plot area
par(mfcol = c(2,2))

## Construct the first plot
plot(MyData$Time,data$Global_active_power, type="l", xlab="",
     ylab="Global Active Power (kilowatts)")

## Construct the second plot
plot(MyData$Time, MyData$Sub_metering_1, type="l", col="black", ylab="Energy sub metering", xlab="")

   ## Add in lines
  	lines(MyData$Time, MyData$Sub_metering_2, type="l", col="red")
	lines(MyData$Time, MyData$Sub_metering_3, type="l", col="blue")

   ## Add a legend
	legend("topright", lty=1, cex=.85, bty="n", col = c("black", "red", "blue"), 
	legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))

## Construct the third plot
plot(MyData$Time,MyData$Voltage, type="l", xlab="datetime", ylab="Voltage")

## Construct the fourth plot
plot(MyData$Time,MyData$Global_reactive_power, type="l", xlab="datetime", 
     ylab="Global_reactive_power")

## Close plotting device
dev.off()