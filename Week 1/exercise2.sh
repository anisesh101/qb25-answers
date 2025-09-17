bedtools intersect -c -a hg16-1mb.bed -b hg16-kc.bed > hg16-kc-count.bed

bedtools makewindows -g  hg16-main.chrom.sizes -w 1000000 > hg16-1mb.bed

wc hg19-kc.bed
# 80270
bedtools intersect -v -a hg19-kc.bed -b hg16-kc.bed | wc
# 42717
# Some genes are in hg19 and not hg16 because of the sequencing tehcnology and the fact that there are sometimes large gaps between two different genome assemblies of the same species 

wc hg16-kc.bed
# 21365
bedtools intersect -v -a hg16-kc.bed -b hg19-kc.bed | wc
# 3460
# Some genes are in hg16 and not hg19 because of the sequencing tehcnology and the fact that there are sometimes large gaps between two different genome assemblies of the same species 