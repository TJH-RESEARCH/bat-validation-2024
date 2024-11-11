
# LOAD PACKAGES ---------------------------------------------------------------- 
library(tidyverse)


# FILE STRUCTURE ---------------------------------------------------------------
## Create an output folder if one doesn't exist (because it was deleted)
if(!dir.exists(here::here('output'))){dir.create(here::here('output'))}


# IMPORT -----------------------------------------------------------------------
data <- haven::read_sav(here::here('data/Public Safety Dataset.sav'))


# CLEAN THE DATA ---------------------------------------------------------------
source(here::here('src/1-clean.R'))


# SCORE SCALES -----------------------------------------------------------------
source(here::here('src/2-score-scales.R'))


# DEMOGRAPHICS -----------------------------------------------------------------

## Demographic Table
source(here::here('src/3-demographics.R'))

## Histogram of the Mean BAT Score
source(here::here('src/3-bat-histogram.R'))


# FACTOR ANALYSIS --------------------------------------------------------------
## Confirmatory Factor Analysis (CFA)
source(here::here('src/4-factor-analysis/cfa.R'))


# INTERNAL CONSISTENCY ---------------------------------------------------------

## Omega
source(here::here('src/5-internal-consistency/omeg-bat.R'))

## Descriptive Statistics
source(here::here('src/5-internal-consistency/internal-descriptives.R'))

## Internal Correlation
source(here::here('src/5-internal-consistency/internal-correlation.R'))

## Internal Paired Plot
source(here::here('src/5-internal-consistency/internal-pair-plot.R'))

## Inter-Item?
source(here::here('src/5-internal-consistency/inter-item.R'))


# CONVERGEN/DIVERGENT VALIDITY -------------------------------------------------
## Descriptive Statistics
source(here::here('src/6-divergent-validity/descriptives.R'))

## Internal Consistency
source(here::here('src/6-divergent-validity/omega.R'))

## Correlation
source(here::here('src/6-divergent-validity/correlation.R'))

## Paired Plot
source(here::here('src/6-divergent-validity/pair-plot.R'))


# PREDICTIVE VALIDITY ----------------------------------------------------------

## Scatter Plot
source(here::here('src/7-predictive-validity/bivariate-plot.R'))

## Linear Model
source(here::here('src/7-predictive-validity/linear-model.R'))

## Regression Diagnostics
source(here::here('src/7-predictive-validity/plot-residuals.R'))

