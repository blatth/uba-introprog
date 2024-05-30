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

def pertenece2(e:int, s:[int]) -> bool:
    i:int = 0
    pertenece2:bool = False
    while (i < len(s)):
        if (s[i] == e):
          pertenece2 = True
        i = i + 1

    return pertenece2


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

#Ej 1.4

def ordenados(seq:[int]) -> bool: # se fija si los elementos de una lista están ordenados o no
    for i in range(len(seq)-1):
        if (not(seq[i]<seq[i+1])):
            return False
    return True

#Ej 1.5

def contPLarga(s:[str]) -> bool:
    for i in range (len(s)):
        if ((len(s[i]) > 7)):
            return True
    return False

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


#Ej 1.9

'''
#PREGUNTAR: por qué al hacer print(vocDif("holaiu")) = False

def pertenecep(s:str, e:chr) -> bool:
    i:int = 0
    pertenecep:bool = False
    while (i < len(s)):
        if (s[i] == e):
          pertenecep = True
        i = i + 1

    return pertenecep


def vocDif(palabra:str) -> bool:
    vocCounter: int = 0
    if (pertenecep('a', palabra)) or (pertenecep('A', palabra)):
        vocCounter += 1
    if (pertenecep('e', palabra)) or (pertenecep('E', palabra)):
        vocCounter += 1
    if (pertenecep('i', palabra)) or (pertenecep('I', palabra)):
        vocCounter += 1
    if (pertenecep('o', palabra)) or (pertenecep('O', palabra)):
        vocCounter += 1
    if (pertenecep('u', palabra)) or (pertenecep('U', palabra)):
        vocCounter += 1
    return vocCounter >= 3
'''

def contVoc(palabra:str) -> int:
    vocCounter: int = 0
    if palabra.count('a') >= 1 or palabra.count('A') >= 1:
        vocCounter += 1
    if palabra.count('e') >= 1 or palabra.count('E') >= 1:
        vocCounter += 1
    if palabra.count('i') >= 1 or palabra.count('I') >= 1:
        vocCounter += 1
    if palabra.count('o') >= 1 or palabra.count('O') >= 1:
        vocCounter += 1
    if palabra.count('u') >= 1 or palabra.count('U') >= 1:
        vocCounter += 1

    return vocCounter

def vocDif(palabra:str) -> bool:
    return contVoc(palabra) >= 3

# ^ si le tiro print(vocDif("holaiu")) = True, así que funciona. con mayus también funciona

