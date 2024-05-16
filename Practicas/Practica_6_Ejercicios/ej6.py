#2

def ej6():
    i: int = 10
    while i <= 40:
        if i%2 == 0:
            print(i)
        i = i + 2

# fnmir

def ej62():
    i: int = 10
    for i in range (10, 42, 2):
        print(i)
        i = i + 2

#4

def cohete(n:int):
    i: int = n
    while i >= 1:
        print(i)
        i = i - 1
    print("Despegue!")

# fnmir

def cohete2(n:int):
    i: int = n
    for i in range (n, 0, -1):
        print(i)
    print("Despegue!")