class Solution(object):
    def isValid(self, s):
        """
        :type s: str
        :rtype: bool
        """
        ref = {
            ")": "(",
            "]": "[",
            "}": "{"
        }
        st = []
        for i in s:
            if i in ref.keys() and len(st) == 0:
                return False
            elif i in ref.keys():
                if ref[i] != st[-1]:
                    return False
                st.pop()
            else:
                st.append(i)
        if len(st) == 0:
            return True
        return False


