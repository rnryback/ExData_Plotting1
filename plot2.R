# set working directory 
setwd('~/Gitrs/ExData_Plotting1')

# make sure the plots folder exists
if (!file.exists('figure')) {
        dir.create('figure')
}

# load data
source('cleandata.R')

# open device
png(filename='figure/plot2.png',width=480,height=480,units='px')

# plot data
plot(power.consumption$DateTime,power.consumption$GlobalActivePower,ylab='Global Active Power (kilowatts)', xlab='', type='l')

# close device
x<-dev.off()