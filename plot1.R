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

#plot1 - Histogram
png("plot1.png", width=480, height=480)

hist(PlotData$Global_active_power, 
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)", 
     ylab="Frequency", 
     col="Red")

dev.off()