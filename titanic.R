library(readr)
titanic_original <- read_csv("C:/Users/wrpauls21/Desktop/Springboard/Titanic/titanic_original.csv")
View(titanic_original)
attach(titanic_original)

embarked[is.na(embarked)] <- "S"
titanic_original$embarked <- embarked

mean_age <- mean(titanic_original$age, na.rm = TRUE)
age[is.na(age)] <- round(mean(age, na.rm = TRUE))
titanic_original$age <- age

boat[is.na(boat)] <- "None"
titanic_original$boat <- boat

titanic_original$has_cabin_number <- NA
