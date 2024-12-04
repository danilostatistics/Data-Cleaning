# Clear the workspace
rm(list = ls())

# Load necessary libraries
library(survival)  # For survival analysis datasets and functions
library(BRBVS)     # For Bayesian variable selection (used if needed later)
library(tidyverse) # For data manipulation and visualization

# #########################################################
# Script: Data Cleaning for Potential JJS Dataset
# #########################################################

# ---------------------------------------------------------
# Kidney Survival Data Preparation
# ---------------------------------------------------------

# Extracting observations for the first patient from the kidney dataset
first_dataset <- kidney[seq(1, nrow(kidney), by = 2), ]

# Extracting observations for the second patient from the kidney dataset
second_dataset <- kidney[seq(2, nrow(kidney), by = 2), ]

# Subset relevant variables for the first dataset
first_dataset <- first_dataset[, c('id', 'time', 'status', 'age', 'sex', 'disease', 'frail')]

# Rename columns in the first dataset for consistency
colnames(first_dataset) <- c("id", "t12", "status", "age", "sex", "disease", "frail")

# Add a small tolerance value for time variables
tolz <- 1e-04
first_dataset$t11 <- tolz

# Convert status: '1' indicates the event occurred (Uncensored, 'U'), 
# while '0' indicates right censoring (Censored, 'R')
first_dataset$status <- ifelse(first_dataset$status == 1, 'U', 'R')

# Preview the first dataset
head(first_dataset)

# Subset relevant variables for the second dataset
second_dataset <- second_dataset[, c('time', 'status', 'frail')]

# Rename columns in the second dataset for consistency
colnames(second_dataset) <- c("t22", "status", "frail")

# Add a small tolerance value for time variables
second_dataset$t12 <- tolz

# Convert status: '1' indicates the event occurred (Uncensored, 'U'), 
# while '0' indicates right censoring (Censored, 'R')
second_dataset$status <- ifelse(second_dataset$status == 1, 'U', 'R')

# Preview the second dataset
head(second_dataset)

# Combine the two datasets column-wise to create the final kidney_JSS dataset
kidney_JSS <- cbind(first_dataset, second_dataset)

# Save the final dataset as an RData file for later use
save(kidney_JSS, file = "kidney.RData")

# ---------------------------------------------------------
# End of Script
# ---------------------------------------------------------


