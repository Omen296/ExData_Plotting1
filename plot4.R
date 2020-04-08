library(lubridate) #Used for formatting the data
if(exists("subdata")==FALSE){ #This is just a way to unpack the data and the if is there to avoid loading the full set over and over
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="./householdpower.zip", method="curl")
  unzip("householdpower.zip")
  data<-read.table("household_power_consumption.txt", sep = ";", header = TRUE)}
subdata<-subset(data, Date=="1/2/2007" | Date=="2/2/2007")  #Subsets the data
subdata$AbsoluteTime<-paste(subdata$Date, subdata$Time, sep="/") #Joins the hours and days
subdata$AbsoluteTime<-dmy_hms(subdata$AbsoluteTime) #Changes the class to Date
par(mfcol=c(2,2), mar=c(4.2,4.1,4.1,2.1)) #Sets the canvas and changes the margins
plot(subdata$AbsoluteTime, subdata$Global_active_power, type="l", xlab = "", ylab="Global Active Power (kilowatts)")
subdata$Sub_metering_2<-as.numeric(as.character(subdata$Sub_metering_2)) #For some reason being a vector messes things up
plot(subdata$AbsoluteTime, subdata$Sub_metering_1, type="l", xlab = "", ylab="Energy sub metering")
lines(subdata$AbsoluteTime, subdata$Sub_metering_2, col="red")
lines(subdata$AbsoluteTime, subdata$Sub_metering_3, col="blue")
legend("topright", bty = "n",lty = 1, col=c("black","red", "blue"),legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
subdata$Voltage<-as.numeric(as.character(subdata$Voltage)) #Same as before, the units were weird
plot(subdata$AbsoluteTime, subdata$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(subdata$AbsoluteTime, subdata$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.copy(png, 'plot4.png')
dev.off()

