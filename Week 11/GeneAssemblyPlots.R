library(tidyverse)
library(matrixStats)
library(limma)

coverage <- scan("~/qb25-answers/Week 11/coverage_output.txt")

lambda <- 3
mu <- 3
sd <- 1.73
maxcov <- max(coverage)
xs <- 0:maxcov

hist_data <- hist(coverage, breaks = 0:maxcov, plot = FALSE)

N <- length(coverage)

# Help from ChatGPT for poisson and normal distribution probabilities 
pois_probs <- dpois(xs, lambda = lambda)
pois_counts <- pois_probs * N   

norm_probs <- dnorm(xs, mean = mu, sd = sd)
norm_counts <- norm_probs * N   


png("~/qb25-answers/Week 11/ex1_3x_cov.png", width = 1200, height = 800)

hist(coverage, breaks = 0:maxcov, main = "Genome Coverage Distribution (3× coverage, 100 bp reads)",
     xlab = "Coverage depth", ylab = "Count", col = "lightgray", border = "white",
     freq = TRUE
)

#Poisson
lines(xs + 0.5, pois_counts, col = "red", lwd = 3)

#Normal
lines(xs + 0.5, norm_counts, col = "blue", lwd = 3)

legend(
  "topright",
  legend = c("Poisson (λ = 3)", "Normal (μ = 3, σ = 1.73)", "Coverage Histogram"),
  col = c("red", "blue", "lightgray"),
  lwd = c(3, 3, NA),
  pch = c(NA, NA, 15),
  pt.cex = 1.2,  
  cex = 0.8
)

dev.off()
