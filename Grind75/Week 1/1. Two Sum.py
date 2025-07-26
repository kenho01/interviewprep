class Solution(object):
    def twoSum(self, nums, target):
        """
        :type nums: List[int]
        :type target: int
        :rtype: List[int]
        """
        dct = dict()
        for i in range(len(nums)):
            if target - nums[i] in dct.keys():
                return [i, dct[target-nums[i]]]
            else:
                dct[nums[i]] = i 


        