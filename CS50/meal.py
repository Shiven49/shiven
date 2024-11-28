def convert(a,b):
    int(b)<60 and int(a)<24
    c=int(b)/60
    return int(a)+float("%.2f"%c)
    
def main():
    hours,minutes=input("what time is it ").split(":")
    time=float(convert(hours,minutes))
    if time<=8 and time>=7:
        print("its breakfast time")
    elif time<=13 and time>=12:
        print("its lunch time")
    elif time<=19 and time>=18:
        print("its dinner time")
    elif time>24:
        print("enter a valid time")
    else:
        print("you dont need to eat right now")

main()    