'''
from queue import LifoQueue as Pila

def buscarMax(p:Pila[int]) -> int:
    maximo:int = p.get() # saco el primer elemento
    while not p.empty():
        elementoSig = p.get() # saco el segundo elemento
        if elementoSig > maximo:
            maximo = elementoSig # redefino el máximo si el elemento que le seguía es mayor
    
    return maximo
'''

from queue import Queue as Cola

def buscarMaxC(c:Cola[int]) -> int:
    maximo: int = c.get()
    while not c.empty():
        elementoSig = c.get()
        if elementoSig > maximo:
            maximo = elementoSig
    
    return maximo


c=Cola()
c.put(1)
c.put(2)
c.put(7)
c.put(5)
c.put(8)
c.put(4)
print(buscarMaxC(c))
