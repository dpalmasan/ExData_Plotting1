library(sqldf) # Used for loading the data.

# Name of the file with the data.
filename <- "household_power_consumption.txt"

# Loading data from dates  2007-02-01 and 2007-02-02
dataset <- read.csv.sql(filename, 
                        sql = "select * from file where Date = '1/2/2007' or 
                     Date = '2/2/2007'", 
                        eol = "\n", sep=";")

# Open png device; create "plot1.png" in my wd.
png(filename="plot1.png")

# Create the plot and send to a file
hist(dataset$Global_active_power, col="red",
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency", main="Global Active Power")

# close the png file device
dev.off()