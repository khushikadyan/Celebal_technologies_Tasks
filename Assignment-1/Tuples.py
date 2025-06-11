# Step 1: Take the number of elements
n = int(input("Enter the number of elements: "))

# Step 2: Take n space-separated integers and convert them to a tuple
numbers = tuple(map(int, input("Enter integers to convert into tuple : ").split()))

# Step 3: Compute the hash of the tuple
result = hash(numbers)

# Step 4: Print the result
print(result)
