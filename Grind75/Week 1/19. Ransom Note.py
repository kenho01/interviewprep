class Solution(object):
    def canConstruct(self, ransomNote, magazine):
        """
        :type ransomNote: str
        :type magazine: str
        :rtype: bool
        """
        count = [0 for i in range(26)]
        for i in magazine:
            count[ord(i)-97] += 1
        for j in ransomNote:
            count[ord(j)-97] -= 1
        for k in count:
            if k < 0:
                return False
        return True
        