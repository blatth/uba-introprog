from queue import LifoQueue as Pila
import random

def generarNrosAlAzar(cantidad:int, desde:int, hasta:int) -> Pila[int]:
    p = Pila()
    for i in range(cantidad):
        n:int = random.randint(desde,hasta) # random.randint genera una lista de ints random en un rango
        p.put(n) # put va a apilando, empieza de abajo para arriba

    return p


mi_pila = Pila()
mi_pila.put(2)
mi_pila.put(3)
mi_pila.put(7)
mi_pila.put(11)

p = generarNrosAlAzar(5, 1, 3)
print(p.queue)

# Tanto para cola como para pila, usar las funciones de la diapo 9 de la teórica