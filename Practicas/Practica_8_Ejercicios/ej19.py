# Pastebins del profe:
# https://pastebin.com/xabaQTyv
# https://pastebin.com/95JyVctp -> dia_de_menor_minima es un tipo de ej de parcial

# Ej 19

def perteneceDic(d:dict, k) -> bool: # dict: tipo diccionario
    mi_lista = (d.keys())
    return pertenece(mi_lista, k)

def agrupar_por_longitud(nombre_archivo: str) -> dict:
    resultado: dict[str, int] = {}
 
    palabras: list[str] = palabras_de_archivo(nombre_archivo)
    for palabra in palabras:
        longitud = len(palabra)
        if perteneceDic(res, longitud):
            resultado[longitud] += 1
        else:
            resultado[longitud] = 1             
 
    return resultado
 
# x = agrupar_por_longitud("p8 ejemplos.txt")
# for clave, valor in x.items():
#    print(clave, valor)