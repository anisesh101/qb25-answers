import sys
import fasta
import codons

fs = open(sys.argv[1])
fs2 = open(sys.argv[2])

fs1 = open("codons.py")

FASTAreader1 = fasta.FASTAReader(fs)
FASTAreader2 = fasta.FASTAReader(fs2)

codon = ""

codon_to_aa = {}
aas1 = {}
aas2 = {}

for ident, sequence in FASTAreader1:
    counter = 0
    #print(ident)
    for i in sequence:
        if counter < len(sequence) - 1:
            codon = sequence[counter] + sequence[counter + 1] + sequence[counter + 2]
            #print(codon)
            if codon in codons.forward:
                codon_to_aa[codon] = codons.forward[codon]
                
                key2 = codons.forward[codon]
                aas1.setdefault(key2, 0)
                aas1[key2] += 1

                key3 = codons.forward[codon]
                aas2.setdefault(key3, 0)
                aas2[key3] += 1
            counter += 3
            continue
        else:
            continue

for ident, sequence in FASTAreader2:
    counter = 0
    #print(ident)
    for i in sequence:
        if counter < len(sequence) - 1:
            codon = sequence[counter] + sequence[counter + 1] + sequence[counter + 2]
            #print(codon)
            if codon in codons.forward:
                codon_to_aa[codon] = codons.forward[codon]

                key3 = codons.forward[codon]
                aas2.setdefault(key3, 0)
                aas2[key3] += 1
            counter += 3
            continue
        else:
            continue

#print(aas1)
#print(aas2)

sorted_aas = sorted(list(codons.reverse.keys()))
print(sorted_aas)


for i in sorted_aas:
    print(f"{i}\t{aas1[i]}\t{aas2[i]}")








