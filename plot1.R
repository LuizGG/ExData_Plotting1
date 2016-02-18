##### Reading data

data <- read.table(file = "...\\CourseProject1\\household_power_consumption.txt",
                   header = TRUE, sep = ";" ,na.strings = "?", stringsAsFactors = FALSE)

### Reading the dplyr and the lubridate package to subset the data

library(dplyr)
library(lubridate)

data <- mutate(data, Date = dmy(Date), Time = hms(Time))

filter_dates = c(ymd("20070201"), ymd("20070202"))

data_plots <- filter(data, Date %in% filter_dates)

##### Plot 1 - Histogram

### Attaching the data so I do not have to use the $ when calling variables from the dataset

attach(data_plots)

### Creating the histrogram and the png file

hist(Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.copy(png, file = "...\\CourseProject1\\plot1.png", width = 480, height = 480)

### At the end, close the png file and detach the dataset

dev.off()

detach(data_plots)