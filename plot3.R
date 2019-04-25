householdpowerconsumption<-read.table("household_power_consumption.txt",sep = ";",header = T,dec = ".",stringsAsFactors = F)

cropdata<-subset(householdpowerconsumption,Date=="1/2/2007"|Date=="2/2/2007")

cropdata$Global_active_power<-as.numeric(cropdata$Global_active_power)


DateTime<-paste(cropdata$Date,cropdata$Time,sep = " ")
DateTime<-strptime(DateTime,"%d/%m/%Y %H:%M:%S")

with(cropdata,plot(DateTime,Sub_metering_1,type = "l",xlab = "",ylab = "Global Active Power (kilowatts)"))
with(cropdata,lines(DateTime,Sub_metering_2,col="red"))
with(cropdata,lines(DateTime,Sub_metering_3,col="blue"))

legend("topright",col=c("black","red","blue"),lty =1,lwd = 2,  legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex = .75)

dev.copy(png,file="plot3.png",height=480,width=480,units="px")

dev.off()








