library(tidyverse)
library(ggplot2)

gt_data <- read.table("~/qb25-answers/Week 3/ex3/gt_long.txt", header = TRUE, sep = "\t", stringsAsFactors = FALSE)

# Plot for only chrII for A01_62 
filtered_data <- gt_data %>%
  filter(A01_62 == "A01_62", chrI == "chrII")

ggplot(filtered_data, aes(x = X980, y = as.numeric(X0))) +
  geom_point(size = 2) +
  facet_grid(chrI ~ .) +
  scale_color_manual(values = c("blue", "red")) +
  labs(title = "Ancestry Visualization for Chromosome chrII (Sample: A01_62)",
       x = "Genomic Position",
       y = "Genotype") +
  theme_minimal()

# All chromosomes for A01_62
filtered_data_allchr <- gt_data %>%
  filter(A01_62 == "A01_62")

ggplot(filtered_data_allchr, aes(x = as.numeric(X980), y = 0)) +
  geom_point(size = 2) +
  facet_grid(chrI ~ ., scales = "free_x", space = "free_x") +
  scale_color_manual(values = c("blue", "red")) +
  labs(title = "Ancestry Visualization — All Chromosomes (A01_62)",
       x = "Genomic Position", y = NULL) +
  theme_minimal() +
  theme(axis.text.y = element_blank(),
        axis.ticks.y = element_blank())

# All samples, all chromosomes
ggplot(gt_data, aes(x = as.numeric(X980), y = A01_62)) +
  geom_point(size = 1.5) +
  facet_grid(chrI ~ ., scales = "free_x", space = "free_x") +
  scale_color_manual(values = c("blue", "red")) +
  labs(title = "Ancestry Visualization — All Samples, All Chromosomes",
       x = "Genomic Position", y = "Sample") +
  theme_minimal()





