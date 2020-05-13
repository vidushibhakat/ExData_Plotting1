dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,] #subsetting required data set

#str(subSetData)
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") #converting Date into a POSIXct variable 
globalActivePower <- as.numeric(subSetData$Global_active_power)
png("plot2.png", width=480, height=480) #opening png device
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)") #creating required plot
dev.off() #closing the png device