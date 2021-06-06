library('data.table')

raw_data <- fread('./ExData_Plotting1/household_power_consumption.txt', na.strings='?')
raw_data[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]
raw_data[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

subset_data <- raw_data[(dateTime >= "2007-02-01") & (dateTime < '2007-02-03')]

png('./ExData_Plotting1/plot4.png')
par(mfrow=c(2,2))

plot(x=subset_data[, dateTime], y=subset_data[, Global_active_power], type='l',
     xlab='', ylab='Global Active Power')
plot(x=subset_data[, dateTime], y=subset_data[, Voltage], type='l', xlab='datetime',
     ylab='Voltage')

plot(x=subset_data[, dateTime], y=subset_data[, Sub_metering_1], type='l',
     xlab='', ylab='Energy sub metering')
lines(subset_data[, dateTime], subset_data[, Sub_metering_2], col='red')
lines(subset_data[, dateTime], subset_data[, Sub_metering_3], col='blue')
legend('topright', col=c('black','red','blue'), 
       c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), lty=c(1,1),
       bty='n', cex=.8)

plot(x=subset_data[, dateTime], y=subset_data[, Global_reactive_power], type='l',
     xlab='datetime', ylab='Global_reactive_power')


dev.off()