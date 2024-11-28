""" Node is defined as
class node:
    def __init__(self, data):
        self.data = data
        self.left = None
        self.right = None
"""

def checkBST(root,minval=float('-inf'),maxval=float('inf')):
    if root is None:
        return True
    if not(minval<root.data<maxval):
        return False
    return checkBST(root.left,minval,root.data) and checkBST(root.right,root.data,maxval)