class Solution(object):
    def isAnagram(self, s, t):
        """
        :type s: str
        :type t: str
        :rtype: bool
        """
        count = [0 for i in range(26)]
        for i in s:
            count[ord(i) - 97] += 1
        for j in t:
            count[ord(j) - 97] -= 1
        for k in count:
            if k != 0:
                return False
        return True

        

            