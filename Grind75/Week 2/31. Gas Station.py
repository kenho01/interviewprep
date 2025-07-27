class Solution:
    def canCompleteCircuit(self, gas: List[int], cost: List[int]) -> int:
        '''
        Greedy approach
        If sum(gas) >= sum(cost), we can be sure that there is a solution
        Therefore, if total > 0 at the end of the array, we can be certain that that the ith index
        is the solution since the solution is guranteed to be unique
        '''
        if sum(gas) < sum(cost):
            return -1
        total = 0
        res = 0
        for i in range(len(gas)):
            total += gas[i] - cost[i]
            if total < 0:
                total = 0
                res = i + 1
        return res