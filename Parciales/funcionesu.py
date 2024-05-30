# range(start, stop, step)

def pertenece(s:list[int], e:int) -> bool:
    res:bool = False
    for v in s:
        if (v==e):
            return v

# para ver si hay algún término que es vocal, número, o algo en particular, se usan variaciones de pertenece

def suma_tota2(s:list[int]) -> int:
    total: int = 0
    longitud:int = len(s)
    for ind in range (longitud):
        total = total + s[ind]
    return total