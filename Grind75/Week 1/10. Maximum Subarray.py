class Solution(object):
    def maxSubArray(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        maxSub = nums[0]
        curSub = 0
        for i in nums:
            if curSub < 0:
                curSub = 0
            curSub += i
            maxSub = max(curSub, maxSub)
        return maxSub

    