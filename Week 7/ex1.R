library(tidyverse)
library(DESeq2)
library(broom)

metadata_df <- read_delim("~/qb25-answers/Week 7/gtex_metadata_downsample.txt")

df <- read_delim("~/qb25-answers/Week 7/gtex_whole_blood_counts_downsample.txt")

metadata_df <- as_tibble(metadata_df)
df <- as_tibble(df)

df <- column_to_rownames(df, var = "GENE_NAME")
metadata_df <- column_to_rownames(metadata_df, var = "SUBJECT_ID")

# check
colnames(df) == rownames(metadata_df)


dds <- DESeqDataSetFromMatrix(countData = df,
                              colData = metadata_df,
                              design = ~ SEX + AGE + DTHHRDY)

vsd <- vst(dds)

# MAKE SURE TO SAVE FILES
plotPCA(vsd, intgroup = "SEX")
plotPCA(vsd, intgroup = "AGE")
plotPCA(vsd, intgroup = "DTHHRDY")

# Proportion of variance explained by PC1 is 48%
# PC2 is 7%

# PC1 is associated with DTHHRDY
# PC2 is not well explained by any of the variables
# STILL NEED TO ANSWER:
# Interpret these patterns in your own words and record your answers as a comment in your code.

vsd_df <- assay(vsd) %>%
  t() %>%
  as_tibble()

vsd_df <- bind_cols(metadata_df, vsd_df)

m1 <- lm(formula = WASH7P ~ DTHHRDY + AGE + SEX, data = vsd_df) %>%
  summary() %>%
  tidy()

# Does WASH7P show significant evidence of sex-differential expression
# (and if so, in which direction)? Explain your answer.

# NOT SIG

m2 <- lm(formula = SLC25A47 ~ DTHHRDY + AGE + SEX, data = vsd_df) %>%
  summary() %>%
  tidy()

# Now repeat your analysis for the gene SLC25A47. Does this gene show evidence 
# of sex-differential expression (and if so, in which direction)? Explain your answer.

# SIG if 0.05 is threshold

dds <- DESeq(dds)

res <- results(dds, name = "SEX_male_vs_female") %>%
  as.data.frame() %>%
  rownames_to_column(var = "GENE_NAME") %>%
  filter(padj < 0.10) %>%
  as_tibble()

res

# 262 genes exhibit sig diff expression between males and females

mapped_df <- read_delim("~/qb25-answers/Week 7/gene_locations.txt")

mapped_df <- left_join(res, mapped_df, by = "GENE_NAME") %>%
  arrange(padj)

# The Y chromosome encodes the genes with the most strongly upregulated genes in males vs females. 
# There are more male upregulated genes vs female upreg genes. This may contribute to higher male mortality rates or shorter lifespans

# How many genes are significantly differentially expressed between sexes?
num_sig_genes <- sum(master_df$padj < 0.1, na.rm = TRUE)
num_sig_genes
# 262

res_dth <- results(dds, name = "DTHHRDY_ventilator_case_vs_fast_death_of_natural_causes") %>%
  as.data.frame() %>%
  rownames_to_column(var = "GENE_NAME") %>%
  filter(padj < 0.10) %>%
  as_tibble()

# Number of significant genes under FDR 10%: 16069

# Permute the SEX labels in metadata
metadata_perm <- metadata_df
metadata_perm$SEX <- sample(metadata_perm$SEX)

# Create a new DESeq2 object using the permuted metadata
dds_perm <- DESeqDataSetFromMatrix(
  countData = df,
  colData = metadata_perm,
  design = ~ SEX + AGE + DTHHRDY
)

# Run DESeq2
dds_perm <- DESeq(dds_perm)

# Extract results for the permuted SEX variable
res_perm <- results(dds_perm, name = "SEX_male_vs_female") %>%
  as.data.frame() %>%
  rownames_to_column(var = "GENE_NAME") %>%
  filter(padj < 0.10) %>%
  as_tibble()

# 48