# TITLE 

# SHORT DESCRIPTION

# 2 Parse CDS sequence into three nucleotide codons
## the output of my script showed the ident along with the groups of consecutive codons. The reason I believe it is correctly outputting the data is because I begin and end with start and stop codons.

# 3 a
## python3 codon-usage.pysequences.fa.py subset.fa 
## The output of the above script showed the amino acid abundance. I am confident this is correct as there is only one occurence of the stop codon '*' at the end and no one amino aid seems to be abnormally high                   

# 3 b
## python3 codon-usage.pysequences.fa.py cytoplasm.fa                 
{'M': 988, 'P': 2762, 'F': 1610, 'L': 4769, 'E': 3544, 'D': 2252, 'T': 2633, 'N': 1704, 'A': 3183, 'R': 2622, 'V': 2525, 'G': 2663, 'K': 2570, 'C': 954, 'S': 3808, 'I': 1907, 'Q': 2166, 'H': 1273, 'Y': 1201, '*': 100, 'W': 535}

## python3 codon-usage.pysequences.fa.py membrane.fa                  
{'M': 1010, 'A': 3364, 'E': 2953, 'S': 4272, 'R': 2511, 'G': 3143, 'L': 5044, 'Y': 1438, 'W': 595, 'C': 1031, 'F': 1961, 'V': 2921, 'I': 2365, 'K': 2207, 'P': 3053, 'T': 3468, 'H': 1224, 'Q': 1879, 'N': 1797, 'D': 2039, '*': 100}

## the difference seems to be slight but there are generally more hydrophilic amino acids in the membrane (likely parts of proteins exposed outside of the membrane) than the cytoplasm
