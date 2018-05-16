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

#plot2 - Plot
png("plot2.png", width=480, height=480)
with(PlotData, {
  plot(Global_active_power~Datetime,
       type="l",
       ylab="Global Active Power (kilowatts)", 
       xlab="")
})

dev.off()