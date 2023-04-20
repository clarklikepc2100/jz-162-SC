
def random():
    import random
    a = random.randint(1,100)
    b = random.randint(1,100)
    return a,b

def add(a,b):
    return a+b
#genearate add 2 numbers
def test_add(a,b):
    assert add(a,b) == a+b
    return

def addMatrixs(a,b):
    return a+b
#genearate add 2 matrixs
def test_addMatrixs(a,b):
    assert addMatrixs(a,b) == a+b
    return
