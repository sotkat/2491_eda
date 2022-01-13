#       _/_/    _/  _/      _/_/      _/   
#    _/    _/  _/  _/    _/    _/  _/_/    
#       _/    _/_/_/_/    _/_/_/    _/     
#    _/          _/          _/    _/      
# _/_/_/_/      _/    _/_/_/    _/_/_/     

# Exploratory Data Analysis of Gestation data

library(tidyverse)
library(mosaicData)
# if you don't have mosaicData, install it

data(Gestation)
Gestation <- na.omit(Gestation) 

# Activity 1 - Quick look at the data

# number of observations
count(Gestation) # - 587

# number of observations per racial group
count(Gestation, race, sort=TRUE)

# number of observations by racial group and level of mother's education
Gestation_grouped_by_race_ed <- group_by(Gestation, race, ed)

# Activity 2 - Further summary statistics

# mean age of mothers across all births
# ensure you use a human friendly name for the value you're creating

# calculate both mothers' mean age and babies' mean weight
summarise(Gestation, 
          `Mean age` = mean(age),
          `Babies' mean weight` = mean(wt))


# Activity 3 - Grouped summaries

# make a new data frame containing only id, age and race variables
df_small <- select(Gestation, id, age, race)
head(df_small)
names(df_small)

# calculate the mean age by race
Gestation_grouped_by_race <- group_by(Gestation, race)
summarise(Gestation_grouped_by_race, Mean = mean(age))

# Activity 4 - Extensions

# Activity 4a - Correlation

# Calculate the correlation between age and weight across all births
round(cor(Gestation$age, Gestation$wt), 3)

# Calculate the correlation between age and weight for each race group
summarise(Gestation_grouped_by_race, Correlation = cor(age,  wt))

# Activity 4b - Multiple summary statistics

# Calculate the sample mean of the ages and weights of the mothers in each race group
summarise(Gestation_grouped_by_race, 
          `Mean age` = mean(age),
          `Mean weight` = mean(wt.1))

# Activity 4c - Pivoting wider

# Make a wide table from the summary data frame calculated in Activity 1 that has the number of observations for each combination of mother's education level and race. Make each row is an education level and each column a race group.
# Hint: Look at the help file for `pivot_wider` for what to do with missing cells (where there is no combination of these variables) and set the argument to be 0.
pivot_wider(Gestation_n_race_ed)

# Activity 4d - Multiple summary statistics

# Calculate the mean, standard deviation, minimum, maximum and proportion of values missing for the mothers' ages for each race group.
# Hint: you *can* use summarise_at() for this but you could also just summarise()


