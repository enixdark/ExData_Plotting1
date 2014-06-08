source("load.R")

plot4 <- function(file="household_power_consumption.txt",destinyfile=getwd()) {
    #Load data from the file into the variable
    #Due to the data file is large,so when call function,it'll take about 1-3 minutes
    data <- loaddata(file)
    
    if(is.null(data)){
        print(" Unable to create the image ")
    }
    else{
        print("finish ! the image plot4 is created ")
        
        #create a plot4.png file in the path specified through "destinyfile"
        #if destinyfile doesn't have a path specified,it'll use the current directory
        png(filename=paste(destinyfile,"plot4.png",sep="/"),width=480,height=480)
        #divide a canvas/window into 4 equal parts
        par(mfrow=c(2,2))
        
        #creat the "Global Active Power" plot with type "l"
        plot(data$Time, data$Global_active_power,xlab="",
             ylab="Global Active Power",type="l",)
        
        #creat the "Voltage" plot
        plot(data$Time, data$Voltage,xlab="datetime", ylab="Voltage",type="l")
        
        #creat the "Energy sub metering" plot
        plot(data$Time, data$Sub_metering_1, col="black",
             xlab="", ylab="Energy sub metering",type="l")
        lines(data$Time, data$Sub_metering_2, col="red")
        lines(data$Time, data$Sub_metering_3, col="blue")
        legend("topright",col=c("black", "red", "blue"),
               c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),box.lwd=0,lty=1)
        
        #creat the "Global_reactive_power" plot with type "n"
        plot(data$Time, data$Global_reactive_power, type="n",xlab="datetime", 
             ylab="Global_reactive_power")
        lines(data$Time, data$Global_reactive_power)
        
        dev.off()
    }
}