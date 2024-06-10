# Pastebins del profe:
# https://pastebin.com/xabaQTyv
# https://pastebin.com/95JyVctp -> dia_de_menor_minima es un tipo de ej de parcial

#creo un dicc con algunos pares de clave-valor
mi_dicc: dict[str, str] = {
    'auto': 'car',
    'sol': 'sun',
    'luna': 'moon'
}
 
#agrego clave-valor
mi_dicc['una_clave'] = 'un_valor'
 
#reemplazo el valor de una clave
mi_dicc['una_clave'] = "nuevo valor"
 
#recupero un valor
v:str = mi_dicc['una_clave']
 
 
#recorro un dicc, lo imprimo y lo copio a otro diccionario
nuevo_dic: dict[str, str] = {} #creo un dicc vacio
 
# recupero las claves y luego, con cada clave, recupero su valor y lo imprimo
claves:list[str] = mi_dicc.keys() 
for clave in claves:    
    valor:str = mi_dicc[clave]
    print(clave + ' - ' + valor)  
    #modo python es: print(f'{clave} - {valor}') 
    nuevo_dic[clave] = valor #lo agrego al nuevo diccionario
 
 
 
#otra forma de recorrer un dicc
otro_dic: dict[str, str] = {} #creo un dicc vacio
for clave, valor in mi_dicc.items():    
    print(clave + ' - ' + valor)   
    #modo python es: print(f'{clave} - {valor}') 
    otro_dic[clave] = valor #lo agrego al nuevo diccionario
 
# recupero solo los valores y los imprimo
valores:list[str] = otro_dic.values() 
for v in valores:    
    print(v)  
 

## Ejemplo de ejercicio (dia_de_menor_minima)

 
#creo un dicc donde la clave representa un día y el valor es una tupla con la temp mín y max
temp_por_dia: dict[int, (float, float)] = {
    1: (10.5, 20),
    2: (10.3, 20.6),
    3: (1.5, 20)
}
 
def dia_de_menor_minima (temps :dict[int, (float, float)] ) -> int:
    #asumo que hay por lo menos un día con su temp.
    res: int = list(temps.keys()) [0]  
    temp_min = temps [res] [0] 
    for c, v in temps.items():    
        min_dia:float = v[0]  
        if temp_min > min_dia:
            temp_min = min_dia
            res = c
 
    return res
 
dia = dia_de_menor_minima (temp_por_dia)
print(dia)

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

print(temps.items())