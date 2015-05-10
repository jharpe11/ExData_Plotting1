# Make sure the working directory is set to the location of the data
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

date_temp <- as.Date(epc_data[,1],format = "%d/%m/%Y")
epc_data$date_time <- strptime(paste(date_temp, epc_data[,2]), format = "%Y-%m-%d %H:%M:%S")

remove(first_line, col_names, i, con, date_temp)

# Create the plot
png(file = "plot2.png")
with(epc_data,plot(date_time, Global_active_power, main="", 
                   xlab="", ylab = "Global Active Power (kilowatts)",type="l"))
dev.off()





