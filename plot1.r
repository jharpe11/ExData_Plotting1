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
remove(first_line, col_names, i, con)

# Create the plot
png(file = "plot1.png")
with(epc_data,hist(Global_active_power, main="Global Active Power", 
                    xlab="Global Active Power (kilowatts)", col = "red"))
dev.off()


