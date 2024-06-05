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

# def pertenece():


# auxiliar parar probar el código
def imprimir(lista_o_cola):
    while (not (lista_o_cola.empty())):
        print(lista_o_cola.get())

# imprimir(genNAA(5,0,10)) --> Ejemplo de uso

# Ej 16

'''
# Otra implementación (más óptima)

def armar_secuencia_de_bingo(cant:int, d:int, h:int) -> Cola[int]:
    res:Cola[int] = Cola()
    lista_nums = list(range(0, 100))
    h: int = 99
    while (len(lista_nums)>0):
        x:int = random.randint(d, h)
        res.put(lista_nums[i])
        lista_nums.remove(lista_nums[i])
        h -= 1
    return res

# crear un objeto que es iterable, que se usa como una lista: lista_a = list(range(0, 100)) -> lista de 0 a 100
'''

def armar_secuencia_de_bingo(cant:int, d:int, h:int) -> Cola[int]:
    res = Cola
    lista = []
    while (len(lista) < 100):
        x: int = random.randint(d, h)
        if not(pertenece(lista, x)):
            res.put(x)
            lista.append(x)
    return res

def jugar_carton_de_bingo(carton: list[int], bolillero:Cola[int]) -> int:
    contador:int = 0
    copia:Cola[int] = copiar_cola(bolillero) # acá creo la copia porque es solo de tipo in, entonces no tengo que modificar la lista original
    jugadas:int = 0
    while (contador < 12):
        n:int = copia.get() # numero que saqué del bolillero
        jugadas += 1
        if pertenece(carton, n):
            contador += 1
    return jugadas

# tod todo lo que sea in no puede modificarse su valor. al final de la función tiene que tener el mismo valor que al principio