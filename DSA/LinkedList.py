class Listnode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next
        
class mylinkedlist:
    def __init__(self):
        self.head = None
    
    def get(self, index: int) -> int:
        current = self.head
        for i in range(index):
            if current is None:
                return -1
            current = current.next
        return current.val if current else -1
    
    def addathead(self, val: int) -> None:
        newnode = Listnode(val, self.head)
        self.head = newnode
    
    def addattail(self, val: int) -> None:
        newnode = Listnode(val)
        if not self.head:
            self.head = newnode
            return
        current = self.head
        while current.next:
            current = current.next
        current.next = newnode
    
    def addtoindex(self, index: int, val: int):
        if index == 0:
            self.addathead(val)
            return
        newnode = Listnode(val)
        current = self.head
        for i in range(index - 1):
            if current is None:
                return
            current = current.next
        if current is None:
            return
        newnode.next = current.next
        current.next = newnode
    
    def deleteatindex(self, index: int) -> None:
        if index == 0:
            if self.head:
                self.head = self.head.next
            return
        current = self.head
        for _ in range(index - 1):
            if current is None:
                return
            current = current.next
        if current is None or current.next is None:
            return
        current.next = current.next.next


sll=mylinkedlist()
sll.addathead(2)
sll.addattail(4)
sll.addtoindex(1,3)
sll.addattail(7)
sll.deleteatindex(0)
for i in range(4):
    print(sll.get(i))