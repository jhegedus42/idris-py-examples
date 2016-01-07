print 'module 1 imported'

def subdirs(root):
    import os
    return next(os.walk(root))[1]

def getFilesInDir(root):
    import os
    return next(os.walk(root))[2]

