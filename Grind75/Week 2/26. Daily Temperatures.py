class Solution:
    def dailyTemperatures(self, temperatures: List[int]) -> List[int]:
        # res = []
        # for i in range(len(temperatures)):
        #     j = i + 1
        #     count = 0
        #     while j < len(temperatures):
        #         if temperatures[j] > temperatures[i]:
        #             count += 1
        #             res.append(count)
        #             break
        #         elif j == len(temperatures)-1:
        #             count = 0
        #             res.append(count)
        #             break
        #         else:
        #             count += 1
        #             j += 1
        # res.append(0)
        # return res

        res = [0] * len(temperatures)
        s = [] #[temp, index]
        for i, t in enumerate(temperatures):
            while s and t > s[-1][0]:
                stackT, stackInd = s.pop()
                res[stackInd] = i - stackInd
            s.append([t, i])
        return res
