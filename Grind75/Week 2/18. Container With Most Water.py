class Solution(object):
    def maxArea(self, height):
        """
        :type height: List[int]
        :rtype: int
        """
        i, j = 0, len(height) - 1
        maxArea = 0
        while i < j:
            curArea = min(height[i], height[j]) * (j - i)
            maxArea = max(maxArea, curArea)
            if height[i] < height[j]:
                i += 1
            elif height[i] > height[j]:
                j -= 1
            else:
                i += 1
                j -= 1
        return maxArea
            
        