# Will Pauls Springboard Project
# Project: Data Wrangling Exercise 2: Dealing with missing values

# read in titanic_original data set
library(readr)
titanic <- read_csv("C:/Users/wrpauls21/Desktop/Springboard/Titanic/titanic_original.csv")
View(titanic)
?attach
attach(titanic)

# 1. Port of embarkation

# replaced missing values in embarked with an S
embarked[is.na(embarked)] <- "S"
titanic$embarked <- embarked

# 2. Age

# calculated average age on titanic
mean_age <- mean(titanic$age, na.rm = TRUE)

# populated missing age values with average age
age[is.na(age)] <- round(mean(age, na.rm = TRUE))
titanic$age <- age

# 3. Lifeboat

# Filled in missing values in boat column with "None"
boat[is.na(boat)] <- "None"
titanic$boat <- boat

# 4. Cabin

#load dplyr
library(dplyr)
# created column has_cabin_number 
# inserted 0 into new column if cabin had a missing value and 1 otherwise
titanic <- mutate(titanic, has_cabin_number = ifelse(is.na(cabin), 0, 1))

# saved clean data set to csv file
write.csv(titanic,'titanic_clean.csv')