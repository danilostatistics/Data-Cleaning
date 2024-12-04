# Load the necessary library
library(survival)  # For survival analysis datasets and functions

# #########################################################
# Script: Data Cleaning for Heart Dataset
# #########################################################

# ---------------------------------------------------------
# Identify Patients with Two Observations
# ---------------------------------------------------------

# Extract unique patient IDs from the heart dataset
unique_ids <- unique(heart$id)

# Identify patient IDs that have exactly two observations
idx <- unique_ids[table(as.factor(heart$id)) == 2]

# Subset the dataset for patients with exactly two observations
heart_12 <- heart[heart$id %in% idx, ]

# ---------------------------------------------------------
# Split the Dataset into First and Second Observations
# ---------------------------------------------------------

# Extract the first observation for each patient
heart_1 <- heart_12[seq(1, nrow(heart_12), by = 2), ]

# Extract the second observation for each patient
heart_2 <- heart_12[seq(2, nrow(heart_12), by = 2), ]

# ---------------------------------------------------------
# Rename Columns for Consistency
# ---------------------------------------------------------

# Rename columns in the first observation dataset
colnames(heart_1) <- c('t11', 't12', 'event_1', 'age', 'year_1', 'surgery_1', 'transplant_1', 'id')

# Rename columns in the second observation dataset
colnames(heart_2) <- c('t21', 't22', 'event_2', 'age', 'year_2', 'surgery_2', 'transplant_2', 'id')

# ---------------------------------------------------------
# Combine the Datasets
# ---------------------------------------------------------

# Combine the relevant columns from the first and second observation datasets
heart_JSS <- cbind(
  heart_1[, c('t11', 't12', 'event_1', 'year_1', 'surgery_1', 'transplant_1')], 
  heart_2
)

# ---------------------------------------------------------
# Add a Small Tolerance Value
# ---------------------------------------------------------

# Add a small tolerance value to the t11 column
heart_JSS$t11 <- 1e-04

# ---------------------------------------------------------
# Save the Cleaned Dataset
# ---------------------------------------------------------

# Save the final cleaned dataset as an RData file
save(heart_JSS, file = "heart.RData")

# ---------------------------------------------------------
# End of Script
# ---------------------------------------------------------

