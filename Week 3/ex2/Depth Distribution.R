library(tidyverse)

dp <- read.csv("~/qb25-answers/Week 3/BYxRM_bam/DP.txt", header = TRUE)

hist(dp$X3, breaks = 21, xlab = "Depth Frequency", main = "Depth Frequency Distribution")
