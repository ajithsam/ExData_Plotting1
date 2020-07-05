getwd()

#Reading the Data
data_full <- read.csv("power_consumption.txt", header=T, sep=';', 
                      na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, 
                      comment.char="", quote='\"')

#Fetching the necessary data
data1 <- subset(data_full, Date %in% c("1/2/2007","2/2/2007"))

#Formatting the data
data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")

#Adding the date and time
datetime <- paste(as.Date(data1$Date), data1$Time)

#Reformatting the dateime
data1$Datetime <- as.POSIXct(datetime)

#Writing the graph
png("plot2.png", width=480, height=480)
with(data1, {
  plot(Global_active_power~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
})
dev.off()



