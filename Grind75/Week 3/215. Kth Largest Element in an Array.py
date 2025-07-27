import heapq
class Solution:
    def findKthLargest(self, nums: List[int], k: int) -> int:
        """
            Heap Sort
            Heapify = O(N)
            Heappop = O(log N) * K
        """
        heap = []
        for i in nums:
            heapq.heappush(heap,-i)
        while k > 0:
            res = heapq.heappop(heap)
            k -= 1
        return -res

        """
            Quick Select Algorithm
            Avg time complexity = O(N)
            Worst Case = O(N^2) when pivot is always biggest
        """
        target = len(nums) - k
        def quickSelect(l, r):
            pivot, p = nums[r], l
            for i in range(l,r):
                if nums[i] <= pivot:
                    nums[i], nums[p] = nums[p], nums[i]
                    p += 1
            nums[p], nums[r] = pivot, nums[p]
            if p > target:
                return quickSelect(l, p - 1)
            elif p < target:
                return quickSelect(p + 1, r)
            else:
                return nums[p]
        return quickSelect(0, len(nums)-1)
        
