loaddata <- function(file_data=""){
    if(!file.exists(file_data)){
        print("error ,file not exists")
        return(NULL)
    }
    else{
        setClass("CDate")
        setAs("character","CDate", function(from) as.Date(from, format="%d/%m/%Y"))
       
        data <- read.table(file=file_data, 
                           header=TRUE,
                           strip.white=TRUE,
                           sep=";",
                           na="?",
                           colClasses=c("CDate","character",rep("numeric",7)))
        
        data$Time <- strptime(paste(data$Date,data$Time),format="%Y-%m-%d %H:%M:%S")
        return(data[data$Date %in% as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d"),])
                           
    }
}

