# Load the required library (prophet)
install.packages("prophet")
library(prophet)

# Create a dataframe for the import values (replace this with your new dataset)
data <- data.frame(
  Year = c(2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022),
  United_States = c(11377, 10902, 11959, 13127, 14109, 15604, 17346, 17632, 17510, 17658, 18012, 18722, 19383, 22242),
  Mexico = c(660, 775, 776, 809, 952, 1177, 1345, 1597, 1723, 1729, 1928, 2109, 2284, 2616),
  Latin_America = c(1244, 1367, 1601, 1821, 1717, 1730, 1888, 1914, 2013, 1952, 2092, 2242, 2467, 2792),
  Caribbean = c(67, 65, 76, 75, 85, 102, 113, 118, 115, 148, 211, 138, 142, 134),
  EU = c(1271, 1367, 1360, 1436, 1669, 1887, 1878, 1955, 2174, 2348, 2522, 2658, 2809, 3252),
  UK = c(248, 246, 245, 270, 291, 283, 299, 289, 291, 282, 307, 345, 361, 436),
  Other_West_Europe = c(65, 85, 80, 61, 83, 128, 132, 128, 185, 194, 242, 270, 312, 358),
  Eastern_Europe = c(28, 25, 22, 21, 26, 29, 31, 36, 34, 38, 41, 71, 64, 76),
  Middle_East = c(136, 150, 102, 107, 121, 138, 164, 222, 273, 282, 281, 324, 273, 313),
  Africa = c(203, 239, 237, 232, 234, 253, 289, 311, 304, 368, 377, 455, 530, 629),
  Japan = c(32, 30, 28, 27, 33, 48, 51, 48, 48, 55, 64, 61, 74, 82),
  Asia = c(1245, 1345, 1486, 1534, 1559, 1757, 1926, 1965, 2127, 2226, 2324, 2372, 2367, 3206),
  Oceania = c(343, 317, 369, 363, 354, 453, 554, 494, 539, 558, 586, 597, 578, 755)
)

# Prepare the data in Prophet format
prophet_data <- data.frame(ds = as.Date(paste(data$Year, "-01-01", sep = "")), y = data$United_States)

# Create a Prophet model
model <- prophet(yearly.seasonality = TRUE, weekly.seasonality = FALSE, daily.seasonality = FALSE)
model <- fit.prophet(model, prophet_data)

# Generate future years for predictions
future_years <- 2023:2030

# Create a dataframe for predictions
predict_data <- data.frame(ds = as.Date(paste(future_years, "-01-01", sep = "")))

# Make predictions for each region
prediction_table <- data.frame(Year = future_years)
regions <- colnames(data)[-1]
for (region in regions) {
  prophet_data <- data.frame(ds = as.Date(paste(data$Year, "-01-01", sep = "")), y = data[[region]])
  model <- prophet(yearly.seasonality = TRUE, weekly.seasonality = FALSE, daily.seasonality = FALSE)
  model <- fit.prophet(model, prophet_data)
  forecast <- predict(model, predict_data)
  prediction_table[[region]] <- forecast$yhat
}

# Print the prediction table
print(prediction_table)