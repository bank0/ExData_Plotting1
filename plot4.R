plot4 <- function() {
  Sys.setlocale("LC_ALL","English")

  png(file = "plot4.png", width=480, height=480)
  df <- read.csv("household_power_consumption.txt",
                 header=TRUE,
                 sep=";",
                 colClasses=c(Global_active_power="numeric",
                              Sub_metering_1="numeric",
                              Sub_metering_2="numeric",
                              Sub_metering_3="numeric"),
                 na.strings="?")

  startDate = as.Date("1/02/2007", "%e/%m/%Y")
  endDate   = as.Date("2/02/2007", "%e/%m/%Y")

  df <- subset(df, as.Date(Date,"%e/%m/%Y") <= endDate)
  df <- subset(df, as.Date(Date,"%e/%m/%Y") >= startDate)

  par(mfrow=c(2,2))
  with(df, {
    datetime<-strptime(paste(Date,Time),"%e/%m/%Y %H:%M:%S")
    plot(datetime,Global_active_power, type="l", xlab="", ylab="Global Active Power")
    plot(datetime,Voltage, type="l")

    plot(datetime,Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
    points(datetime,Sub_metering_2, col="red", type="l")
    points(datetime,Sub_metering_3, col="blue", type="l")
    legend("topright",
           c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
           lty=1,
           col=c("black","red","blue")
          )

    plot(datetime,Global_reactive_power, type="l")
    }
  )
  dev.off()
}

plot4()