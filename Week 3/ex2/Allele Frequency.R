library(tidyverse)

af <- read.csv("~/qb25-answers/Week 3/ex2/AF.txt", header = TRUE)

hist(af$X0, breaks = 11, xlab = "Allele Frequncy", main = "Allele Frequency Distribution")

# Question 2.1: Interpret this figure in two or three sentences in your own words. Does it look as expected? Why or why not? Bonus: what is the name of this distribution?
  
# The distribution of allele frequencies shows a strong peak around 0.5. This indicates that both alleles are present at similar frequencies across the population. This is expected under conditions of recombination and no strong selection where allele frequencies tend to drift toward equilibrium around 0.5. The shape of the curve resembles a normal distribution.