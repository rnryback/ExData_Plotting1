# set working directory 
setwd('~/Gitrs/ExData_Plotting1')

# make sure the plots folder exists
if (!file.exists('figure')) {
        dir.create('figure')
}

# load data
source('cleandata.R')

# open device
png(filename='figure/plot3.png',width=480,height=480,units='px')

# plot data
lncol<-c('black','red','blue')
lbls<-c('Sub_metering_1','Sub_metering_2','Sub_metering_3')
plot(power.consumption$DateTime,power.consumption$SubMetering1,type='l',col=lncol[1],xlab='',ylab='Energy sub metering')
lines(power.consumption$DateTime,power.consumption$SubMetering2,col=lncol[2])
lines(power.consumption$DateTime,power.consumption$SubMetering3,col=lncol[3])

# add legend
legend('topright',legend=lbls,col=lncol,lty='solid')

# close device
x<-dev.off()