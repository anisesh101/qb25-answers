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

    format_fields = fields[8].split(':')
    if "DP" in format_fields:
        dp_index = format_fields.index("DP")
    else:
        dp_index = None

    for i in fields[9:]:
        i = i.split(':')
        if dp_index is not None and len(i) > dp_index:
            print(i[dp_index])