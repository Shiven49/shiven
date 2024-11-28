string=input("input: ")
for a in string:
    if a=="a" or a=="e" or a=="i" or a=="o" or a=="u":
        string=string.replace(a, "")
print(string)