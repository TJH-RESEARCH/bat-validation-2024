library(psych)

table_descriptives <-
  data %>% 
  select(bat_exhaustion,
         bat_mental_distance,
         bat_cog_impairment,
         bat_emo_impairment,
         bat_psych_distress,
         bat_psych_symptoms) %>% 
  psych::describe() %>% 
  tibble() %>% 
  select(-c(n, trimmed, mad, range, se)) %>% 
  mutate(vars = c('Exhaust',
                  'Mental Distancing',
                  'Cognitive Impairment',
                  'Emotional Impairment',
                  'Psychological Distress',
                  'Psychosomatic Symptoms')
         )

## Add the omega values
table_descriptives <- table_descriptives %>% bind_cols(table_omega %>% select(-var))

## Write the table to a file
table_descriptives %>% write_csv('output/table-decriptives.csv')
