import sys

fs = open(sys.argv[1])

# The chr is the key and the counter var is the value"

my_dict = {}
nm_dict = {}

for i in fs:
    if i.startswith("@"):
        continue
    
    fields = i.strip().split("\t")
    if len(fields) < 3:
        continue
    
    RNAME = fields[2]
    if RNAME == "*":
       RNAME = "unmapped"
    if RNAME not in my_dict:
       my_dict[RNAME] = 0
    my_dict[RNAME] += 1

    for field in fields[11:]:
        if field.startswith("NM:i:"):
            nm_value = int(field[5:])
            if nm_value not in nm_dict:
                nm_dict[nm_value] = 0
            nm_dict[nm_value] += 1
            break

print(my_dict)

print(nm_dict)

fs.close()




