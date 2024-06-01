# range(start, stop, step)

def pertenece(e:int, s:[int]) -> bool:
    i:int = 0
    pertenece:bool = False
    while (i < len(s)):
        if (s[i] == e):
          pertenece = True
        i = i + 1

    return pertenece

# para ver si hay algún término que es vocal, número, o algo en particular, se usan variaciones de pertenece

def suma_tota2(s:list[int]) -> int:
    total: int = 0
    longitud:int = len(s)
    for ind in range (longitud):
        total = total + s[ind]
        
    return total