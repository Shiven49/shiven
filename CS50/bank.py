greeting=input("enter your greeting\n")
g2=greeting.strip().title()
if g2[0:5]=="Hello":
    print("$0")
elif g2[0]=="H":
    print("$20")
else:
    print("$100")    