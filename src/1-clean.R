

# REMOVE INCOMPLETE CASES
## One case was missing about 40% of responses:
data <- data %>% filter(Progress == 100)


# RENAME SOME VARIABLES FOR CLARITY
data <-
  data %>% 
  rename(
    education = edu,
    occupation = occ,
    years_tenure = yrs_wrk,
    supervisor = svision,
    second_job = sec_ovt
  ) %>% 
  glimpse()

# CREATE A NUMERIC VALUE FROM ORDERED CATEGORICAL
data <- 
  data %>% 
  mutate(
    income_num = as.numeric(income),
    education_num = as.numeric(education)
  ) %>% 
  mutate(
    education_num = ifelse(education_num == 8, NA, education_num)  # Set to NA anyone who answered "Other" because we cannot place them on the continuum
  )
  

# CREATE DUMMY VARIABLES
## For racial/ethnic categories:
data <-
  data %>% 
  rename(race_native  = race_1,
         race_black   = race_2,
         race_asian   = race_3,
         race_latino  = race_4,
         race_pacific = race_5,
         race_white   = race_6,
         race_other   = race_7) %>% 
  mutate(  
    race_native  = ifelse(is.na(race_native), 0, race_native),
    race_black   = ifelse(is.na(race_black), 0, race_black),
    race_asian   = ifelse(is.na(race_asian), 0, race_asian),
    race_latino  = ifelse(is.na(race_latino), 0, race_latino),
    race_pacific = ifelse(is.na(race_pacific), 0, race_pacific),
    race_white   = ifelse(is.na(race_white), 0, race_white),
    race_other   = ifelse(is.na(race_other), 0, race_other)
  )  

## For gender
data <-
  data %>% 
  mutate(
    gender_male = ifelse(sex == 1, 1, 0),
    gender_male = ifelse(sex == 3, NA, gender_male)
  )


## For occupation
data <-
  data %>% 
  mutate(
    fire = ifelse(occupation == 1, 1, 0),
    police = ifelse(occupation == 2, 1, 0),
    emergency_mgmt = ifelse(occupation == 3, 1, 0),
    ems = ifelse(occupation == 4, 1, 0)
  )

## Second Job dummy
data <-
  data %>% 
  mutate(
    second_job_dummy = ifelse(second_job == 1, 0, 1)  
  )

## Dummies for martial status
#### Combining married, cohabitating, and engaged vs. divorced, single, widowed, and other
data <-
  data %>% 
  mutate(
    relationship = 
      case_when(
        marital == 1 ~ 1, # Cohabitating
        marital == 3 ~ 1, # Engaged
        marital == 4 ~ 1, # Married
        marital == 2 ~ 0, # Divorced
        marital == 5 ~ 0, # Single
        marital == 6 ~ 0, # Widowed
        marital == 7 ~ 0, # Other
        .default = NA
      )
  )
