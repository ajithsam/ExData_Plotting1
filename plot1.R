getwd()

#Setting the path to the data directory
setwd("C:/Sam/R/coursera")

#Assigning the whole data to the variable
data_full <- read.csv("power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

#Subsetting the desired Data
data1 <- subset(data_full, Date %in% c("1/2/2007","2/2/2007"))

#Formatting the data
data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")

#Code for PNG
png("plot1.png", width=480, height=480)

#Graphical view
hist(data1$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.off()