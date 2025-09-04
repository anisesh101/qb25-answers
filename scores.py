#!/usr/bin/env python3

#2

fs = open("ce11_genes.bed")

new_score = []

x = []
counter = 0
for i in fs:
    header = i.strip().split("\n")

    for i in header:
        j = i.split("\t")
        x.append(j)
    
    #print(x)

    calc = (int(x[counter][2]) - int(x[counter][1]))*int(x[counter][4])
    if x[counter][5] is "-":
        calc *= -1
    print(calc)
    new_score.append(calc)

    counter += 1

print(new_score)




    
