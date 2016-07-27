# Draw plot of dependency of sub meters (1, 2, 3) by time

# Load script with common functions
source('common.R')
download.data.if.needed()
if (!exists("df")){
    df <- get.filtered.data()
}

png(filename = "plot3.png", width = 480, height = 480, units = "px")

with(df, {plot(
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
           col = c("black", "red", "blue")
    )
    }
)

dev.off()
