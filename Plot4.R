#Load data
my_data <- read.table("./data/household_power_consumption.txt", header = TRUE, 
                      sep = ";", dec = ".", stringsAsFactor = FALSE, na.strings = "?",
                      colClasses = c ('character', 'character', rep("numeric", 7)))

# Converting data and time to specific format

my_data$Date <- as.Date(my_data$Date, format = "%d/%m/%Y")
my_data$DateTime <- as.POSIXct(paste(my_data$Date, my_data$Time))

#Subsequenting the my_data and assigning to a new dataframe
DATE1 <- as.Date("2007-02-01", "%Y-%m-%d")
DATE2 <- as.Date("2007-02-02", "%Y-%m-%d")

date1 <- as.Date(my_data$Date, "%Y-%m-%d")
my_df <- subset(my_data, date1>=DATE1 & date1 <=DATE2)


png(file = "Plot4.png") # openning the png device and name the plot 

# layout the graphical presentation of 2 rows and 2 columns
par(mfcol = c(2, 2))

#Plot the first plot in the topleft corner
plot(my_df$DateTime,
     my_df$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power")

#Plot the second plot in the bottomleft corner
plot(my_df$DateTime, my_df$Sub_metering_1,
     "n",
     xlab = "",
     ylab = "Energy sub metering")

points(my_df$DateTime, my_df$Sub_metering_1, type = "l")

points(my_df$DateTime, my_df$Sub_metering_2, type = "l", col = "red")

points(my_df$DateTime, my_df$Sub_metering_3, type = "l", col = "blue")

# Add legend
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = c(1, 1, 1))

#Plot the second plot in the topright corner
plot(my_df$DateTime, my_df$Voltage,
     type = "l",
     xlab = "datetime",
     ylab = "Voltage")

#Plot the second plot in the bottomright corner
plot(my_df$DateTime, my_df$Global_reactive_power,
     type = "l",
     xlab = "datetime",
     ylab = "Global_reactive_piwer")

dev.off() # close the npg file and save it in the working directory







