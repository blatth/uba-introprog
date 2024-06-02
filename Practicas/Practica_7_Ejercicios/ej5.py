#Ej 5.2

def pertenece2(e:int, s:list[int]) -> bool:
    i:int = 0
    pertenece2:bool = False
    while (i < len(s)):
        if (s[i] == e):
          pertenece2 = True
        i = i + 1

    return pertenece2

def pertenece3(s:list[int], e:int) -> bool: # recordatorio: esta no está permitida en el parcial
    return e in s

def pertenece_a_cada_uno_2 (s:list[list[int]], e:int, res: list[bool]) -> None:
    res.clear()
    for i in range (len(s)):
        res.append (pertenece3 (s[i], e))

#pertenece_a_cada_uno_2([[1,2,1],[2,3,4], [3,4]], 3, res) # PREGUNTAR: me tira que "res" no está definido. no entiendo por qué

#print(pertenece_a_cada_uno_2)

# Ej 5.3

def esMatriz(matriz: list[list[int]]) -> bool:
    esMatriz:bool = True
    for i in range (len(matriz)):
        if (len(matriz[i]) != len(matriz[i+1])): # PREGUNTAR: entiendo por qué esto no funciona, pero no sé cómo hacer el ejercicio de otra forma
            return False
        
#print(esMatriz([[1, 2, 3], [1, 2, 3]]))