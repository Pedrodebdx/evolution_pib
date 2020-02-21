library(dplyr)
library(readr)
library(tidyverse)

# chargement des dataframes
df1 <- read_csv(file = "data/DataPIBAggregates.csv")
df2 <- read_csv(file = "data/DataPIBPays.csv")
print(df2)
print(df1)

# distinction des pays et des aggreations
df1['aggregate'] = FALSE
df2['aggregate'] = TRUE


# concatenation 
df <-rbind(df1,df2)
print(df)

#suppression des 2 premières colonnes
df[1:2] <- NULL 
print(df)

#renommer les colonnes
df <- df %>% rename(
  '2017' = '2017 [2017]' ,
  '2018' = '2018 [2018]' ,
  '2019' = '2019 [2019]' ,
  '2020' = '2020 [2020]' ,
  '2021' = '2021 [2021]' ,
  '2022' = '2022 [2022]'
)
print(df)

# à la recherche des NA
which(is.na(df))