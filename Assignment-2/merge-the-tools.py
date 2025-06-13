def merge_the_tools(string, k):

    n = len(string)
    
    for i in range(0, n, k):
        part = string[i:i+k] 
        result = ""

        for char in part:
            if char not in result:
                result += char
                
        print(result) 



if __name__ == '__main__':
    string, k = input("Enter String : "), int(input("enter size: "))
    merge_the_tools(string, k)