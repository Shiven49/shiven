import random 

def inputs():
    player=int(input("enter your number from 1 to 5 "))
    comp=random.randint(1,5)
    inputtt={"p_inp":player,"comp_inp":comp}
    return inputtt

def check(a,b):
    if(a<b):
        return "your number fell short"
    elif(a>b):
        return "your number was higher"
    elif(a==b):
        return "your number was correct"

ip=inputs()
result=check(ip["p_inp"],ip["comp_inp"])
print(result)
print(ip["p_inp"])
print(ip["comp_inp"])
