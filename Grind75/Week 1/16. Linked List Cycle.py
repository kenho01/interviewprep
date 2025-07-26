# Definition for singly-linked list.
# class ListNode(object):
#     def __init__(self, x):
#         self.val = x
#         self.next = None

class Solution(object):
    def hasCycle(self, head):
        """
        :type head: ListNode
        :rtype: bool
        """
        slow = head
        if slow is not None:
            fast = head.next
        else:
            return False
        while fast and fast.next is not None:
            if slow == fast:
                return True
            slow = slow.next
            fast = fast.next.next
        return False