# Assuming you have loaded the required libraries (ggplot2 and tidyr)
# If not, run the following commands first:
install.packages("ggplot2")
install.packages("tidyr")
library(ggplot2)
library(tidyr)

# Create the dataset
data <- data.frame(
  Year = c(2023, 2024, 2025, 2026, 2027, 2028, 2029, 2030),
  United_States = c(16936.98, 17425.34, 18805.15, 19520.78, 20122.65, 20611.01, 21990.81, 22706.45),
  Mexico = c(217.6839, 218.4958, 250.0213, 254.1775, 256.657, 257.4689, 288.9944, 293.1505),
  Latin_America = c(225.8663, 226.8032, 274.903, 280.6363, 283.9645, 284.9014, 333.0012, 338.7345),
  Caribbean = c(76.30204, 75.18848, 89.90451, 88.57269, 87.34759, 86.23404, 100.95006, 99.61824),
  EU = c(1039.461, 1105.306, 1084.34, 1153.475, 1220.977, 1286.822, 1265.856, 1334.991),
  UK = c(292.4529, 298.5143, 350.9702, 357.1022, 363.1918, 369.2532, 421.7091, 427.8412),
  Other_West_Europe = c(19.92269, 22.40788, 20.2139, 22.47732, 24.85232, 27.3375, 25.14353, 27.40694),
  Eastern_Europe = c(33.809598, 33.464851, 14.951787, 14.381963, 13.927424, 13.582678, -4.930386, -5.500211),
  Middle_East = c(239.8135, 240.2446, 263.4023, 268.7602, 271.6517, 272.0828, 295.2405, 300.5984),
  Africa = c(116.4145, 112.7472, 139.069, 138.1342, 135.8287, 132.1614, 158.4833, 157.5484),
  Japan = c(573.9587, 587.842, 618.4721, 647.8435, 669.4691, 683.3524, 713.9824, 743.3538),
  Asia = c(1631.869, 1665.596, 1761.339, 1800.179, 1836.453, 1870.18, 1965.924, 2004.764),
  Oceania = c(139.5788, 147.665, 141.8795, 151.436, 160.2596, 168.3458, 162.5604, 172.1168)
)



#impoting the libraries
install.packages("ggplot2")
install.packages("tidyr")
library(ggplot2)
library(tidyr)

#for reading the dataset
forecast_dataset <- read.csv("agriculture.csv")


# Convert the data to a long format for plotting
library(tidyr)
data_long <- gather(data, key = "Region", value = "Export_Value", -Year)

# Plot the graph
library(ggplot2)
ggplot(data_long, aes(x = Year, y = Export_Value, color = Region)) +
  geom_line(size = 1) +
  geom_point(size = 3) +
  labs(x = "Year", y = "Export Values", title = "Export Values by Region (2023 to 2030)") +
  scale_x_continuous(breaks = seq(2023, 2030, 1)) +
  theme_minimal()
