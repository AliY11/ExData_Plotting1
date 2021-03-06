library(dplyr)
household_power_consumption1 <- read.csv("~/Desktop/R/household_power_consumption.txt", sep=";", na.strings="?")

household_power_consumption1$Global_active_power <- as.numeric(as.character(household_power_consumption1$Global_active_power))  

household_power_consumption1$Global_reactive_power <- as.numeric(as.character(household_power_consumption1$Global_reactive_power)) 

household_power_consumption1$Sub_metering_1 <- as.numeric(as.character(household_power_consumption1$Sub_metering_1))

household_power_consumption1$Sub_metering_2 <- as.numeric(as.character(household_power_consumption1$Sub_metering_2))

household_power_consumption1$sub_metering_3 <- as.numeric(as.character(household_power_consumption1$Sub_metering_3)) 

household_power_consumption1$Voltage <- as.numeric(as.character(household_power_consumption1$Voltage))

household_power_consumption1$DateTime<-paste(household_power_consumption1$Date, household_power_consumption1$Time)

household_power_consumption1$DateTime1= strptime(household_power_consumption1$DateTime, format=" %d/%m/%Y %H:%M:%S")

household_power_consumption1$DateTime1= as.POSIXct(household_power_consumption1$DateTime1, tz="US/Eastern")

household_power_consumption1 <- household_power_consumption1 %>%
  filter(DateTime1 >="2007-02-01 00:00:00" & DateTime1<="2007-02-02 23:59:59" )

par(mfcol = c(1,1))
hist(household_power_consumption1$Global_active_power, col="red", xlab= "Global Active Power (killowatts)" , main= "Global Active Power")
dev.copy(png, file= "plot1.png" )
dev.off()
