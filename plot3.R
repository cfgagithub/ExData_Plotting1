#Read Data
Data <- read.csv("household_power_consumption.txt",
                 header=T,
                 sep=';',
                 na.strings="?",
                 nrows=2075259, 
                 check.names=F, 
                 stringsAsFactors=F, 
                 comment.char="",
                 quote='\"')

#Subset and Format Data
PlotData <- subset(Data, Date %in% c("1/2/2007","2/2/2007"))
PlotData$Date <- as.Date(PlotData$Date, format="%d/%m/%Y")
DayofWeek <- paste(as.Date(PlotData$Date), PlotData$Time)
PlotData$Datetime <- as.POSIXct(DayofWeek)

#plot3 - 3 Subsets
png("plot3.png", width=480, height=480)

with(PlotData, {
  plot(Sub_metering_1~Datetime,
       type="l",
       ylab="Energy sub metering",
       xlab="")
  lines(Sub_metering_2~Datetime,
        col='Red')
  lines(Sub_metering_3~Datetime,
        col='Blue')
})

legend("topright", 
       col=c("black", "red", "blue"), 
       lty=1, 
       lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()