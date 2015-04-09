plot1 <- function() {
  png(file = "plot1.png", width=480, height=480)
  df <- read.csv("household_power_consumption.txt",
                 header=TRUE,
                 sep=";",
                 colClasses=c(Global_active_power="numeric"),
                 na.strings="?")

  startDate = as.Date("1/02/2007", "%e/%m/%Y")
  endDate   = as.Date("2/02/2007", "%e/%m/%Y")

  df <- subset(df, as.Date(Date,"%e/%m/%Y") <= endDate)
  df <- subset(df, as.Date(Date,"%e/%m/%Y") >= startDate)

  with(df, hist(Global_active_power,
                col="red",
                xlab="Global Active Power (kilowatts)",
                main="Global Active Power")
      )
  dev.off()
}

plot1()