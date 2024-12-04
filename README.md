# Data Cleaning and Formatting Scripts

## Overview
This folder contains R scripts used for cleaning and formatting various datasets from the `survival` package. The primary purpose of these scripts is to prepare the datasets for use with the `GJRM` package, which implements **Bivariate Copula Survival Functions** accounting for censoring.

---

## Datasets
The datasets used in these scripts are originally sourced from the `survival` package. Each script focuses on cleaning and formatting a specific dataset to ensure compatibility with the `GJRM` package requirements.

---

## Purpose of the Scripts
The scripts:
- Extract relevant variables and observations from the original datasets.
- Split the data into subsets (e.g., left/right eye or multiple observations per patient).
- Format the variables and rename columns for consistency.
- Add necessary adjustments (e.g., small tolerance values for time variables).
- Save the cleaned and formatted datasets in `.RData` format.

The formatted datasets are tailored to be directly compatible with **Bivariate Copula Survival Models** provided by the `GJRM` package.

---

## Scripts Included
1. **Kidney Dataset Script**  
   - Cleans and formats the `kidney` dataset.
   - Prepares it for analysis using copula models.

2. **Diabetic Dataset Script**  
   - Cleans and formats the `diabetic` dataset for analysis.
   - Splits left and right eye observations and ensures consistency.

3. **Heart Dataset Script**  
   - Processes and formats the `heart` dataset.
   - Extracts pairs of observations for patients with multiple entries.

---

## Requirements
- **R Version**: Ensure you have R installed.
- **Required Packages**:
  - `survival`
  - `copula`
  - `tidyverse` (optional for additional data manipulation)
- **Dataset Source**: The datasets are preloaded in the `survival` package.

---

## How to Use
1. Clone or download this repository.
2. Open the desired script in your R environment.
3. Ensure the required datasets from the `survival` package are loaded.
4. Run the script to generate the formatted dataset in `.RData` format.
5. Use the resulting dataset with the `GJRM` package for further analysis.

---

## Notes
- The scripts are optimized for use with **Bivariate Copula Survival Models**.
- Some manual adjustments (e.g., variable selection) may be needed depending on specific analysis goals.

Feel free to reach out if you encounter issues or have questions regarding these scripts.
