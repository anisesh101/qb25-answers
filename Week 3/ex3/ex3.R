library(tidyverse)
library(ggplot2)

gt_data <- read.table("~/qb25-answers/Week 3/ex3/gt_long.txt", header = TRUE, sep = "\t", stringsAsFactors = FALSE)

# Plot for only chrII for A01_62 
filtered_data <- gt_data %>%
  filter(Sample_id == "A01_62", Chromosome == "chrII")

ggplot(filtered_data, aes(x = Position, y = 0, color = Genotype.ID)) +
  geom_point(size = 2) +
  facet_grid(Chromosome ~ .) +
  labs(title = "Ancestry Visualization for Chromosome chrII (Sample: A01_62)",
       x = "Genomic Position",
       y = "Genotype") +
  theme_minimal()

# All chromosomes for A01_62
filtered_data_allchr <- gt_data %>%
  filter(Sample_id == "A01_62")

ggplot(filtered_data_allchr, aes(x = Position, y = 0, color = factor(Chromosome))) +
  geom_point(size = 0.0001) +
  facet_grid(Chromosome ~ ., scales = "free_x", space = "free_x") +
  labs(title = "Ancestry Visualization — All Chromosomes (A01_62)",
       x = "Genomic Position", y = NULL) +
  theme_minimal() +
  theme(axis.text.y = element_blank(),
        axis.ticks.y = element_blank())

# All samples, all chromosomes
ggplot(gt_data, aes(x = as.numeric(Position), y = Sample_id, color = Genotype.ID)) +
  geom_point(size = 1.5) +
  facet_grid(Chromosome ~ ., scales = "free_x", space = "free_x") +
  labs(title = "Ancestry Visualization — All Samples, All Chromosomes",
       x = "Genomic Position", y = "Sample") +
  theme_minimal()





