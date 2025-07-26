class Solution(object):
    def maxProfit(self, prices):
        """
        :type prices: List[int]
        :rtype: int
        """
        i = 0
        j = i + 1
        max_profit = 0
        while j < len(prices):
            if prices[j] - prices[i] > 0:
                current_profit = prices[j] - prices[i]
                max_profit = max(current_profit, max_profit)
                j += 1
            else:
                i = j
                j += 1
        return max_profit

        