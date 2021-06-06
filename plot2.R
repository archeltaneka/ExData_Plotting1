library('data.table')

raw_data <- fread('./ExData_Plotting1/household_power_consumption.txt', na.strings='?')
raw_data[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]
raw_data[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

subset_data <- raw_data[(dateTime >= "2007-02-01") & (dateTime < '2007-02-03')]

png('./ExData_Plotting1/plot2.png')
plot(x=subset_data[, dateTime], y=subset_data[, Global_active_power], type='l',
     xlab='', ylab='Global Active Power (kilowatts)')
dev.off()
