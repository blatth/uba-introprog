#Ej 5.2

def pertenece2(e:int, s:list[int]) -> bool:
    i:int = 0
    pertenece2:bool = False
    while (i < len(s)):
        if (s[i] == e):
          pertenece2 = True
        i = i + 1

    return pertenece2

def pertenece3(s:list[int], e:int) -> bool:
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
    for i in range (len(matriz)-1): # acoto para que el i no se vaya de rango y se indefina
        if (len(matriz[i]) != len(matriz[i+1])): 
            return False
        
    return esMatriz
        
print(esMatriz([[1, 2, 3], [1, 2, 3]]))

#Ej 5.4

def ordenados(seq:[int]) -> bool: # se fija si los elementos de una lista están ordenados o no
    for i in range(len(seq)-1):
        if (not(seq[i]<seq[i+1])):
            return False
    return True

def filas_ordenadas(m:list[list[int]], res:[bool]) -> None:
    res = []
    for i in range (len(m)):
        if (not ordenados(m[i])):
            res.append(False)
        else:
            res.append(True)
    
    return res

print(filas_ordenadas([[1,2,3], [1, 2, 1]], []))