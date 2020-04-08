if(exists("subdata")==FALSE){ #This is just a way to unpack the data and the if is there to avoid loading the full set over and over
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="./householdpower.zip", method="curl")
  unzip("householdpower.zip")
  data<-read.table("household_power_consumption.txt", sep = ";", header = TRUE)}
subdata<-subset(data, Date=="1/2/2007" | Date=="2/2/2007") #Subsets the appropiate data
subdata$Global_active_power<-as.numeric(subdata$Global_active_power) #Changes data to numeric for ease of use
hist(subdata$Global_active_power, col="Red", main="Global Active Power", xlab = "Global Active Power") #Creates the histogram
dev.copy(png, 'plot1.png') #Prints
dev.off()



