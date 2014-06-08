source("load.R")
plot1 <- function(file="household_power_consumption.txt",destinyfile=getwd()){
    #Load data from the file into the variable
    #Due to the data file is large,so when call function,it'll take about 1-3 minutes
    data <- loaddata(file)
    if(is.null(data)){
        print("Unable to create the image")
    }
    else{
        print("finish ! the image plot1 is created")
        #create a plot1.png file in the path specified through "destinyfile"
        #if destinyfile doesn't have a path specified,it'll use the current directory
        png(filename=paste(destinyfile,"plot1.png",sep="/"),width=480,height=480)
        
        hist(data$Global_active_power,
             main="Global Active Power",
             xlab="Global Active Power (kilowatts)",
             ylab="Frequency",
             col="red")
        dev.off()
    }
}