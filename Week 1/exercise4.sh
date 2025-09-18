bedtools intersect -c -a hg19-kc.bed -b snps-chr1.bed > snps_per_gene.bed
sort -k4 -nr snps_per_gene.bed | head -n 1
# chrY	9930483	9930602	ENST00000516480.1_3
# Gene (Readable Name): RNA5SP519 
# Systematic Name: ENST00000516480.1_3
# Position: chrY 9930483-9930602
# size 119
# The gene is a ribosomal pseudogene and liekly does not become affectd by SNP generation over time, therefore it contains the most SNPs


bedtools sample -n 20 -seed 42 -i snps_per_gene.bed > subset_snps.bed

bedtools sort -i subset_snps.bed > sorted_subset_snps.bed

bedtools sort -i hg19-kc.bed > sorted_hg19.bed   

bedtools closest -d -t first -a sorted_subset_snps.bed -b sorted_hg19.bed > snps_closest_genes.bed

head snps_closest_genes.bed
# 21 SNPs are inside of a gene