# sample IDs (in order, corresponding to the VCF sample columns)
sample_ids = ["A01_62", "A01_39", "A01_63", "A01_35", "A01_31",
              "A01_27", "A01_24", "A01_23", "A01_11", "A01_09"]

# open the VCF file
for line in open("/Users/cmdb/qb25-answers/Week 3/biallelic.vcf"):
    if line.startswith("#"):
        continue
    
    # split the line into fields by tab, then
    fields = line.rstrip('\n').split('\t')

    chrom = fields[0]
    pos   = fields[1]
    
    for i in range(len(sample_ids)):
        sample_id = sample_ids[i]
        # get the sample's data from fields[9], fields[10], ...
        sample_Data = fields[9 + i]
        # genotypes are represented by the first value before ":" in that sample's data
        genotype = sample_Data.split(":")[0]
        #genotypes = " ".join(genotype)
        #print(genotypes)          
        for j in genotype:
            #print(j)
            if "0" in j:
                genotype_id = "0"
            elif "1" in j:
                genotype_id = "1"
            else:
                continue
        x = True
        if x:
            print(f"Sample_id\tChromosome\tPosition\tGenotype ID\n")
            x = False
        print(f"{sample_id}\t{chrom}\t{pos}\t{genotype_id}\n")