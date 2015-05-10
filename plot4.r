# setwd("./Coursera Files/Exploratory Data Analysis/Course Project 1")

# Read in the data file
con <- file("household_power_consumption.txt")
open(con)
first_line <- read.table(con, sep=";", nrows=1, stringsAsFactors=FALSE)
col_names <- character()
for (i in 1:length(first_line)){
    col_names[i] <- first_line[[i]]
}
epc_data <- read.table(con, header=FALSE, sep=";", col.names=col_names, skip=66636, nrows=2880, stringsAsFactors=FALSE)
close(con)

# Create a date_time variable to be used in plotting
date_temp <- as.Date(epc_data[,1],format = "%d/%m/%Y")
epc_data$date_time <- strptime(paste(date_temp, epc_data[,2]), format = "%Y-%m-%d %H:%M:%S")

remove(first_line, col_names, i, con, date_temp)

# Create the plot
png(file = "plot4.png")

# Save the default graphics parameters, and then prepare for a 2x2 grid of plots
par_default <- par()
par(mfrow = c(2,2))

with(epc_data, {
    plot(date_time, Global_active_power, main="", 
         xlab="", ylab = "Global Active Power",type="l")

    plot(date_time, Voltage, xlab="datetime", type="l")

    plot(date_time, Sub_metering_1, main="", xlab="", 
         ylab = "Energy sub metering",type="l")
    lines(date_time, Sub_metering_2,col="red")
    lines(date_time, Sub_metering_3,col="blue")
    legend("topright", bty="n", lty=c(1,1,1),col=c("black","red","blue"),
           legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
    plot(date_time, Global_reactive_power, xlab="datetime", type="l")
})

dev.off()
# Reset the graphics parameters to default
par(par_default)

