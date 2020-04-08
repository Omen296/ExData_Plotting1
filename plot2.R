library(lubridate) #Used for formatting the data
if(exists("subdata")==FALSE){ #This is just a way to unpack the data and the if is there to avoid loading the full set over and over
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="./householdpower.zip", method="curl")
  unzip("householdpower.zip")
  data<-read.table("household_power_consumption.txt", sep = ";", header = TRUE)}
subdata<-subset(data, Date=="1/2/2007" | Date=="2/2/2007") #Subset
subdata$AbsoluteTime<-paste(subdata$Date, subdata$Time, sep="/") #Joins the Date and Time
subdata$AbsoluteTime<-dmy_hms(subdata$AbsoluteTime) #Changes the class
plot(subdata$AbsoluteTime, subdata$Global_active_power, type="l", xlab = "", ylab="Global Active Power (kilowatts)")
dev.copy(png, 'plot2.png')
dev.off()

