#Ej 2.1

def es_par(num)
    return (num % 2 == 0)

#Ej 2.2

#Implementación 1
def reemplazar_pos_pares_por_cero(lista: list[int]) -> None:
    indice: int = 0
    longitud = len(lista)
    while indice < longitud:
        if (es_par(indice)):
            lista[indice] = 0
        indice += 1

# Si la función no tiene especificado qué devolver, -> None

#Implementación 2: con fiir
def reemplazar_pos_pares_por_cero2(lista: list[int]) -> None:
    for i in range(0, len(lista), 2):
        lista[i] = 0

#Ej 2.3

def es_vocal(letra:str)->bool:
    return (letra=='a') or (letra=='A') or (letra=='e') or (letra=='E') or (letra=='i') or (letra=='I') or (letra=='o') or (letra=='O') or (letra=='u') or (letra=='U')

def borrarVocales(palabra:str)->str:
    salida:str=""
    for i in range(0,len(palabra)):
        if (not(es_vocal(palabra[i]))):
            salida+=palabra[i]
    return salida