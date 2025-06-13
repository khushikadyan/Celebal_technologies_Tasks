from collections import Counter

num_shoes = int(input("Enter number of shoes in the shop: "))
shoe_sizes = list(map(int, input("Enter shoe sizes: ").split()))
inventory = Counter(shoe_sizes)
num_customers = int(input("Enter number of customers: "))
earnings = 0

for _ in range(num_customers):
    size, price = map(int, input("Enter size and price: ").split())
       
    if inventory[size] > 0:
        earnings += price
        inventory[size] -= 1

print("Total earnings:", earnings)
