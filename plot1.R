if (!file.exists("household_power_consumption.txt")) {
  url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(url, destfile = "dataset.zip")
  unzip("dataset.zip")
}
library(data.table)

data <- fread("household_power_consumption.txt", sep = ";", na.strings = "?")
filtered_data <- data[Date %in% c("1/2/2007", "2/2/2007")]
filtered_data[, Datetime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]


# Create the plot
png("plot1.png", width = 480, height = 480)
hist(filtered_data$Global_active_power, col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.off()