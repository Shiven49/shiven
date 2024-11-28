import pyfiglet
import sys
if len(sys.argv)==1:
    c=input("input: \n")
    print(pyfiglet.figlet_format(c))
elif len(sys.argv)==3:
    b=sys.argv[1]
    if b != "-f" and b != "--font":
        sys.exit("invalid input")
    else:
        a=sys.argv[2]
        c=input("input: \n")
        print(pyfiglet.figlet_format(c, font=a))
else:
    sys.exit("invalid input")