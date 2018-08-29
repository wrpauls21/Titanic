# Will Pauls Springboard Project
# Project: Data Wrangling Exercise 2: Dealing with missing values

# read in titanic_original data set
library(readr)
titanic <- read_csv("titanic_original.csv")
View(titanic)
attach(titanic)

# 1. Port of embarkation

# replaced missing values in embarked with an S
titanic$embarked[is.na(titanic$embarked)] <- "S"

# 2. Age

# calculated average age on titanic
mean_age <- mean(titanic$age, na.rm = TRUE)

# populated missing age values with average age
titanic$age[is.na(titanic$age)] <- round(mean(age, na.rm = TRUE))

# 3. Lifeboat

# Filled in missing values in boat column with "None"
titanic$boat[is.na(titanic$boat)] <- "None"

# 4. Cabin

#load dplyr
library(dplyr)
# created column has_cabin_number 
# inserted 0 into new column if cabin had a missing value and 1 otherwise
titanic <- mutate(titanic, has_cabin_number = ifelse(is.na(cabin), 0, 1))

# saved clean data set to csv file
write.csv(titanic,'titanic_clean.csv')