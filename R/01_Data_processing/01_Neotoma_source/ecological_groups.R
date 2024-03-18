library(tidyverse)

# load check list
dat_env <- read_csv("C:/Users/gmathes/Documents/OneDrive - Universität Zürich UZH/1_postdoc/fossilpol/Data/Input/Eco_group/eco_group_2024-01-25.csv")


# apply
dat_final <- dat_env %>%
  mutate(include = if_else(ecologicalgroup %in% c("UNID", NA), FALSE, TRUE)) 


# save
dat_final %>% 
  write_csv("C:/Users/gmathes/Documents/OneDrive - Universität Zürich UZH/1_postdoc/fossilpol/Data/Input/Eco_group/eco_group_2024-01-25.csv")
