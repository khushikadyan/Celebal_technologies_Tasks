import textwrap

def wrap(string, max_width):
    wrapped_lines = textwrap.wrap(string, width=max_width)
    
    result = '\n'.join(wrapped_lines)
    
    return result

if __name__ == '__main__':
    string, max_width = input("Enter the string: "), int(input("Enter the width: "))
    result = wrap(string, max_width)
    print(result)
