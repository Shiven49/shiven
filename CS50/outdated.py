from calendar import month_abbr, month_name

while True:
    date = input("Date: ")
    if "," in date:
        month, day, year = date.replace(",", " ").split()
        try:
            day = int(day)
            year = int(year)
        except ValueError:
            continue
        if day > 31 or month not in month_abbr:
            continue
        else:
            month = month_name.index(month) + 1
            break
    elif "/" in date:
        month, day, year = date.replace("/", " ").split()
        try:
            month = int(month)
            day = int(day)
            year = int(year)
        except ValueError:
            continue
        if day > 31 or month > 12:
            continue
        break
    else:
        continue

print(f"{year:04}-{month:02}-{day:02}")