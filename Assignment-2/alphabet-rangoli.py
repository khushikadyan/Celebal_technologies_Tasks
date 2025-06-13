def print_rangoli(size):
   
    import string  
    alphabet = string.ascii_lowercase 
    lines = [] 

    for i in range(size):      
        left = alphabet[size-1:i:-1]       
        middle = alphabet[i:size]      
        row = '-'.join(left + middle)      
        full_row = row.center(4*size - 3, '-')
        lines.append(full_row)

    for line in lines[::-1] + lines[1:]:
        print(line)

if __name__ == '__main__':
    n = int(input("Enter the Size: "))
    print_rangoli(n)