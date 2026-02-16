class Solution:
    def isAnagram(self, s: str, t: str) -> bool:
        seen_s = [0 for i in range(26)]
        seen_t = [0 for i in range(26)]
        for i in s:
            seen_s[ord(i)-97] += 1
        for j in t:
            seen_t[ord(j)-97] += 1
        if seen_s == seen_t:
            return True
        return False