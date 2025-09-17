bedtools intersect -c -a nhek-active.bed -b nhlf-active.bed | wc
#    14013  126117  927731
bedtools intersect -v -a nhek-active.bed -b nhlf-active.bed | wc
#    2405   19240  154383
bedtools intersect -u -a nhek-active.bed -b nhlf-active.bed | wc
#    11608   92864  745322

bedtools intersect -f 1 -a nhek-active.bed -b nhlf-active.bed
# chr1	25558413	25559413
# NHLF: Mostly active with some weak promoter, strong enhancer, and weak enhancer
# NHEK: somewhat active somewhat strong enhancers
bedtools intersect -F 1 -a nhek-active.bed -b nhlf-active.bed
# chr1	19923013	19924213
# NHLF: somewhat active with some weak/strong enhancer 
# NHEK: Almost entirely active with some heterochromatin
bedtools intersect -f 1 -F 1 -a nhek-active.bed -b nhlf-active.bed
# chr1	1051137	1051537
# NHLF: completely active
# NHEK: completely active

bedtools intersect -a nhek-active.bed -b nhlf-active.bed
# chr1	19923013	19924213
# NHLF: completely active 
# NHEK: completely active
# K562: mostly active but with a few strong enhancers
# HUVEC: mostly active but with a few strong enhancers
# HSMM: completely active
# HMEC: mostly active but with a few strong enhancers
# HepG2: completely active
# H1-hESC: completely active
# GM12878: completely active
bedtools intersect -a nhek-active.bed -b nhlf-repressed.bed 
# chr1	1981140	1981540
# # NHLF: completely repressed
# NHEK: completely active
# K562: some insultion some weak enhancers
# HUVEC: some repressed some poised
# HSMM: completely repressed
# HMEC: completely active 
# HepG2: completely active
# H1-hESC: completely strongly enhanced
# GM12878: completely active
bedtools intersect -a nhek-repressed.bed -b nhlf-repressed.bed 
# chr1	11537413	11538213
# NHLF: completely repressed
# NHEK: completely repressed
# K562: All heterochromatin
# HUVEC: All heterochromatin
# HSMM: completely repressed
# HMEC: completely repressed
# HepG2: All heterochromatin
# H1-hESC: completely repressed
# GM12878: All heterochromatin