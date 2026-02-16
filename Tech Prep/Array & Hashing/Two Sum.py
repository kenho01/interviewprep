class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        d = {}
        res = []
        for i in range(len(nums)):
            if target - nums[i] in d.keys():
                res.append(d[target-nums[i]])
                res.append(i)
                return res
            else:
                d[nums[i]] = i
