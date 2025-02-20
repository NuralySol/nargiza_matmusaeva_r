# 📊 Assignment 1 - Data Analysis & Visualization

## Overview

This project contains R scripts to analyze two datasets:

1. **Custom CSV Data (`assignment1_vectors.csv`)** - Computes summary statistics, subsets, and visualizations.
2. **Gapminder Dataset (`gapminder` package)** - Analyzes life expectancy, GDP per capita, and trends over time.

All generated plots are saved in the **plots/** folder.

---

## **1️⃣ CSV Data Analysis**

### **1.1 Importing the Data**

- The script reads the dataset from `assignment1_vectors.csv`.
- It displays the first few rows for inspection.

### **1.2 Data Summary**

- **Total observations**
- **Total variables**
- **Summary of each variable (mean, min, max)**

### **1.3 Creating Subsets**

- **Subset where `v1 < 10`**
- **Subset where `v1 < 10` and `v2 > 5`**

### **1.4 Generated Plots**

All plots are **saved in `plots/` folder**.

| **Plot** | **Description** | **Filename** |
|----------|----------------|-------------|
| Histogram of `v1` | Distribution of `v1` values | `plots/histogram_v1.png` |
| Scatter Plot (`v1` vs `v2`) | Relationship between `v1` and `v2` | `plots/scatter_v1_v2.png` |

---

## **2️⃣ Gapminder Data Analysis**

### **2.1 Dataset Overview**

- The `gapminder` dataset contains **country-level statistics** for GDP per capita, life expectancy, and population.
- The script creates a **subset for 2007**.

### **2.2 Summary Statistics**

- **Number of unique countries in 2007**
- **Average life expectancy per continent**
