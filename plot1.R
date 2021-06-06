library('data.table')

raw_data <- fread('./ExData_Plotting1/household_power_consumption.txt', na.strings='?')
#raw_data[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]
raw_data[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]

subset_data <- raw_data[(Date >= "2007-02-01") & (Date <= '2007-02-02')]
#print(head(subset_data))

png('./ExData_Plotting1/plot1.png')
hist(subset_data[, Global_active_power], main='Global Active Power',
     xlab="Global Active Power (kilowatts)", ylab='Frequency', col='red')
dev.off() 