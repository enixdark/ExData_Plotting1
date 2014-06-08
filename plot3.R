source("load.R")

plot3 <- function(file="household_power_consumption.txt",destinyfile=getwd()) {
    #Load data from the file into the variable
    #Due to the data file is large,so when call function,it'll take about 1-3 minutes
    data <- loaddata(file)
    
    if(is.null(data)){
        sprintf(" Unable to create the image ")
    }
    else{
        sprintf("finish ! the image plot3 is created ")
        
        #create a plot3.png file in the path specified through "destinyfile"
        #if destinyfile doesn't have a path specified,it'll use the current directory
        png(filename=paste(destinyfile,"plot3.png",sep="/"),width=480,height=480)
        
        
        plot(data$Time, data$Sub_metering_1, type="l", col="black",
             ylab="Energy sub metering",xlab="")
        lines(data$Time, data$Sub_metering_3, col="blue")
        lines(data$Time, data$Sub_metering_2, col="red")
        legend("topright",
               col=c("black", "red", "blue"),
               c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),box.lwd=0,
               lty=1)
        
        dev.off()
    }
}