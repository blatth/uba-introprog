from queue import LifoQueue as Pila

def contarElemPila(p:Pila[int]) -> int:
    cantidad:int = 0
    pilaAux = Pila() # tengo que crear una Aux porque no tengo que modifiar el parámetro de entrada, ya que es solo in

    while (not p.empty()):
        elem = p.get()
        cantidad += 1
        pilaAux.put(elem)
    
    while (not pilaAux.empty()): #acá vuelvo a poner los elem de pilaAux en pila (que, a su vez, antes saqué de pila), porque fui sacando elementos y sino me queda en 0 al llamarla de vuelta
        elem = pilaAux.get()
        p.put(elem)
    
    return cantidad

"""
p=Pila()
p.put(1)
p.put(2)
p.put(7)
p.put(5)
p.put(8)
p.put(4)
print(contarElemPila(p))
"""