# Load necessary libraries
library(dplyr)

# Set seed for reproducibility
set.seed(302)

# Simulating data
years <- rep(2004:2023, times = 5) # 20 years for 5 hospitals
hospital_names <- rep(c('Sydney Hospital A', 'Sydney Hospital B', 'Sydney Hospital C', 'Sydney Hospital D', 'Sydney Hospital E'), each = 20)
number_of_deaths <- sample(10:100, size = 100, replace = TRUE)
age_groups <- sample(c('0-18', '19-40', '41-60', '61-80', '81+'), size = 100, replace = TRUE)
genders <- sample(c('Male', 'Female', 'Other'), size = 100, replace = TRUE)

# Create data frame
data <- data.frame(Year = years,
                   Hospital_Name = hospital_names,
                   Number_of_Deaths = number_of_deaths,
                   Age_Group = age_groups,
                   Gender = genders)

# Display a sample of the dataset
head(data)

### Performing tests on the simulated data

# 1. Total number of records
total_records <- nrow(data)

# 2. Number of unique hospitals
unique_hospitals <- length(unique(data$Hospital_Name))

# 3. Range of years covered
years_range <- range(data$Year)

# 4. Average deaths per year
avg_deaths_per_year <- mean(data$Number_of_Deaths)

# 5. Most common cancer type
most_common_cancer <- names(sort(table(data$Cancer_Type), decreasing = TRUE))[1]

# 6. Least common cancer type
least_common_cancer <- names(sort(table(data$Cancer_Type), decreasing = FALSE))[1]

# 7. Highest number of deaths recorded
max_deaths <- max(data$Number_of_Deaths)

# 8. Lowest number of deaths recorded
min_deaths <- min(data$Number_of_Deaths)

# 9. Most affected age group
most_affected_age_group <- names(sort(table(data$Age_Group), decreasing = TRUE))[1]

# 10. Gender with the highest deaths
gender_highest_deaths <- names(sort(table(data$Gender), decreasing = TRUE))[1]

# Printing test results
cat("Total Records:", total_records, "\n",
    "Unique Hospitals:", unique_hospitals, "\n",
    "Years Range:", paste(years_range, collapse = "-"), "\n",
    "Average Deaths per Year:", avg_deaths_per_year, "\n",
    "Most Common Cancer Type:", most_common_cancer, "\n",
    "Least Common Cancer Type:", least_common_cancer, "\n",
    "Highest Number of Deaths Recorded:", max_deaths, "\n",
    "Lowest Number of Deaths Recorded:", min_deaths, "\n",
    "Most Affected Age Group:", most_affected_age_group, "\n",
    "Gender with Highest Deaths:", gender_highest_deaths, "\n")
