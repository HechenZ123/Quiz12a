# Workplace Setup
# install.packages("ggplot2")
# install.packages("rstanarm")
library(ggplot2)
library(rstanarm)

set.seed(302)
lambda <- 50
data <- data.frame(
  year = rep(2004:2023, times = 5),
  hospital = rep(1:5, each = 20),
  deaths = rpois(100, lambda)
)

# Check if variance = mean
mean_deaths <- mean(data$deaths)
var_deaths <- var(data$deaths)
test_statistic <- (var_deaths - mean_deaths) / sqrt(2*mean_deaths / length(data$deaths))
p_value <- 2 * (1 - pnorm(abs(test_statistic)))

# Build a plot
ggplot(data, aes(x=year, y=deaths, fill=factor(hospital))) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Number of Deaths due to Cancer per Year", x = "Year", y = "Number of Deaths") +
  theme_minimal()

# Fit a poisson regression model
model <- glm(deaths ~ year + factor(hospital), data = data, family = poisson(link = "log"))
summary(model)

