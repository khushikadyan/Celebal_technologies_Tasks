from itertools import combinations

n = int(input("Enter the number of letters in the list:"))
letters = input("Enter the letters separated by space:").split()
k = int(input("Enter how many indices you want to select:"))

all_combinations = list(combinations(range(n), k))

favorable = 0

for combo in all_combinations:
 
    if 'a' in [letters[i] for i in combo]:
        favorable += 1

total = len(all_combinations)
probability = favorable / total
print("\n")
print(f"Probability of at least one 'a': {probability:.4f}")
