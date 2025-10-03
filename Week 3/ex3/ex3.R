library(tidyverse)
library(ggplot2)

gt_data <- read.table("~/qb25-answers/Week 3/ex3/gt_long.txt", header = TRUE, sep = "\t", stringsAsFactors = FALSE)

filtered_data <- subset(gt_data, A01_62 == "A01_62")

ggplot(filtered_data, aes(x = X980, y = as.numeric(X0))) +
  geom_point(size = 2) +
  facet_grid(chrI ~ .) +
  scale_color_manual(values = c("blue", "red")) +
  labs(title = "Ancestry Visualization for Chromosome chrII (Sample: A01_62)",
       x = "Genomic Position",
       y = "Genotype") +
  theme_minimal()







