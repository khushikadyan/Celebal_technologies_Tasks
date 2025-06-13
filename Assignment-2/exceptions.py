
T = int(input("Enter the no. of test cases: "))

for _ in range(T):
    try:
        a, b = input().split()
        result = int(a) // int(b)
        print(result)
    except (ZeroDivisionError, ValueError) as e:
        print("Error Code:", e)
