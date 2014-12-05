# set working directory 
setwd('~/Gitrs/ExData_Plotting1')

# make sure the plots folder exists
if (!file.exists('figure')) {
        dir.create('figure')
}

# load data
source('cleandata.R')

# open device
png(filename='figure/plot1.png',width=480,height=480,units='px')

# plot data
hist(power.consumption$GlobalActivePower,main='Global Active Power',xlab='Global Active Power (kilowatts)',col='red')

# Turn off device
x<-dev.off()