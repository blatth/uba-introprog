from queue import Queue as Cola
import random


def cantElemCola(c:Cola[int]) -> int:
    cantidad:int = 0
    colaAux = Cola()
    while not c.empty():
        elem = c.get()
        i += 1
        colaAux.put(elem)
    while not colaAux.empty():
        elem = colaAux.get()
        c.put(elem)

    return cantidad


c=Cola()
c.put(1)
c.put(2)
c.put(7)
c.put(5)
c.put(8)
c.put(4)
print(cantElemCola(c))