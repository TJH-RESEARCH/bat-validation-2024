
data %>% 
  select(
    bat_sum,
    bat_sec_sum,
    meaningful_work_mean,
    uwes_9_sum,
    uwes_3_sum,
    wellbeing_we,
    wellbeing_who
  ) %>% 
  psych::describe()
