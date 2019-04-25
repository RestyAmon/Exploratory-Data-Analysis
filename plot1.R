householdpowerconsumption<-read.table("household_power_consumption.txt",sep = ";",header = T,dec = ".",stringsAsFactors = F)

cropdata<-subset(householdpowerconsumption,Date=="1/2/2007"|Date=="2/2/2007")


cropdata$Global_active_power<-as.numeric(cropdata$Global_active_power)


with(cropdata,hist(Global_active_power,ylab = "Frequency",xlab = "Global Active Power (kilowatts)", main="Global Active Power",col="red"))

dev.copy(png,file="plot1.png",height=480,width=480,units="px")

dev.off()
