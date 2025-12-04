import numpy as np
import math

## initialize parameters
genomesize = 1000000
readlength = 100
coverage = 3

## num_reads = calculate_number_of_reads(genomesize, readlength, coverage)
num_reads = int((genomesize * coverage) / readlength)

## use an array to keep track of the coverage at each position in the genome
genome_coverage = np.zeros(genomesize, dtype=int)

for i in range(num_reads):

    ## startpos = uniform_random(0, genomelength - readlength + 1)
    startpos = np.random.randint(0, genomesize - readlength + 1)

    endpos = startpos + readlength

    ## genomecoverage[startpos:endpos] += 1
    genome_coverage[startpos:endpos] += 1

## get the range of coverages observed
maxcoverage = max(genome_coverage)
xs = list(range(0, maxcoverage + 1))

## Get the poisson pmf at each of these
poisson_estimates = []
for k in xs:
    value = math.exp(-coverage) * coverage**k / math.factorial(k)
    poisson_estimates.append(value)

## Get normal pdf at each of these (i.e. the density between each adjacent pair of points)
normal_estimates = []
stddev = math.sqrt(coverage)
coef = 1 / (stddev * math.sqrt(2 * math.pi))

for x in xs:
    exponent = math.exp(-((x - coverage)**2) / (2 * stddev**2))
    normal_estimates.append(coef * exponent)

f = open("coverage_output.txt", "w")
for c in genome_coverage:
    f.write(str(c) + "\n")
f.close()