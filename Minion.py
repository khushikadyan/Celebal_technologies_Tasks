def minion_game(string):
    vowels = 'AEIOU'
    kevin_score = 0
    stuart= 0

   
    length = len(string)

    for i in range(length):
        # Total substrings starting at i = length - i
        if string[i] in vowels:
            kevin_score += length - i
        else:
            stuart += length - i

    if kevin_score > stuart:
        print("Kevin", kevin_score)
    elif stuart> kevin_score:
        print("Stuart", stuart)
    else:
        print("Draw")

if __name__ == '__main__':
    print("Enter string:")
    s = input()
    minion_game(s)