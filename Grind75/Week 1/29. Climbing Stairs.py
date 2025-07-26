class Solution(object):
    def climbStairs(self, n):
        """
        :type n: int
        :rtype: int
        """
        m = [0,1,2]
        if n == 1:
            return m[1]
        if n == 2:
            return m[2]
        for i in range(3,n+1):
            m.append(m[i-1] + m[i-2])
        return m[n]
            