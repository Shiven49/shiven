import inflect
p=inflect.engine()
while True:
    print("enter the names: ")
    names = list()
    try:
        while True:
            names.append(input().title())
            n=len(names)
    except EOFError:
        break
j=p.join(names)
print("Adieu, adieu, to",j)