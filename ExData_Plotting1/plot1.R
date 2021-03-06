temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
data <- read.table(unz(temp, "household_power_consumption.txt"),header=TRUE,sep=";")
unlink(temp)
data$Date <- as.Date(data$Date,format="%d/%m/%Y")
subData1 <- subset(data,Date=="2007-02-01")
subData2 <- subset(data,Date=="2007-02-02")
dataSubset <- rbind(subData1,subData2)
hist(as.numeric(as.character(dataSubset$Global_active_power)),main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red")