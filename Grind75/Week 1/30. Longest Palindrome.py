class Solution(object):
    def longestPalindrome(self, s):
        """
        :type s: str
        :rtype: int
        """
        d = defaultdict(int)
        res = 0
        for i in s:
            d[i] += 1
            if d[i] % 2 == 0:
                res += 2
        for j in d.values():
            if j % 2 == 1:
                res += 1
                break
        return res
                