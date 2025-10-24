samtools index A01_09.bam
samtools index A01_11.bam
samtools index A01_23.bam
samtools index A01_24.bam
samtools index A01_27.bam
samtools index A01_31.bam
samtools index A01_35.bam
samtools index A01_39.bam
samtools index A01_62.bam
samtools index A01_63.bam


samtools view -c A01_09.bam
samtools view -c A01_11.bam
samtools view -c A01_23.bam
samtools view -c A01_24.bam
samtools view -c A01_27.bam
samtools view -c A01_31.bam
samtools view -c A01_35.bam
samtools view -c A01_39.bam
samtools view -c A01_62.bam
samtools view -c A01_63.bam

# run FreeBayes to discover variants 
freebayes -f ../sacCer3.fa -L bamListFIle.txt --genotype-qualities -p 1 > unfiltered.vcf

# the resulting VCF file is unfiltered, meaning that it contains low-confidence calls and also has some quirky formatting, so the following steps use a software suite called vcflib to clean up the VCF

# filter the variants based on their quality score and remove sites where any sample had missing data
vcffilter -f "QUAL > 20" -f "AN > 9" unfiltered.vcf > filtered.vcf

# FreeBayes has a quirk where it sometimes records haplotypes rather than individual variants; we want to override this behavior
vcfallelicprimitives -kg filtered.vcf > decomposed.vcf

# in very rare cases, a single site may have more than two alleles detected in your sample; while these cases may be interesting, they may also reflect technical errors and also pose a challenge for parsing the data, so we remove them
vcfbreakmulti decomposed.vcf > biallelic.vcf