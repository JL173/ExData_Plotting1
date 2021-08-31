plot1 <- function(){
  
  library(tidyverse)
  library(sqldf)
  library(lubridate)
  
  power <- read.csv.sql("household_power_consumption.txt",
                        sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007'",
                        sep = ";")
  
  
  power <- mutate(power,
                  datetime = strptime(
                    paste(Date, Time),"%d/%m/%Y %H:%M:%S"))
  
  png(filename = "plot1.png",
      width = 480, height = 480)
  hist(power$Global_active_power, col = "red",
       main = "Global Active Power",
       xlab = "Global Active Power (kilowatts)")
  dev.off() # close png device for next plot
}