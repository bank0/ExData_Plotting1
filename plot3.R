plot3 <- function() {
  Sys.setlocale("LC_ALL","English")

  png(file = "plot3.png", width=480, height=480)
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

  with(df, {
    datetime<-strptime(paste(Date,Time),"%e/%m/%Y %H:%M:%S")
    plot(datetime,Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
    points(datetime,Sub_metering_2, col="red", type="l")
    points(datetime,Sub_metering_3, col="blue", type="l")
    legend("topright",
           c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
           lty=1,
           col=c("black","red","blue")
          )
    }
  )
  dev.off()
}

plot3()