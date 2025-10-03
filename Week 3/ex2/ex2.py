for line in open("/Users/cmdb/qb25-answers/Week 3/biallelic.vcf"):
    if line.startswith('#'):
        continue
    fields = line.rstrip('\n').split('\t')
    #column 9 and farther are samples. 4th position of :'s is depth

    # grab what you need from `fields`
    fields2 = fields[7].split(';')
    #for i in fields2:
     #   if i.startswith("AF="):
      #      print(i[3:])

    for i in fields2:
        if i.startswith("DP="):
            print(i[3])