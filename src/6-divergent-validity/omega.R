library(lavaan)

cfa_meaningful_work <- cfa(model = 'meaningful_work =~ m_wrk1 + m_wrk2 + m_wrk3 + m_wrk4 + m_wrk5 + m_wrk6 + m_wrk7 + m_wrk8 + m_wrk9 + m_wrk10', data = data)
cfa_resilience <- cfa(model = 'resilience =~ resil_1 + resil_2 + resil_3 + resil_4 + resil_5 + resil_6', data = data)
cfa_uwes_3 <- cfa(model = 'uwes_3 =~  w_eng1 + w_eng3 + w_eng8', data = data)
cfa_org_support <- cfa(model = 'org_support =~  pos_1 + pos_2 + pos_3', data = data)
cfa_turnover_intent <- cfa(model = 'turnover_intent =~  turnt1 + turnt2 + turnt3', data = data)

## Helper function: 
omega <- function(x){x %>% semTools::reliability() %>% tibble() %>% slice(1) %>% round(2) %>% as.numeric()}

table_omega <-
  tibble(
    var =
      c('Meaningful Work',
        'Resilience',
        'Engagement',
        'Orgazational Support',
        'Turnover Intent'),
    
    omega = 
      c(
        cfa_meaningful_work %>% omega(),
        cfa_resilience %>% omega(),
        cfa_uwes_3 %>% omega(),
        cfa_org_support %>% omega(),
        cfa_turnover_intent %>% omega()
      )
  )



table_omega
