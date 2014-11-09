rm(list = ls())

#set appropiate directory
setwd("~/Documents/coursera4")

#read in the data and subset observations of interest
d = read.table("household_power_consumption.txt",sep = ";",header = TRUE,as.is = TRUE)

d$Date = as.character(d$Date)
Date1 = "1/2/2007"
Date2 = "2/2/2007"
df = d[d$Date == Date1 | d$Date == Date2,]

#create histogram and export as png
png("plot1.png",units = "px",width = 480,height = 480)
hist(as.numeric(df$Global_active_power),col = "red",
          xlab = "Global Active Power (Kilowatts)", main = "Global Active Power")
dev.off()
             
