# Load required libraries
library(dplyr)

# Actual values from 2009 to 2022
actual_values <- c(7042, 7239, 7679, 8080, 8765, 9241, 10553, 11199, 11272, 11911, 13043, 13803, 15645, 19029)

# Predicted values from 2023 to 2030
predicted_values <- c(16936.98, 17425.34, 18805.15, 19520.78, 20122.65, 20611.01, 21990.81, 22706.45)


# Calculate MAE
mae <- mean(abs(actual_values - predicted_values))
print(mae)


# Calculate MSE
mse <- mean((actual_values - predicted_values)^2)
print(mse)



# Calculate RMSE
rmse <- sqrt(mse)
print(rmse)
