#Ej 1.1

def pertenece(s:list[int], e:int) -> bool:
    ind:int = 0
    hasta:int = len (s)
    res:bool = False
    while (ind < hasta and not(res)):
        tem:int=s[ind]
        if (val==e):
            res = True
        ind += 1

def pertenece2(s:list[int], e:int) -> bool:
    res:bool = False
    for v in s:
        if (v==e):
            return v

# esta última implementación no sé si se puede usar, 99% seguro que no. la anterior es muy similar

def pertenece3(s:list[int], e:int) -> bool:
    return e in s

#Ej 1.3

def suma_total(s:list[int]) -> int:
    indice:int = 0
    total:int = 0
    long:int = len(s)
    while (indice < long): # el índice NUNCA tiene que ser mayor a la len porque se indefine/da error la f
        valor_actual:int = s[indice] # suma primero el valor que está en i=0, y así sucesivamente. los pone en una lista
        total = total + valor_actual
        indice += 1 # poner indice += 1 es igual a indice = indice + 1. esto sería el "paso recursivo" 
    return total

res:int = suma_total ([5,8,3])
print(res)

def suma_tota2(s:list[int]) -> int:
    total: int = 0
    longitud:int = len(s)
    for ind in range (longitud): # el "desde" no es necesario, asume que empieza en 0. el paso tampoco, asume que es 1 siempre
        total = total + s[ind]
    return total

x:int = suma_total2 ([5,6,7])
print(x)

#Ej 1.7

# Auxiliares

def tiene_min(s:str) -> bool:
    res:bool = False
    for v in s:
        if (v >= 'a' and v <= 'z'): #en py, con poner < 'a' ó > 'a', ya se asume que toma el valor ascii del char
            res = True

def tiene_may(s:str) -> bool:
    res:bool = False
    for v in s:
        if (v >= 'A' and v <= 'Z'):
            res = True           

def tiene_num(s:str) -> bool:
    res:bool = False
    for v in s:
        if (v >= '0' and v <= '9'):
            res = True

# Principal

def fortaleza(s:str) -> str:
    usa_may:bool = tiene_may(s)
    usa_min:bool = tiene_min(s)
    usa_num:bool = tiene_num(s)
    es_mayor_a_8 = len(s) > 8
    resultado:str
    if (usa_may and usa_min and usa_num and es_mayor_a_8): # si se cumplen todas -> verde
        resultado = "Verde"
    elif(es_mayor_a_8 < 5): 
        resultado = "Rojo"
    else: # otherwise de haskell, ponele
        resultado = "Amarillo"

#Ej 1.8

def saldoActual(operaciones:[(str,float)])->float:
    saldo:float=0
    long:int=len(operaciones)
    for i in range (0,long):
        if(operaciones[i][0]=='I'):
            saldo+=operaciones[i][1]
        elif(operaciones[i][0]=='R'):
            saldo-=operaciones[i][1]
    return saldo



