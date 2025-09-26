# Exercise 1
## bowtie2 -p 4 -x ../genomes/sacCer3 -U ~/Data/BYxRM/fastq/A01_01.fq.gz > A01_01.sam

## samtools sort -o A01_01.bam A01_01.sam

## samtools index A01_01.bam

## samtools idxstats A01_01.bam > A01_01.idxstats

# Exercise 2
## The sequences from files A01_02, A01_05, and A01_06 have the highest level of mismatch rates in the 27,000 and 32,000 bp range

# Exercise 4
## minimap2 -a -x map-ont ../genomes/sacCer3.fa ../rawdata/ERR8562478.fastq > longreads.sam

# Exercise 5
## hisat2 -x sacCer3 -U ../longreads/SRR10143769.fastq -S rnaseq.sam           
## The beginning and ends of the genes generally had more reads and greater coverage

