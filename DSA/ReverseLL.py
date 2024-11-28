class Solution:
    def reverseList(self, head: Optional[ListNode]) -> Optional[ListNode]:
        back=None
        current=head
        while current:
            forward=current.next
            current.next=back
            back=current
            current=forward
        return back

