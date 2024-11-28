x , y , z = input("enter the calculation\n").split(" ")
if y=="+":
    print(float(x)+float(z))
elif y=="-":
    print(float(x)+float(z))
elif y=="*":
    print(float(x)*float(z))       
elif y=="/":
    print(float(x)/float(z))      
else:
    print("please enter a valid expression")