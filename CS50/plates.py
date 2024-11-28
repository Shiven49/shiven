def main():
    plate = input("Plate: ")
    if is_valid(plate):
        print("Valid")
    else:
        print("Invalid")

def is_valid(s):
    if len(s)<7 and len(s)>1 and s[0:2].isalpha() and s.isalnum():
        for c in s:
            if c.isdigit():
                n=s.index(c)
                if s[n:].isdigit() and int(c)!=0:
                    return True
                else:
                    return False

              
main()
