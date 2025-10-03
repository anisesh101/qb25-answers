library(tidyverse)

af <- read.csv("~/qb25-answers/Week 3/ex2/AF.txt", header = TRUE)

hist(af$X0, breaks = 11, xlab = "Allele Frequncy", main = "Allele Frequency Distribution")

# The distribution has a peak in the bin containing allele frequencies of 0, with a muted normal distribution (relatively) peaking at around 0.4. Does it look as expected...?