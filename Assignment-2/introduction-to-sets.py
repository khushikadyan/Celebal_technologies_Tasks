def average(array):  
    unique_values = set()  
    for height in array:
        unique_values.add(height)

    total = 0
    for value in unique_values:
        total = total + value 
    count = 0
    for _ in unique_values:
        count = count + 1

    average_value = total / count
    average_value = round(average_value, 3)

    return average_value

if __name__ == '__main__':
    
    n = int(input("Enter number of heights: "))
    arr = input("Enter the heights separated by space: ").split()
    for i in range(n):
        arr[i] = int(arr[i])
    result = average(arr)
    print("Average of distinct heights:", result)
