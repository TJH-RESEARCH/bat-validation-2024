
cfa_exhaustion <- cfa(model = 'exhaustion =~ bat1 + bat2 + bat3', data = data)
cfa_mental_distance <- cfa(model = 'mental_distance =~ bat4 + bat5 + bat6', data = data)
cfa_cog_impairment <- cfa(model = 'cognitive_impairment =~  bat7 + bat8 + bat9', data = data)
cfa_emo_impairment <- cfa(model = 'emotional_impairment =~  bat10 + bat11 + bat12', data = data)
cfa_psych_distress <- cfa(model = 'pyschological_distress =~ batsec1 + batsec2 + batsec3 + batsec4 + batsec5', data = data)
cfa_psych_symptoms <- cfa(model = 'pyschomatic_symptoms =~   batsec6 + batsec7 + batsec8 + batsec9 + batsec10', data = data)

## Helper function: 
omega <- function(x){x %>% semTools::reliability() %>% tibble() %>% slice(1) %>% round(2) %>% as.numeric()}

table_omega <-
  tibble(
    var =
      c('Exhaust',
      'Mental Distancing',
      'Cognitive Impairment',
      'Emotional Impairment',
      'Psychological Distress',
      'Psychosomatic Symptoms'),
  
    omega = 
      c(
        cfa_exhaustion %>% omega(),
        cfa_mental_distance %>% omega(),
        cfa_cog_impairment %>% omega(),
        cfa_emo_impairment %>% omega(),
        cfa_psych_distress %>% omega(),
        cfa_psych_symptoms %>% omega()
        )
  )


## For the entire BAT
fit_one_factor %>% omega()


