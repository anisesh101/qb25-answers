# List of reads
reads = ['ATTCA', 'ATTGA', 'CATTG', 'CTTAT', 'GATTG', 'TATTT', 'TCATT', 'TCTTA', 'TGATT', 'TTATT', 'TTCAT', 'TTCTT', 'TTGAT']

k = 3
graph = set()

for read in reads:
    for i in range(len(read) - k):
        kmer1 = read[i:i+k]
        kmer2 = read[i+1:i+1+k]
        graph.add(f"{ kmer1 } -> { kmer2 }")

for edge in sorted(graph):
    print(edge)

#Save edges to file (ChatGPT help)
with open("/Users/cmdb/qb25-answers/Week 11/debruijn_graph.dot", "w") as f:
    f.write("digraph G {\n")
    for edge in sorted(graph):
        kmer1, kmer2 = edge.split(" -> ")
        f.write(f'    "{kmer1}" -> "{kmer2}";\n')
    f.write("}\n")
