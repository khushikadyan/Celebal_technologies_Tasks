import math
import os
import random
import re
import sys


def solve(s):
    words = s.split(" ")          
    capitalizedWords = []

    for word in words:
        if len(word) > 0:
            word = word[0].upper() + word[1:]  
            capitalizedWords.append(word)
        else:
            capitalizedWords.append("")  

    result = " ".join(capitalizedWords) 
    print("After capitalizing : ")
    print(result)


if __name__ == '__main__':
    s = input("Enter the String : ")
    solve(s)
