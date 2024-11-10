
histogram_age <-
  data %>% ggplot(aes(age_num)) + geom_histogram()
ggsave(plot = histogram_age, 
       filename = 'output/figure-age.jpeg',
       bg = "transparent", width = 6, height = 4, dpi = 300)

histogram_tenure <-
  data %>% ggplot(aes(years_tenure)) + geom_histogram()
ggsave(plot = histogram_tenure, 
       filename = 'output/figure-tenure.jpeg',
       bg = "transparent", width = 6, height = 4, dpi = 300)


# AGE
data %>%
  summarize(
    age_mean = mean(age_num, na.rm = TRUE),
    age_sd = sd(age_num, na.rm = TRUE))

# TENURE
data %>%
  summarize(
    tenure_mean = mean(years_tenure, na.rm = TRUE),
    tenure_median = median(years_tenure, na.rm = TRUE),
    tenure_sd = sd(years_tenure, na.rm = TRUE)
  )

demographic_table <-
  bind_rows(
    # EDUCATION
    data %>% 
      haven::as_factor() %>% 
      count(education) %>% 
      mutate(perc = n / sum(n),
             education = as.character(education),
             demographic = 'Education Level') %>% 
      rename(category = 1),
    
    # GENDER
    data %>% 
      haven::as_factor() %>% 
      count(sex) %>% 
      mutate(perc = n / sum(n),
             demographic = 'Gender') %>% 
      rename(category = 1),
    
    
    # INCOME
    data %>% 
      haven::as_factor() %>% 
      count(income) %>% 
      mutate(perc = n / sum(n),
             income = as.character(income),
             demographic = 'Annual Income') %>% 
      rename(category = 1),
    
    
    # MARITAL STATUS
    data %>% 
      haven::as_factor() %>% 
      count(marital) %>% 
      mutate(perc = n / sum(n),
             demographic = 'Relationship Status') %>% 
      rename(category = 1),
    
    
    # OCCUPATION
    data %>% 
      haven::as_factor() %>% 
      count(occupation) %>% 
      mutate(perc = n / sum(n),
             demographic = 'Occupation') %>% 
      rename(category = 1),
    
    
    # RACE
    data %>% 
      haven::as_factor() %>% 
      count(race) %>% 
      mutate(perc = n / sum(n),
             demographic = 'Race/Ethnicity') %>% 
      rename(category = 1),
    
    
    # SECOND JOB/OVERTIME
    data %>% 
      haven::as_factor() %>% 
      count(second_job) %>% 
      mutate(perc = n / sum(n),
             second_job = as.character(second_job),
             demographic = 'Works a Second Job') %>% 
      rename(category = 1)
    
  ) %>% 
    select(demographic, everything())
  

demographic_table %>% write_csv('output/table-demographics.csv')
