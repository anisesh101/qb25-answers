import sys
import fasta
import codons

fa_file = open(sys.argv[1])
FASTAreader = fasta.FASTAReader(fa_file)

amino_acid = sys.argv[2]

counts = {}

for ident, sequence in FASTAreader:
    counter = 0
    codon_counter = 0
    for i in sequence:
        if counter < len(sequence) - 1:
            codon = sequence[counter] + sequence[counter + 1] + sequence[counter + 2]
            counter += 3
            codon_counter += 1

            if amino_acid in codons.reverse:
                for i in codons.reverse[amino_acid]:
                    if i == codon:
                        key = codons.forward[codon] 
                        counts.setdefault(key, 0)
                        counts[key] += 1 
print(counts)
#print(codon_counter)
