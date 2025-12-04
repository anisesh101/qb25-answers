1.1: 30,000 reads would be necessary to achieve 3× coverage of the 1
     Mbp genome.

1.4: Looking at the histogram, a noticeable portion of positions falls 
into the 0–1 coverage depth bin, suggesting that a significant fraction 
of the genome has 0× coverage. The Poisson distribution models the 
coverage more accurately than the Normal distribution, while the Normal 
distribution appears slightly right-shifted and fits the data less well.

1.5: As the coverage increases, the number of genome positions with 
0× coverage decreases substantially. The histogram shows that almost 
all of the genome has some coverage, and once again the Poisson 
distribution provides a tighter fit to the data than the Normal 
distribution.

1.6: At high coverage, nearly the entire genome is covered, with 
virtually no positions remaining at 0× coverage. The Poisson 
distribution still models the data better than the Normal 
distribution, though the difference is smaller at this coverage level.

2.4: dot -Tpng debruijn_graph.dot -o ex2_digraph.png

2.5: One possible genome sequence consistent with the provided reads is:
CTTTATTCATTCATATTGAT

2.6: To accurately reconstruct the genome, you need sufficient read 
coverage so that every base is sequenced multiple times, and reads 
long enough to span repeats and ambiguous regions. High quality, 
error free, reads and proper handling of overlaps are also important 
to resolve branching paths in the de Brujn graph.