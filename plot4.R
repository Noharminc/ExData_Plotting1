#########################################################################################
## FUNCTION plot4
##    Version           0.1
##    By                Noharminc
##    Date              20161030
##    Reason            Coursera | Datascience | Exploratory Data Analysis | Week 1 | Programming Assigment
##    Description       Create plot4
##    Input             https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
##    Output            plot1.png (in current WD)
#######################################################################################


plot4 <- function () {
      
      #download data
      zip <- c("household.zip")
      download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",zip,mode="wb")
      
      #unzip data
      unzip(zip)
      
      #read data
      household <- read.table("household_power_consumption.txt"
                              ,sep=";"
                              ,header=TRUE
                              ,stringsAsFactors=FALSE
                              ,na.strings = c("NA","?")
      )
      
      #subset 2007-02-01 and 2007-02-02
      subset <- household[as.character(household$Date) %in% c("1/2/2007", "2/2/2007"),]
      
      #clean up date & time
      subset$DateTime <- strptime(paste(subset$Date, subset$Time), format="%d/%m/%Y %H:%M:%S")
      within(subset,rm("Date","Time"))
      
      #open png, create graph, close png
      png(filename="plot4.png",width=480,height=480)
      par(mfrow=c(2,2))
      
      #plot1
      plot( subset$DateTime,
            subset$Global_active_power,
            main="",
            type="l",
            xlab="",
            ylab="Global Active Power (kilowatts)")
      #plot2
      plot( subset$DateTime,
            subset$Voltage,
            main="",
            type="l",
            xlab="datetime",
            ylab="Voltage")
      #plot3
      plot(subset$DateTime,
           subset$Sub_metering_1,
           type="l",
           col="black",
           ylab="Energy sub metering",
           xlab="")
      lines(subset$DateTime,
            subset$Sub_metering_2,
            col="red")
      lines(subset$DateTime,
            subset$Sub_metering_3,
            col="blue")
      legend("topright", 
             c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
             lty=c(1,1,1),
             lwd=c(1,1,1),
             col=c("black","red","blue"),
             bty="n")
      #plot4
      plot( subset$DateTime,
            subset$Global_reactive_power,
            main="",
            type="l",
            xlab="datetime",
            ylab="Global_reactive_power")
      dev.off()
      
}