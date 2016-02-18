##### Reading data

data <- read.table(file = "...\\CourseProject1\\household_power_consumption.txt",
                   header = TRUE, sep = ";" ,na.strings = "?", stringsAsFactors = FALSE)

### Reading the dplyr and the lubridate package to subset the data

library(dplyr)
library(lubridate)

data <- mutate(data, Date = dmy(Date), Time = hms(Time))

filter_dates = c(ymd("20070201"), ymd("20070202"))

data_plots <- filter(data, Date %in% filter_dates)

##### Plot 2 - Line graph

### Attaching the data so I do not have to use the $ operator when calling variables from the dataset

attach(data_plots)

### Creates the plot with no x axis labels. Then usees the axis method to create the correct values for the axis

plot(Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xaxt = "n", xlab = "")
axis(1, at = c(0, 1500, 2900), labels = c("Thu", "Fri", "Sat"))

### Copying, closing the device and detaching the data

dev.copy(png, file = "...\\CourseProject1\\plot2.png", width = 480, height = 480)

dev.off()

detach(data_plots)