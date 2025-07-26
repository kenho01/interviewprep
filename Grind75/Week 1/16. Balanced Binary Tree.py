# Definition for a binary tree node.
# class TreeNode(object):
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution(object):
    def isBalanced(self, root):
        """
        :type root: Optional[TreeNode]
        :rtype: bool
        """
        def dfs(root):
            if root is None:
                return 0
            maxLeft = dfs(root.left)
            maxRight = dfs(root.right)
            return 1 + max(maxLeft, maxRight)
        if root is None:
            return True
        if abs(dfs(root.left) - dfs(root.right)) > 1:
            return False
        return self.isBalanced(root.left) and self.isBalanced(root.right)