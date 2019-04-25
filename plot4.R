
householdpowerconsumption<-read.table("household_power_consumption.txt",sep = ";",header = T,dec = ".",stringsAsFactors = F)

cropdata<-subset(householdpowerconsumption,Date=="1/2/2007"|Date=="2/2/2007")

cropdata$Global_active_power<-as.numeric(cropdata$Global_active_power)
cropdata$Global_reactive_power<-as.numeric(cropdata$Global_reactive_power)


DateTime<-paste(cropdata$Date,cropdata$Time,sep = " ")
DateTime<-strptime(DateTime,"%d/%m/%Y %H:%M:%S")



par(mfrow=c(2,2),mar=c(4,4,1,1),oma=c(0,0,0,0))
    
#1
with(cropdata,plot(DateTime,Global_active_power,type = "l",xlab = "",ylab = "Global Active Power"))
#2
with(cropdata,plot(DateTime,Voltage,type = "l",xlab = "datetime",ylab = "Voltage"))
#3
with(cropdata,plot(DateTime,Sub_metering_1,type = "l",xlab = "",ylab = "Energy Sub metering"))
with(cropdata,lines(DateTime,Sub_metering_2,col="red"))
with(cropdata,lines(DateTime,Sub_metering_3,col="blue"))
legend("topright",col=c("black","red","blue"),lty =1,lwd = 2,  legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex = .3,bty = "n")
#4
with(cropdata,plot(DateTime,Global_reactive_power,type = "l",xlab = "datetime",ylab = "Global_reactive_power"))

dev.copy(png,file="plot4.png",height=480,width=480,units="px")

dev.off()


