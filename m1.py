print 'module 1 imported'

def subdirs(root):
    import os
    try:
        res=next(os.walk(root))
        return res[1]
    except StopIteration :
        pass

    return []

def getFilesInDir(root):
    import os
    return next(os.walk(root))[2]

