#!/usr/bin/env python3

import sys
import fasta 

fs = open(sys.argv[1])

FASTAReader = fasta.FASTAReader(fs)

contigs = 0
total_Length = 0

for ident, sequence in FASTAReader:
    total_Length += len(sequence)
    contigs += 1

print("Number of contigs:", contigs, "Total Length:", total_Length, "Average Length:", total_Length/contigs)

