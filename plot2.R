plot2 <- function() {
  Sys.setlocale("LC_ALL","English")

  png(file = "plot2.png", width=480, height=480)
  df <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", colClasses=c(Global_active_power="numeric"), na.strings="?")

  startDate = as.Date("1/02/2007", "%e/%m/%Y")
  endDate   = as.Date("2/02/2007", "%e/%m/%Y")

  df <- subset(df, as.Date(Date,"%e/%m/%Y") <= endDate)
  df <- subset(df, as.Date(Date,"%e/%m/%Y") >= startDate)

  with(df, plot(strptime(paste(Date,Time),"%e/%m/%Y %H:%M:%S"),Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
  dev.off()
}

plot2()