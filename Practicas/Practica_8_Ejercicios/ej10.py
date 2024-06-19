from queue import LifoQueue as Pila

def buscarMax(p:Pila[int]) -> int:
    maximo:int = p.get() # saco el primer elemento
    while not p.empty():
        elementoSig = p.get() # saco el segundo elemento
        if elementoSig > maximo:
            maximo = elementoSig # redefino el máximo si el elemento que le seguía es mayor
    
    return maximo

"""
p=Pila()
p.put(1)
p.put(2)
p.put(7)
p.put(5)
p.put(8)
p.put(4)
print(buscarMax(p))
"""