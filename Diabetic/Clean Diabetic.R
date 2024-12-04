# Load the necessary library
library(survival)  # For survival analysis datasets and functions

# #########################################################
# Script: Data Cleaning for Diabetic Dataset (Left and Right Eyes)
# #########################################################

# Preview the diabetic dataset (ensure it is loaded in your environment)
diabetic

# ---------------------------------------------------------
# Split the Dataset into Left and Right Eye Observations
# ---------------------------------------------------------

# Extract observations for the left eye (odd rows)
diabetic_left <- diabetic[seq(1, nrow(diabetic), by = 2), ]

# Extract observations for the right eye (even rows)
diabetic_right <- diabetic[seq(2, nrow(diabetic), by = 2), ]

# ---------------------------------------------------------
# Rename Columns for Consistency
# ---------------------------------------------------------

# Rename the 'time' column to 't12' in the left eye dataset
names(diabetic_left)[names(diabetic_left) == 'time'] <- 't12'

# Rename the 'time' column to 't22' in the right eye dataset
names(diabetic_right)[names(diabetic_right) == 'time'] <- 't22'

# ---------------------------------------------------------
# Subset and Rename Columns in the Left Eye Dataset
# ---------------------------------------------------------

# Select relevant columns for the left eye dataset
diabetic_left <- diabetic_left[, c('trt', 'risk', 't12', 'status')]

# Rename columns for the left eye dataset for clarity
colnames(diabetic_left) <- c('trt_left', 'risk_left', 't12', 'status_left')

# ---------------------------------------------------------
# Rename Columns in the Right Eye Dataset
# ---------------------------------------------------------

# Rename columns in the right eye dataset for clarity
colnames(diabetic_right) <- c('id', 'laser', 'age', 'eye', 'trt_right', 'risk_right', 't22', 'status_right')

# ---------------------------------------------------------
# Add Small Tolerance Values to Time Variables
# ---------------------------------------------------------

# Add a small tolerance value (t11) to the left eye dataset
diabetic_left$t11 <- 1e-04

# Add a small tolerance value (t21) to the right eye dataset
diabetic_right$t21 <- 1e-04

# ---------------------------------------------------------
# Combine Left and Right Eye Datasets
# ---------------------------------------------------------

# Combine the left and right eye datasets column-wise
diabetic_JSS <- cbind(diabetic_right, diabetic_left)

# Save the final combined dataset as an RData file
save(diabetic_JSS, file = "Diabetic.RData")

# ---------------------------------------------------------
# End of Script
# ---------------------------------------------------------
