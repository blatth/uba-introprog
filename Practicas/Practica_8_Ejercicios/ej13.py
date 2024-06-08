from queue import Queue as Cola
import random

cola = Cola()

# Ej 13

def genNAA(cant:int, d:int, h:int) -> Cola[int]:
    res:Cola[int] = Cola()
    for _ in range (cant):
        x:int = random.randint(d, h)
        print(x) # acá imprime el valor y luego lo agrega a la cola
        res.put(x)

    return res

# auxiliar parar probar el código
def imprimir(lista_o_cola):
    while (not (lista_o_cola.empty())):
        print(lista_o_cola.get())

# imprimir(genNAA(5,0,10)) --> Ejemplo de uso


