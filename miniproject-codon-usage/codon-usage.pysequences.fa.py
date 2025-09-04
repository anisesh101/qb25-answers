import sys
import fasta
import codons
import codons

fs = open(sys.argv[1])
fs1 = open("codons.py")

FASTAreader = fasta.FASTAReader(fs)

codon = ""

codon_to_aa = {}
aas = {}

for ident, sequence in FASTAreader:
    counter = 0
    #print(ident)
    for i in sequence:
        if counter < len(sequence) - 1:
            codon = sequence[counter] + sequence[counter + 1] + sequence[counter + 2]
            #print(codon)
            if codon in codons.forward:
                codon_to_aa[codon] = codons.forward[codon]
                key = codons.forward[codon]
                aas.setdefault(key, 0)
                aas[key] += 1
            counter += 3
            continue
        else:
            continue

print(aas)






