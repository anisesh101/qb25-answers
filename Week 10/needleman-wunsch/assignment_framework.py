#!/usr/bin/env python3

import sys
import numpy as np
from fasta import readFASTA


#====================#
# Read in parameters #
#====================#

fasta_file = sys.argv[1]
sigma_file = sys.argv[2]
gap_penalty = float(sys.argv[3])
out_file = sys.argv[4]

fs = open(sigma_file)
sigma = {}
alphabet = fs.readline().strip().split()
for line in fs:
    line = line.rstrip().split()
    for i in range(1, len(line)):
        sigma[(alphabet[i - 1], line[0])] = float(line[i])
        
#DONT FORGET TO CLOSE
fs.close()

input_sequences = readFASTA(open(fasta_file))

seq1_id, sequence1 = input_sequences[0]
seq2_id, sequence2 = input_sequences[1]


m = len(sequence1)

n = len(sequence2)
#=====================#
# Initialize F matrix #
#=====================#

F = np.zeros((m + 1, n + 1))
traceback = np.zeros((m + 1, n + 1), dtype = str)

for i in range(1, m + 1):
    F[i][0] = F[i - 1][0] + gap_penalty
    traceback[i][0] = "U"   

for j in range(1, n + 1):
    F[0][j] = F[0][j - 1] + gap_penalty
    traceback[0][j] = "L"   

traceback[0][0] = "E"       

#===================#
# Populate Matrices #
#===================#


for i in range(1, len(sequence1) + 1):       
    for j in range(1, len(sequence2) + 1):   

        s1 = sequence1[i - 1]
        s2 = sequence2[j - 1]
        
        d = F[i - 1, j - 1] + sigma[(s1, s2)]
        h = F[i, j - 1] + gap_penalty
        v = F[i - 1, j] + gap_penalty

        F[i, j] = max(d, h, v)

        if F[i, j] == d:
            traceback[i, j] = "D"
        elif F[i, j] == v:
            traceback[i, j] = "U"
        else:
            traceback[i, j] = "L"


#========================================#
# Follow traceback to generate alignment #
#========================================#

x = m
y = n
sequence1_align = ""
sequence2_align = ""

while not (x == 0 and y == 0):
    trace = traceback[i][j]
    if trace == "D":
        sequence1_align = sequence1[i - 1] + sequence1_align
        sequence2_align = sequence2[j - 1] + sequence2_align
        x -= 1
        y -= 1
    elif trace == "U":
        sequence1_align = sequence1[i - 1] + sequence1_align
        sequence2_align = "-" + sequence2_align
        x -= 1
    elif trace == "L":
        sequence1_align = "-" + sequence1_align
        sequence2_align = sequence2[j - 1] + sequence2_align
        y -= 1
    elif trace == "E":
        break

#=================================#
# Generate the identity alignment #
#=================================#

identity_alignment = ""
for i in range(len(sequence1_align)):
    if sequence1_align[i] == sequence2_align[i]:
        identity_alignment += "|"
    else:
        identity_alignment += " "


#===========================#
# Write alignment to output #
#===========================#

output = open(out_file, "w")

for i in range(0, len(identity_alignment), 100):
    output.write(sequence1_align[i:i + 100] + "\n")
    output.write(identity_alignment[i:i + 100] + "\n")
    output.write(sequence2_align[i:i + 100] + "\n\n\n")

#DONT FORGET TO CLOSE
output.close()


#=============================#
# Calculate sequence identity #
#=============================#

gaps_seq1 = sequence1_align.count("-")
gaps_seq2 = sequence2_align.count("-")

matches = sum(1 for a, b in zip(sequence1_align, sequence2_align) if a == b)

identity1 = matches / len(sequence1_align) * 100
identity2 = matches / len(sequence2_align) * 100

final_score = F[m][n]

#======================#
# Print alignment info #
#======================#

print("Gaps in sequence1:", gaps_seq1)
print("Gaps in sequence2:", gaps_seq2)
print(f"% identity (sequence1): {identity1:.2f}%")
print(f"% identity (sequence2): {identity2:.2f}%")
print("Alignment score:", final_score)

