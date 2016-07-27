# Draw histogram of Global active power

# Load script with common functions
source('common.R')
download.data.if.needed()
if (!exists("df")){
    df <- get.filtered.data()
}

png(filename = "plot1.png", width = 480, height = 480, units = "px")

hist(
    df$Global_active_power,
    col = "red",
    main = "Global Active Power",
    xlab = "Global Active Power (kilowatts)"
)

dev.off()
