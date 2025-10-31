library(tidyverse)
library(matrixStats)
library(limma)

df <- as.matrix(read.delim("~/qb25-answers/Week_6/read_matrix.tsv", row.names = 1))

# Exercise 1 ------------------------------------------------------------------------

geneSD <- rowSds(df)
sortedSDs <- sort(geneSD, decreasing = TRUE)

t500 <- names(sortedSDs[1:500])

pca_matrix <- df[t500, ]

pca_result <- prcomp(t(pca_matrix))

summary(pca_result)

pca_result$x[1:21, 1:2]

pca_data = tibble(Sample_Names = colnames(pca_matrix),
                  PC1 = pca_result$x[,1],
                  PC2 = pca_result$x[,2])

pca_data <- pca_data %>%
  tidyr::separate(Sample_Names, into = c("Tissue", "Replicate"), sep = "_")

  ggplot(pca_data, aes(x = PC1, y = PC2, color = Tissue, shape = Replicate)) +
  geom_point(size = 3) +
  labs(title = "PCA of Top 500 Most Variable Genes",
       x = "Principal Component 1",
       y = "Principal Component 2") +
  theme_minimal()
  
  # Unsure of how to make the fixes
  
  pca_summary <- tibble(
    PC = 1:length(pca_result$sdev),
    norm_var = 100 * (pca_result$sdev^2 / sum(pca_result$sdev^2))
  ) %>%
    mutate(cum_var = cumsum(norm_var))
  
  pca_summary %>%
    ggplot(aes(x = PC, y = norm_var)) +
    geom_bar(stat = "identity") +
    labs(title = "Variance Explained by Each Principal Component",
         x = "Principal Component",
         y = "Percent Variance Explained") +
    theme_minimal()
  
# Exercise 2 --------------------------------------------------------------------------
  
  combined = pca_matrix[,seq(1, 21, 3)]
  combined = combined + pca_matrix[,seq(2, 21, 3)]
  combined = combined + pca_matrix[,seq(3, 21, 3)]
  combined = combined / 3
  
  combinedSD <- rowSds(combined)
  combinedSD <- combined[combinedSD > 1, ]
  
  set.seed(42)
  
  kmeans_results <- kmeans(combinedSD, centers = 12, nstart = 100)
  
  ordering <- order(kmeans_results$cluster)
  sorted_data <- combinedSD[ordering, ]

  heatmap(sorted_data, Rowv=NA, Colv=NA, RowSideColors=RColorBrewer::brewer.pal(12,"Paired")[kmeans_results$cluster], ylab="Gene")

# Exercise 3 ----------------------------------------------------------------------------------------------------------------------  

  cluster3_genes <- noquote(rownames(combinedSD)[kmeans_results$cluster == 3])
  cluster6_genes <- rownames(combinedSD)[kmeans_results$cluster == 6]
  
  writeLines(cluster3_genes, con = "cluster3.txt")
  writeLines(cluster6_genes, con = "cluster6.txt")
  