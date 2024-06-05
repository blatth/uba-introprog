#Ej 2.1

def es_par(num:int) -> bool:

    return (num % 2 == 0)

#Implementación 1
def reemplazar_pos_pares_por_cero(lista: list[int]) -> None:
    indice:int = 0
    longitud = len(lista)
    while indice < longitud:
        if (es_par(indice)):
            lista[indice] = 0
        indice += 1

# Si la función no tiene especificado qué devolver, -> None

#Implementación 2: con fiir
def reemplazar_pos_pares_por_cero2(lista: list[int]) -> None: # esta función no va a devolver nada al ser llamada
    for i in range(0, len(lista), 2):
        lista[i] = 0

#Ej 2.2

def pares_por_cero_nueva_lista(lista: list[int]) -> [int]: # esta SÍ va a devolver algo al ser llamada
    nuevaL:[int] = []
    for i in lista:
        if (es_par(i)):
            nuevaL.append(0)
        else: nuevaL.append(i)

    return nuevaL

#Ej 2.3

def es_vocal(letra:str) -> bool:
 
    return (letra=='a') or (letra=='A') or (letra=='e') or (letra=='E') or (letra=='i') or (letra=='I') or (letra=='o') or (letra=='O') or (letra=='u') or (letra=='U')

def borrarVocales(palabra:str)->str:
    salida:str =""
    for i in range(0, len(palabra)):
        if (not(es_vocal(palabra[i]))):
            salida += palabra[i]

    return salida

#Ej 2.4

def reemplaza_vocales(s:str) -> str: # reemplaza las vocales por '_'. ej: print(reemplaza_vocales("Hola")) = "H_l_"
    salida:str = ""
    for i in range(len(s)):
        if (not(es_vocal(s[i]))):
            salida += s[i]
        else: salida += "_"

    return salida

#Ej 2.5

def da_vuelta_str(s:str) -> str: # ej: print(da_vuelta_str("Hola")) = "aloH". len("Hola") = 4
    salida:str = ""
    for i in range (len(s)):
        salida += s[len(s)-i-1] # cuando pongo -i-1 acoto el i para que sea < len(s) y además al mismo tiempo se lo resto a len(s) para obtener los términos en orden del último al primero
    
    return salida

#Ej 2.6

# Al final no lo use porque se puede usar el 'in'
def perteneceStr(s:str, e:str) -> bool: # chr no existe en py, cambiarlo por str
    perteneceStr:bool = False
    for i in range (len(s)):
        if e == s[i]:
            perteneceStr = True

    return perteneceStr

def eliminar_repetidos(s:str) -> str:
    salida:str = ""
    for i in range (len(s)):
        if s[i] not in salida:
            salida += s[i]

    return salida

print(eliminar_repetidos("Algooritttmmo"))


