class Solution(object):
    def majorityElement(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        vote = 0
        candidate = nums[0]
        for i in nums:
            if i != candidate and vote < 1:
                candidate = i
                vote = 1
            elif i != candidate:
                vote -= 1
            else: 
                vote += 1
        return candidate
