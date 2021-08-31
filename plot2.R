plot2 <- function(){
  
  library(tidyverse)
  library(sqldf)
  library(lubridate)
  
  power <- read.csv.sql("household_power_consumption.txt",
                        sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007'",
                        sep = ";")
  
  
  power <- mutate(power,
                  datetime = strptime(
                    paste(Date, Time),"%d/%m/%Y %H:%M:%S"))
  
  png(filename = "plot2.png", width = 480, height = 480)
  
  plot(power$datetime, power$Global_active_power,
       xlab = "",
       ylab = "Global Active Power(kilowatts)",
       type = "l")
  
  dev.off() # close png device for next plot
}