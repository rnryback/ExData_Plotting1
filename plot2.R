# set working directory
setwd('~/Gitrs/ExData_Plotting1')

# required packages
library(data.table)
library(lubridate)

# check to see if the existing tidy data set exists; if not, make it...
if (!file.exists('household_power_consumption.txt')) {
        
        # download the zip file and unzip
        file.url<-'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
        download.file(file.url,destfile='power_consumption.zip', method="curl")
        unzip('power_consumption.zip',exdir='./',overwrite=F)
        
        # read the raw table and limit to 2 days
        variable.class<-c(rep('character',2),rep('numeric',7))
        power.consumption<-read.table('household_power_consumption.txt',header=TRUE,
                                      sep=';',na.strings='?',colClasses=variable.class)
        power.consumption<-power.consumption[power.consumption$Date=='1/2/2007' | power.consumption$Date=='2/2/2007',]
        
        # clean up the variable names and convert date/time fields
        cols<-c('Date','Time','GlobalActivePower','GlobalReactivePower','Voltage','GlobalIntensity',
                'SubMetering1','SubMetering2','SubMetering3')
        colnames(power.consumption)<-cols
        power.consumption$DateTime<-dmy(power.consumption$Date)+hms(power.consumption$Time)
        power.consumption<-power.consumption[,c(10,3:9)]
        
        # write a clean data set to the directory
        write.table(power.consumption,file='household_power_consumption.txt',sep='|',row.names=FALSE)
} else {
        
        power.consumption<-read.table('household_power_consumption.txt',header=TRUE,sep='|')
        power.consumption$DateTime<-as.POSIXlt(power.consumption$DateTime)
        
}

# open device
png(filename='plot2.png',width=480,height=480,units='px')

# plot data
plot(power.consumption$DateTime,power.consumption$GlobalActivePower,ylab='Global Active Power (kilowatts)', xlab='', type='l')

# close device
x<-dev.off()