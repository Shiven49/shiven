camelcase=input("camelCase= ")
for ccl in camelcase:
    if ccl.isupper():
        camelcase=camelcase.replace(ccl, "_"+ ccl.lower())
print(camelcase)