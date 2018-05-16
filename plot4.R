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

#plot4 - 4 plots
png("plot4.png", width=480, height=480)

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(PlotData, {
  plot(Global_active_power~Datetime, 
       type="l", 
       ylab="Global Active Power", 
       xlab="")
  plot(Voltage~Datetime, 
       type="l", 
       ylab="Voltage", 
       xlab="datetime")
    plot(Sub_metering_1~Datetime,
       type="l",
       ylab="Energy sub metering",
       xlab="")
  lines(Sub_metering_2~Datetime,
        col='Red')
  lines(Sub_metering_3~Datetime,
        col='Blue')
  legend("topright", 
         col=c("black", "red", "blue"), 
         lty=1, 
         lwd=2, 
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         bty="n")
  plot(Global_reactive_power~Datetime, 
       type="l", 
       ylab="Global_reactive_power",
       xlab="datetime")
})

dev.off()