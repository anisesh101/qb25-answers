library(tidyverse)

dp <- read.csv("~/qb25-answers/Week 3/ex2/DP.txt", header = TRUE)

hist(dp$X1, breaks = 21, xlab = "Depth Frequency", main = "Depth Frequency Distribution")

# Question 2.2: Interpret this figure in two or three sentences in your own words. What does it represent? Does it look as expected? Why or why not? Bonus: what is the name of this distribution?

# This figure shows the distribution of sequencing read depths across all S. cerevisiae samples. Most sites have moderate to high coverage which indicates reliable data, though the left-skew suggests some regions were sequenced at lower depth. The left skewed distribution is typical for sequencing experiments.