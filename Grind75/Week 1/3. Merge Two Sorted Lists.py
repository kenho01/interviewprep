# Definition for singly-linked list.
# class ListNode(object):
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution(object):
    def mergeTwoLists(self, list1, list2):
        """
        :type list1: Optional[ListNode]
        :type list2: Optional[ListNode]
        :rtype: Optional[ListNode]
        """
        dummy1 = ListNode()
        dummy2 = dummy1
        while list1 and list2:
            if list1.val <= list2.val:
                dummy1.next = list1
                list1 = list1.next
            else:
                dummy1.next = list2
                list2 = list2.next
            dummy1 = dummy1.next
        if list1:
            dummy1.next = list1
        if list2:
            dummy1.next = list2
        return dummy2.next