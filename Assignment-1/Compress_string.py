from itertools import groupby
print("Enter the string")
s = input().strip()
print("Result:")
for key, group in groupby(s):
    count = len(list(group))      
    number = int(key)             
    print((count, number), end=' ')
