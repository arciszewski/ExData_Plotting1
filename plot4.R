

# Load script with common functions
source('common.R')
download.data.if.needed()
if (!exists("df")){
    df <- get.filtered.data()
}

png(filename = "plot4.png", width = 480, height = 480, units = "px")

par(mfrow = c(2, 2))
with(df, {
    
    plot(
        datetime, Global_active_power,
        type = "l",
        xlab = "",
        ylab = "Global Active Power (kilowatts)"
    )
    
    plot(
        datetime, Voltage,
        type = "l"
    )
    
    plot(
        datetime, Sub_metering_1,
        type = "n",
        xlab = "", ylab = "Energy sub metering"
    )
    lines(datetime, Sub_metering_1)
    lines(datetime, Sub_metering_2, col = "red")
    lines(datetime, Sub_metering_3, col = "blue")
    legend("topright",
           c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           lty = c(1, 1, 1),
           bty = "n",
           col = c("black", "red", "blue")
    )
    
    plot(
        datetime, Global_reactive_power,
        type = "l"
    )
}
)

dev.off()
