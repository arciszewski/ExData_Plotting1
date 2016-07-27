# Draw plot of dependency of global active power by time

# Load script with common functions
source('common.R')
download.data.if.needed()
if (!exists("df")){
    df <- get.filtered.data()
}

png(filename = "plot2.png", width = 480, height = 480, units = "px")

with(df, plot(
    datetime, Global_active_power,
    type = "l",
    xlab = "",
    ylab = "Global Active Power (kilowatts)"
))

dev.off()
