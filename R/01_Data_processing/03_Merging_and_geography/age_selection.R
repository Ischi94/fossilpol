library(tidyverse)

# load check list
dat_env <- read_csv("C:/Users/gmathes/Documents/OneDrive - Universität Zürich UZH/1_postdoc/fossilpol/Data/Input/Regional_age_limits/regional_age_limits_2024-01-25.csv")


# apply
dat_final <- dat_env %>%
  mutate(young_age = 0, 
         old_age = 21000)

# save
dat_final %>% 
  write_csv("C:/Users/gmathes/Documents/OneDrive - Universität Zürich UZH/1_postdoc/fossilpol/Data/Input/Regional_age_limits/regional_age_limits_2024-01-25.csv")

            