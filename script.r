#! Visualization 1 - Data Analysis & Visualization in R
#! Author: Nargiza Matmusaeva
#! Due Date: February 27, 2025

# Function to Install and Load Required Packages
install_if_missing <- function(packages) {
    new_packages <- packages[!(packages %in% installed.packages()[,"Package"])]
    if (length(new_packages)) {
        options(repos = c(CRAN = "https://cloud.r-project.org/")) 
        install.packages(new_packages, dependencies = TRUE)
    }
    invisible(lapply(packages, library, character.only = TRUE))
}

# Define required packages
required_packages <- c("gapminder", "ggplot2", "dplyr")

# Install and Load required packages
install_if_missing(required_packages)

# Import required libraries
library(gapminder)
library(ggplot2)
library(dplyr)

# Describe the dataset
cat("\nExploring gapminder dataset...\n")
?gapminder  
print(head(gapminder)) 

# Create a subset for 2007
cat("\nCreating a subset for 2007...\n")
gapminder07 <- subset(gapminder, year == 2007)
print(head(gapminder07))

# Count number of different countries in 2007
num_countries <- length(unique(gapminder07$country))
cat("\nNumber of unique countries in 2007:", num_countries, "\n")

# Visualizations

# Histogram of Life Expectancy in 2007
cat("\nGenerating Histogram of Life Expectancy in 2007...\n")
p1 <- ggplot(gapminder07, aes(x = lifeExp)) +
    geom_histogram(binwidth = 2, fill = "steelblue", color = "black") +
    labs(title = "Life Expectancy Distribution (2007)", x = "Life Expectancy", y = "Count")
print(p1)

# Scatter Plot: GDP Per Capita vs Life Expectancy
cat("\nGenerating Scatter Plot: GDP Per Capita vs Life Expectancy...\n")
p2 <- ggplot(gapminder07, aes(x = gdpPercap, y = lifeExp)) +
    geom_point(color = "blue") +
    scale_x_log10() +  
    labs(title = "GDP Per Capita vs. Life Expectancy (2007)", x = "GDP per Capita", y = "Life Expectancy")
print(p2)

# Scatter Plot with Continents Colored
cat("\nGenerating Scatter Plot with Continents Colored...\n")
p3 <- ggplot(gapminder07, aes(x = gdpPercap, y = lifeExp, color = continent)) +
    geom_point(size = 3) +
    scale_x_log10() +
    labs(title = "GDP Per Capita vs. Life Expectancy (2007) by Continent", x = "GDP per Capita", y = "Life Expectancy") +
    theme_minimal()
print(p3)

# Compute Average Life Expectancy per Continent
cat("\nComputing Average Life Expectancy by Continent...\n")
avg_lifeExp_continent <- gapminder07 %>%
    group_by(continent) %>%
    summarise(avg_lifeExp = mean(lifeExp, na.rm = TRUE))
print(avg_lifeExp_continent)

# Line Plot: Life Expectancy Over Time for 3 Selected Countries
cat("\nGenerating Life Expectancy Trends for Selected Countries...\n")

# Some examples of selected countries in mind, can be changed
selected_countries <- c("United States", "Japan", "India")  

gapminder_selected <- gapminder %>% 
    filter(country %in% selected_countries)

p4 <- ggplot(gapminder_selected, aes(x = year, y = lifeExp, color = country)) +
    geom_line(size = 1.2) +
    geom_point(size = 2) +
    labs(title = "Life Expectancy Over Time (Selected Countries)", x = "Year", y = "Life Expectancy") +
    theme_minimal()
print(p4)

# End of Script
cat("\nData processing & visualization complete!\n")