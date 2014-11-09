rm(list = ls())

#set appropiate directory
setwd("~/Documents/coursera4")

#read in the data and subset observations of interest
d = read.table("household_power_consumption.txt",sep = ";",header = TRUE,as.is = TRUE)

d$Date = as.character(d$Date)
Date1 = "1/2/2007"
Date2 = "2/2/2007"
df = d[d$Date == Date1 | d$Date == Date2,]

#combine both data and time into one column
dateTime = paste(df$Date,df$Time)
df1 = cbind(dateTime,df)

#change to time series object so we can graph it
x = as.data.frame(ts(df1))

##set tick marks where thursday,friday, and saturday start
ticks = c(1,1440,2880)

#plot time series and export as png
png("plot2.png",units = "px", width = 480,height = 480)
plot(x = x$dateTime,y = x$Global_active_power,type = "l",xaxt = "n",
     ylab = "Global Active Power (Kilowatts",xlab = NA)
axis(side = 1,at = ticks,labels = c("Thu","Fri","Sat"))
dev.off()






