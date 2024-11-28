class PhoneBook:
    def __init__(self):
        self.map={}
    def add(self, key, value):
        self.map[key]=value
    def get(self,key):
        if key in self.map:
            return self.map.get(key)
        else:
            print("Not found")

def inputs():
    n = int(input())
    data = []
    for _ in range(n):
        entry=input("")
        key, value = entry.split()
        data.append((key, value))
    return data

p= PhoneBook()
entries= inputs()
for (key, value) in entries:
    p.add(key, value)
while True:
    try:
        query = input()
        if query in p.map:
            print(f"{query}={p.get(query)}")
        else:
            print("Not found")
    except EOFError:
        break
