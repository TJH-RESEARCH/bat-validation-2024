
inter_items_bat <-
  data %>% 
  select(bat1:bat12) %>% 
  psych::alpha()

inter_items_batsec <-
  data %>% 
  select(batsec1:batsec10) %>% 
  psych::alpha()

inter_items <-
  data %>% 
  select(starts_with('bat') &
         !c(
            bat_sum,
            bat_sec_sum,
            bat_exhaustion,
            bat_mental_distance,
            bat_psych_distress,
            bat_cog_impairment,
            bat_emo_impairment,
            bat_psych_distress,
            bat_psych_symptoms,
            bat_mean
            )) %>% 
  psych::alpha()


inter_items$item.stats %>% 
  ggplot(aes(std.r)) + 
  geom_histogram() + 
  geom_density()
inter_items_bat$item.stats %>% 
  ggplot(aes(std.r)) + 
  geom_histogram()
inter_items_batsec$item.stats %>% 
  ggplot(aes(std.r)) + 
  geom_histogram()
