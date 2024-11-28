def main():
    e=get_frac()   
    
def get_frac():
    while True:
        try:
            a,b=input("fraction: \n").split("/")
            aa= int(a)
            bb= int(b)
            c=aa/bb
            d=float(c)
            e=d*100
            if e==100:
                print("F")
            elif e==0:
                print("E")
            elif e>0 and e<100:  
                f=round(e,2)
                print(f"{f}%")
            elif aa>bb:
                continue
            return e
        except ValueError:
            pass
        except ZeroDivisionError:
            pass
        else:
            break

main()
