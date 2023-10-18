
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

def test_add(a,b,c,d)
    assert add(a,b,c,d)=a+b+c+d
    return

def addMatrixs(a,b):
    return a+b
#genearate add 2 matrixs
def test_addMatrixs(a,b):
    assert addMatrixs(a,b) == a+b
    return
#Separate Image to 10*10 Block. Such as for 800*1200 pixel of each frame we get 80*120 block = 9600 block/frame. If we have 100 frames we get totally 960000 block
#A= [Time, Block, Intensity] 
#So A is designed as 100*9600 2 dimensions Matrix.
#A1,1=[1, 1, 50]=  Matrix[a, b]=intensity, ……A100,1=[1, 1, 50]=  Matrix[a, b]=intensity

A1,2=[1, 2, 60], 	……		A100 ,2=[1, 2, 60]

...				……
...				……
A1,9600=[1, 9600, 255], …….		A100,9600=[1, 9600, 255]





