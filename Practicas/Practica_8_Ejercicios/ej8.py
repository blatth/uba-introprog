from queue import LifoQueue as Pila
import random

def generarNrosAlAzar(cantidad:int, desde:int, hasta:int) -> Pila[int]:
    p = Pila()
    for i in range(cantidad):
        n:int = random.randint(desde,hasta)
        p.put(n)

    return p

def contarElemPila(p:Pila[int]) -> int:
    cantidad:int = 0
    pilaAux = Pila()

    while (not p.empty()):
        elem = p.get()
        cantidad += 1
        pilaAux.put(elem)
    
    while (not pilaAux.empty()): #acá vuelvo a poner los elem de pilaAux en pila (que, a su vez, antes saqué de pila), porque fui sacando elementos y sino me queda en 0 al llamarla de vuelta
        elem = pilaAux.get()
        p.put(elem)
    
    return cantidad

mi_pila = Pila()
mi_pila.put(2)
mi_pila.put(3)
mi_pila.put(7)
mi_pila.put(11)

p = generarNrosAlAzar(5, 1, 3)
print(p.queue)

# Tanto para cola como para pila, usar las funciones de la diapo 9 de la teórica