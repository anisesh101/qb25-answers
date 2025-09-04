import sys
import fasta

fs = open(sys.argv[1])
FASTAreader = fasta.FASTAReader(fs)

codon = ""


for ident, sequence in FASTAreader:
    counter = 0
    #print(ident)
    for i in sequence:
        if counter < len(sequence) - 1:
            codon = sequence[counter] + sequence[counter + 1] + sequence[counter + 2]
            #print(codon)
            counter += 3
            continue
        else:
            continue


