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


#Plot2
png(file ="Plot2.png") ## openning the png device and name the plot 

plot (my_df$DateTime, my_df$Global_active_power, 
     type="l", 
     xlab="", 
     ylab="Global Active Power (kilowatts)")

dev.off() ## close the npg file and save it in the working directory






