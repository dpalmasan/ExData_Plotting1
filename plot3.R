library(sqldf) # Used for loading the data.

# Name of the file with the data.
filename <- "household_power_consumption.txt"

# Loading data from dates  2007-02-01 and 2007-02-02
dataset <- read.csv.sql(filename, 
                        sql = "select * from file where Date = '1/2/2007' or 
                        Date = '2/2/2007'", 
                        eol = "\n", sep=";")

# Converting Date/Time
datetime <- paste(dataset$Date, dataset$Time)
datetime <- strptime(datetime, format="%d/%m/%Y %H:%M:%S", tz="UTC")

# Open png device; create "plot1.png" in my wd.
png(filename="plot3.png")

# Create the plot and send to a file
plot(datetime, dataset$Sub_metering_1, type="l", col="black",
     ylab="Energy sub metering", xlab="")
lines(datetime, dataset$Sub_metering_2, col="red")
lines(datetime, dataset$Sub_metering_3, col="blue")
legend("topright", lty=1,col=c("black", "red", "blue"),
       legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

# close the png file device
dev.off()