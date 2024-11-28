class Solution:
    def oddEvenList(self, head: Optional[ListNode]) -> Optional[ListNode]:
            if not head or not head.next:
                return None
            odd=head
            evenhead=head.next
            even=evenhead
            while even and even.next:
                odd.next=even.next
                odd=odd.next
                even.next=odd.next
                even=even.next
            odd.next=evenhead    
            return head
