

# BIVARIATE ---------------------------------------------------------------
lm_turnover_intent <-
  data %>% 
  lm(turnover_intent_mean ~ bat_mean, .)

lm_turnover_intent %>% summary()



# WITH COVARIATES ---------------------------------------------------------
lm_turnover_intent_cov <-
  data %>% 
  lm(turnover_intent_mean ~ 
       bat_mean +
       gender_male +
       police +
       fire +
       ems +
       race_asian + 
       race_black +
       race_latino + 
       race_white +
       income_num +
       second_job_dummy +
       years_tenure +
       relationship, .)

lm_turnover_intent_cov %>% summary()
