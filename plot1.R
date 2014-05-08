## Read data from exdata-data-household_power_consumption

MyData <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?",
                   colClasses="character")

## Read and subset data from the dates 2007-02-01 and 2007-02-02

MyData <- MyData[MyData$Date == "2/2/2007" | MyData$Date == "1/2/2007",]

## Convert to numeric vlaues for plotting

PlotData <- as.numeric(MyData$Global_active_power)

## Name the file and Construct the plot and save it to a PNG file 
## with a width of 480 pixels and a height of 480 pixels

png(filename="plot1.png", width=480, height=480)

hist(PlotData, col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")

## close plotting device

dev.off()