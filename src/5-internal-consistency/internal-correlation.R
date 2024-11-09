


data %>% 
  select(
    bat_exhaustion,
    bat_mental_distance,
    bat_cog_impairment,
    bat_emo_impairment,
    bat_psych_distress,
    bat_psych_symptoms
  ) %>% 
  GGally::ggcorr(digits = 3,label = T)

