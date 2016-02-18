##### Reading data

data <- read.table(file = "...\\CourseProject1\\household_power_consumption.txt",
                   header = TRUE, sep = ";" ,na.strings = "?", stringsAsFactors = FALSE)

### Reading the dplyr and the lubridate package to subset the data

library(dplyr)
library(lubridate)

data <- mutate(data, Date = dmy(Date), Time = hms(Time))

filter_dates = c(ymd("20070201"), ymd("20070202"))

data_plots <- filter(data, Date %in% filter_dates)

##### Plot 3 - Multivariate line graph

### Attaching the data so I do not have to use the $ operator when calling variables from the dataset
attach(data_plots)

### Creates the plot with no x axis labels. Then, adds the lines for the other variables.
#### After that, usees the axis method to create the correct values for the axis. Finally, the legend for the plot is created.

plot(Sub_metering_1, type = "l", ylab = "Energy sub metering", xaxt = "n", xlab = "")
lines(Sub_metering_2, col = "red")
lines(Sub_metering_3, col = "blue")
axis(1, at = c(0, 1500, 2900), labels = c("Thu", "Fri", "Sat"))
legend("topright", lty = c(1,1,1) ,col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

### Copying, closing the device and detaching the data

dev.copy(png, file = "...\\CourseProject1\\plot3.png", width = 480, height = 480)

dev.off()

detach(data_plots)