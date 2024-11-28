a=50
print(f"amount due: {a}")
while a>0:
    b=int(input("insert coin: "))
    if b==10 or b==5 or b==25:
        a=a-b
        print(f"amount due: {a}")
    else:
        print(f"amount due: {a}")