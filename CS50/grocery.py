while True:
    stuff = list()
    try:
        while True:
            stuff.append(input().upper())
    except EOFError:
        break

unique_list = [ ]
for a in stuff:
    if a not in unique_list:
        unique_list.append(a)


unique_list = sorted(unique_list)
for i in unique_list:
    count = stuff.count(i)
    print(f"{count} {i}")