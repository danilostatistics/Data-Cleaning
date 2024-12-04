# Load necessary library
library(copula)  # For copula-based statistical modeling

# #########################################################
# Script: Data Cleaning for Diabetic Dataset
# #########################################################

# Preview the diabetic dataset (ensure it is loaded in your environment)
diabetic

# ---------------------------------------------------------
# Split the Dataset: Left Eye and Right Eye Observations
# ---------------------------------------------------------

# Extract observations for the left eye (odd rows)
diabetic_l <- diabetic[seq(1, nrow(diabetic), by = 2), ]

# Extract observations for the right eye (even rows)
diabetic_r <- diabetic[seq(2, nrow(diabetic), by = 2), ]

# ---------------------------------------------------------
# Rename Columns for Consistency
# ---------------------------------------------------------

# Renaming columns for the left eye dataset
colnames(diabetic_l) <- c('id', 'laser_l', 'age_l', 'eye_l', 'trt_l', 'risk_l', 't12', 'status_l')

# Renaming columns for the right eye dataset
colnames(diabetic_r) <- c('id', 'laser_r', 'age_r', 'eye_r', 'trt_r', 'risk_r', 't12', 'status_r')

# ---------------------------------------------------------
# Add Small Tolerance Values to Time Variables
# ---------------------------------------------------------

# Add t11 for the left eye dataset
diabetic_l$t11 <- 1e-04

# Add t21 for the right eye dataset
diabetic_r$t21 <- 1e-04

# ---------------------------------------------------------
# Combine Left and Right Eye Datasets
# ---------------------------------------------------------

# Combine the two datasets column-wise into a final dataset
diabetic_JSS <- cbind(diabetic_l, diabetic_r)

# Save the combined dataset as an RData file for later use
save(diabetic_JSS, file = "Diabetic.RData")

# ---------------------------------------------------------
# Data Integrity Checks
# ---------------------------------------------------------

# Check for inconsistencies in the laser variable between left and right eyes
laser_mismatch_count <- sum(diabetic_l$laser_l != diabetic_r$laser_r)

# Check for inconsistencies in the age variable between left and right eyes
age_mismatch_count <- sum(diabetic_l$age_l != diabetic_r$age_r)

# Check for inconsistencies in the treatment variable between left and right eyes
treatment_mismatch_count <- sum(diabetic_l$trt_l != diabetic_r$trt_r)

# Print mismatches to console for verification
print(paste("Laser Mismatches: ", laser_mismatch_count))
print(paste("Age Mismatches: ", age_mismatch_count))
print(paste("Treatment Mismatches: ", treatment_mismatch_count))

# ---------------------------------------------------------
# End of Script
# ---------------------------------------------------------
