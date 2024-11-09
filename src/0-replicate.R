
# LOAD PACKAGES ---------------------------------------------------------------- 
library(tidyverse)

# IMPORT -----------------------------------------------------------------------
data <- haven::read_sav(here::here('data/Public Safety Dataset.sav'))


# CLEAN THE DATA ---------------------------------------------------------------
source(here::here('src/1-clean.R'))


# SCORE SCALES -----------------------------------------------------------------
source(here::here('src/2-score-scales.R'))


# DEMOGRAPHICS -----------------------------------------------------------------
source(here::here('src/3-demographics.R'))


# FACTOR ANALYSIS --------------------------------------------------------------
## Confirmatory Factor Analysis (CFA)
source(here::here('src/4-factor-analysis/cfa.R'))


# INTERNAl CONSISTENCY ---------------------------------------------------------
## Omega
source(here::here('src/5-internal-consistency/omega.R'))

## Internal Correlation
source(here::here('src/5-internal-consistency/internal-correlation.R'))


# CONVERGEN/DIVERGENT VALIDITY & PREDICTIVE VALIDITY ---------------------------
## Correlation
source(here::here('src/6-validity/correlation.R'))

## Regression
source(here::here('src/6-validity/regression.R'))