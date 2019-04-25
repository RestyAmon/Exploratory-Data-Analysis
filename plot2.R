

householdpowerconsumption<-read.table("household_power_consumption.txt",sep = ";",header = T,dec = ".",stringsAsFactors = F)

cropdata<-subset(householdpowerconsumption,Date=="1/2/2007"|Date=="2/2/2007")

cropdata$Global_active_power<-as.numeric(cropdata$Global_active_power)


DateTime<-paste(cropdata$Date,cropdata$Time,sep = " ")
DateTime<-strptime(DateTime,"%d/%m/%Y %H:%M:%S")


with(cropdata,plot(DateTime,Global_active_power,type = "l",xlab = "",ylab = "Global Active Power (kilowatts)"))

dev.copy(png,file="plot2.png",height=480,width=480,units="px")

dev.off()









