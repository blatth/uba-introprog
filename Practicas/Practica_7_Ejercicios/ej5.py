#Ej 5.2

def pertenece2(s:list[int], e:int) -> bool:
    res:bool = False
    for v in s:
        if (v==e):
            return v

def pertenece3(s:list[int], e:int) -> bool:
    return e in s

def pertenece_a_cada_uno_2(s:list[list[int]], e:int, res:list[bool]):
    res.clear()
    for s in range:
        res.append (pertenece3 (lista, e))