library(lubridate) #Used for formatting the data
if(exists("subdata")==FALSE){ #This is just a way to unpack the data and the if is there to avoid loading the full set over and over
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="./householdpower.zip", method="curl")
  unzip("householdpower.zip")
  data<-read.table("household_power_consumption.txt", sep = ";", header = TRUE)}
subdata<-subset(data, Date=="1/2/2007" | Date=="2/2/2007") #Subsets
subdata$AbsoluteTime<-paste(subdata$Date, subdata$Time, sep="/") #Joins
subdata$AbsoluteTime<-dmy_hms(subdata$AbsoluteTime) #CHanges the class
subdata$Sub_metering_2<-as.numeric(as.character(subdata$Sub_metering_2)) #For some reason it doesnt work as a factor and the conversion to numeric needs to be rondabout
plot(subdata$AbsoluteTime, subdata$Sub_metering_1, type="l", xlab = "", ylab="Energy sub metering")
lines(subdata$AbsoluteTime, subdata$Sub_metering_2, col="red")
lines(subdata$AbsoluteTime, subdata$Sub_metering_3, col="blue")
legend("topright",lty = 1, col=c("black","red", "blue"),legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
dev.copy(png, 'plot3.png')
dev.off()


