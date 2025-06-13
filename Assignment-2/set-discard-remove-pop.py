n = int(input("Enter the number of Elements: "))
s = set(map(int, input().split()))
num_commands = int(input())

for _ in range(num_commands):
    command = input().strip().split()
    
    if command[0] == "pop":
        if len(s) > 0:
            s.pop() 
    elif command[0] == "remove":
        x = int(command[1])
        if x in s:
            s.remove(x)  
    elif command[0] == "discard":
        x = int(command[1])
        s.discard(x)  

print(sum(s))
