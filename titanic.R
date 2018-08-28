library(readr)
titanic <- read_csv("C:/Users/wrpauls21/Desktop/Springboard/Titanic/titanic_original.csv")
View(titanic)
attach(titanic)

embarked[is.na(embarked)] <- "S"
titanic$embarked <- embarked

mean_age <- mean(titanic$age, na.rm = TRUE)
age[is.na(age)] <- round(mean(age, na.rm = TRUE))
titanic$age <- age

boat[is.na(boat)] <- "None"
titanic$boat <- boat

library(dplyr)
titanic <- mutate(titanic, has_cabin_number = ifelse(is.na(cabin), 0, 1))

# saved clean data set to csv file
write.csv(titanic,'titanic_clean.csv')