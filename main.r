#! Assignment 1 - Data Analysis & Visualization in R
#! Author: Nargiza Matmusaeva
#! Due Date: February 27, 2025

# Function to Install and Load Required Packages, install them if they are missing
install_if_missing <- function(packages) {
    new_packages <- packages[!(packages %in% installed.packages()[,"Package"])]
    if (length(new_packages)) install.packages(new_packages, dependencies = TRUE)
    invisible(lapply(packages, library, character.only = TRUE))
}

# Define required packages
required_packages <- c("readr", "ggplot2", "tidyr", "dplyr")

# Install and Load required packages
install_if_missing(required_packages)

# Import required libraries
library(readr)
library(ggplot2)
library(tidyr)
library(dplyr)

# Import the dataset
cat("\nLoading dataset: assignment1_vectors.csv...\n")
df <- read_csv("assignment1_vectors.csv")

# Confirm Data Import and print the head data validation
cat("Data successfully loaded!\n\n")
cat("First 5 rows of the dataset:\n")
print(head(df))

# Count Observations & Variables
num_observations <- nrow(df)
num_variables <- ncol(df)

cat("\nNumber of observations:", num_observations, "\n")
cat("Number of variables:", num_variables, "\n")

# Compute Averages of Each Variable
averages <- colMeans(df, na.rm = TRUE)
cat("\nAverages of each variable:\n")
print(averages)

# Compute Min & Max Values for Each Variable
min_values <- apply(df, 2, min, na.rm = TRUE)
max_values <- apply(df, 2, max, na.rm = TRUE)

cat("\nMinimum values of each variable:\n")
print(min_values)
cat("\nMaximum values of each variable:\n")
print(max_values)

# Create Subset Where v1 < 10
df_subset1 <- subset(df, v1 < 10)
cat("\nSubset where v1 < 10 (First 5 rows):\n")
print(head(df_subset1))

# Create Subset Where v1 < 10 and v2 > 5
df_subset2 <- subset(df, v1 < 10 & v2 > 5)
cat("\nSubset where v1 < 10 and v2 > 5 (First 5 rows):\n")
print(head(df_subset2))

# Data Processing Complete log
cat("\nData processing complete!\n")

#! VISUALIZATIONS

# Histogram of v1
cat("\nGenerating Histogram of v1...\n")
p1 <- ggplot(df, aes(x = v1)) +
    geom_histogram(binwidth = 2, fill = "steelblue", color = "black") +
    labs(title = "Distribution of v1", x = "v1 Values", y = "Frequency")
print(p1)

# Boxplot: v1, v2, and v3
cat("\n Generating Boxplot for Variables...\n")
df_long <- pivot_longer(df, cols = c(v1, v2, v3), names_to = "variable", values_to = "value")
p2 <- ggplot(df_long, aes(x = variable, y = value, fill = variable)) +
    geom_boxplot() +
    labs(title = "Boxplot of v1, v2, and v3", x = "Variable", y = "Value")
print(p2)

# Scatter Plot: v1 vs v2
cat("\n Generating Scatter Plot of v1 vs v2...\n")
p3 <- ggplot(df, aes(x = v1, y = v2)) +
    geom_point(color = "blue") +
    labs(title = "Scatter Plot of v1 vs v2", x = "v1", y = "v2")
print(p3)

# Scatter Plot: v1 vs v3 
cat("\n Generating Scatter Plot of v1 vs v3 (v1 < 10)...\n")
p4 <- ggplot(df_subset1, aes(x = v1, y = v3)) +
    geom_point(color = "red") +
    labs(title = "Scatter Plot of v1 vs v3 (v1 < 10)", x = "v1", y = "v3")
print(p4)

# End of Script
cat("\n🎯 Data processing & visualization complete!\n")