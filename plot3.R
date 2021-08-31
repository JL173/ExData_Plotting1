plot3 <- function(){
  
  library(tidyverse)
  library(sqldf)
  library(lubridate)
  
  power <- read.csv.sql("household_power_consumption.txt",
                        sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007'",
                        sep = ";")
  
  
  power <- mutate(power,
                  datetime = strptime(
                    paste(Date, Time),"%d/%m/%Y %H:%M:%S"))
  
  png(filename = "plot3.png", width = 480, height = 480)
  
  par(mfrow = c(1, 1))
  
  
  plot(power$datetime, power$Sub_metering_1, col = "black",
       type = "l", xlab = "", ylab = "Energy sub metering")
  
  lines(power$datetime, power$Sub_metering_2, col = "red",
        xaxt = "n", yaxt = "n")
  
  lines(power$datetime, power$Sub_metering_3, col = "blue",
        xaxt = "n", yaxt = "n")
  
  legend("topright",
         legend = c("Sub_metering_1",
                    "Sub_metering_2",
                    "Sub_metering_3"),
         col = c("black", "red", "blue"),
         lty = 1)
  
  dev.off() # close png device for next plot
}