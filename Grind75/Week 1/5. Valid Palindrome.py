class Solution(object):
    def isPalindrome(self, s):
        """
        :type s: str
        :rtype: bool
        """
        ls = []
        for i in s:
            if i.isalnum():
                ls.append(i.lower())
        i = 0
        j = len(ls) - 1
        while i <= j:
            if ls[i] != ls[j]:
                return False
            i += 1
            j -= 1
        return True