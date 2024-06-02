'''
# Ej 1.1
def contarLineas (nombre_del_archivo: str) -> int:
    archivo = open (nombre_del_archivo,"r")
    contenido:[str] = archivo.readline()
    contar:int = 0
    while (contenido != ''):
        contar += 1
        contenido = archivo.readlines()
    archivo.close()
    return contar

print(contarLineas("texto.txt"))
'''

# Otra implementación del mismo ej

def contarLineas (nombre_del_archivo: str) -> int:
    archivo = open(nombre_del_archivo,"r")
    contenido:[str] = archivo.readlines() # readlines devuelve las líneas del archivo en forma de lista de strings. ej: [linea-1, linea-2, linea-3, ..., linea-n]
    cantidad_lineas = len(contenido)
    archivo.close()

    return cantidad_lineas

print(contarLineas("/run/media/frnc/BLATTH/Facultad/IP-Algo1/introprog/Practicas/Practica_8_Ejercicios/texto.txt"))


# Ej 1.2

def existe_palabra(palabra:str,nombre_archivo:str)->bool:
    result:bool = False
    archivo = open(nombre_archivo,"r")
    for linea in archivo.readlines():
        if palabra in linea:
            result=True
    archivo.close()

    return result


#print(existe_palabra("Computacion","/run/media/frnc/BLATTH/Facultad/IP-Algo1/introprog/Practicas/Practica_8_Ejercicios/texto.txt"))



# Ej 1.3. Esto está mal, tengo que corregirlo
def cantidad_de_apariciones (nombre_del_archivo:str,palabra:str) -> int:
    archivo = open(nombre_del_archivo,"r")
    contenido = archivo.readlines()
    apariciones:int = 0
    i:int = 0
    for linea in contenido:
        if palabra in linea[i]:
                apariciones += 1
                i += 1
        else:
            i += i
    archivo.close()

    return apariciones

print(cantidad_de_apariciones("/run/media/frnc/BLATTH/Facultad/IP-Algo1/introprog/Practicas/Practica_8_Ejercicios/texto.txt","Ciencias de la Computacion"))



