def print_formatted(number):
 
    binary_of_number = bin(number)
    width = len(binary_of_number) - 2

    print(f"Each number will be printed in a field width of: {width}\n") 
    for i in range(1, number + 1):
       
        decimal_str = str(i)
        octal_str = oct(i)[2:]           
        hex_str = hex(i)[2:].upper()     
        binary_str = bin(i)[2:]          

        
        print(decimal_str.rjust(width),
              octal_str.rjust(width),
              hex_str.rjust(width),
              binary_str.rjust(width))


if __name__ == '__main__':
    n = int(input("Enter the maximum number to print formats for: "))
    print_formatted(n)
