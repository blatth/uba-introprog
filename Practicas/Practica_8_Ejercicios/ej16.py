from queue import Queue as Cola
import random

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

# crear un objeto que es iterable, que se usa como una lista: lista_a = list(range(0, 100)) -> lista de 0 a 99
'''

def armar_secuencia_de_bingo() -> Cola[int]:
    numeros:list[int] = []
    cola:Cola[int] = Cola()
 
    while len(numeros) < 100:
        n = random.randint(0,99)
        if n not in numeros: 
            numeros.append(n) 
            cola.put(n)
 
    return cola
 
# print(armar_secuencia_de_bingo().queue)

#--

def copiar_cola (original:Cola)-> Cola:
    res: Cola = Cola()
    cola_tmp: Cola = Cola()
 
    while not (original.empty()):
        v = original.get()
        res.put(v)
        cola_tmp.put(v)
 
    while not (cola_tmp.empty()):
        v = cola_tmp.get()
        original.put(v)
 
    return res

def jugar_carton_de_bingo(carton: list[int], bolillero:Cola[int]) -> int:
    contador:int = 0
    copia:Cola[int] = copiar_cola(bolillero) # acá creo la copia porque es solo de tipo in, entonces no tengo que modificar la lista original
    jugadas:int = 0
    while (contador < 12):
        n:int = copia.get() # numero que saqué del bolillero
        jugadas += 1
        if n in carton:
            contador += 1
    return jugadas

# todo todo lo que sea in no puede modificarse su valor. al final de la función tiene que tener el mismo valor que al principio

bolillero = armar_secuencia_de_bingo()
carton = [4, 10, 25, 46, 60, 73, 84, 90, 33, 67, 78, 95]

print(jugar_carton_de_bingo(carton, bolillero))