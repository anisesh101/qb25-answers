fs = open("GTEx_Analysis_2017-06-05_v8_RNASeQCv1.1.9_gene_tpm.gct")

#Skip first two lines
_ = fs.readline()
_ = fs.readline()

header = fs.readline().split("\t")
data = fs.readline().split("\t")

dict = {}
#if len(header) == len(data):
    #print("YAY")

counter = 0

for i in data:
    dict[header[counter]] = data[counter]
    counter += 1

#print(dict)

fs.close()

fs2 = open("GTEx_Analysis_v8_Annotations_SampleAttributesDS.txt")

j = []

for i in fs2:
    header = i.strip().split("\n")

    for i in header:
        j += i.split("\t")
#print(j)
for i in j:
    #print(i)
    if i in dict:
        print(i)
        print(dict[i])
        print(j)
