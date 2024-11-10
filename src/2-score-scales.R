

data <-
  data %>% 
  mutate(
    bat_total = 
      bat1 + bat2 + bat3 + bat4 + bat5 + bat6 +
      bat7 + bat8 + bat9 + bat10 + bat11 + bat12 +
      batsec1 + batsec2 + batsec3 + batsec4 +
      batsec5 + batsec6 + batsec7 +
      batsec8 + batsec9 + batsec10,
    
    bat_sum = 
      bat1 + bat2 + bat3 + bat4 + bat5 + bat6 +
      bat7 + bat8 + bat9 + bat10 + bat11 + bat12,
    
    bat_sec_sum =
      batsec1 + batsec2 + batsec3 + batsec4 +
      batsec5 + batsec6 + batsec7 +
      batsec8 + batsec9 + batsec10,
    
    bat_exhaustion = bat1 + bat2 + bat3, 
    bat_mental_distance = bat4 + bat5 + bat6,
    bat_cog_impairment = bat7 + bat8 + bat9, 
    bat_emo_impairment = bat10 + bat11 + bat12,
    
    bat_psych_distress =
      batsec1 + batsec2 + batsec3 + batsec4 +
      batsec5, 
    bat_psych_symptoms = batsec6 + batsec7 +
      batsec8 + batsec9 + batsec10,
    
    
    meaningful_work_mean = 
      m_wrk1 + m_wrk2 + m_wrk3 + m_wrk4 + m_wrk5 +
      m_wrk6 + m_wrk7 + m_wrk8 + m_wrk9 + m_wrk10,
    
    org_support_mean =
      pos_1 + pos_2 + pos_3,
    
    resilience_mean = 
      resil_1 + resil_2 + resil_3 +
      resil_4 + resil_5 + resil_6,
    
    turnover_intent_mean = 
      turnt1 + turnt2 + turnt3, 
    
    uwes_3_sum = 
      w_eng1 + w_eng3 + w_eng8
    
  )
