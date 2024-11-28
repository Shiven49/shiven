user_input = input("enter file type\n")
u2 = user_input.strip().lower()
if u2[-4:]==".gif":
    print("image/gif")
elif u2[-4:]==".jpg":
    print("image/jpeg")
elif u2[-4:]==".jpeg":
    print("image/jpeg")
elif u2[-4:]==".png":
    print("image/png")
elif u2[-4:]==".pdf":
    print("application/pdf")
elif u2[-4:]==".txt":
    print("text/plain")
elif u2[-4:]==".zip":
    print("application/zip")
else:
    print("can't indentify file type")


