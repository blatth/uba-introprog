import typing

def clonarSinComentarios (nombreArchivo: str):
    arch = open(nombreArchivo, "r")
    arch_lineas:[str] = arch.readlines()
    clon_arch = open("archClon.txt", "w")
    
    for linea in arch_lineas:
        if (not(es_comentario(linea))):
            clon_arch.write(linea)
    arch.close()
    clon_arch.close()

def es_comentario (linea: str) -> bool: # auxiliar para determinar cuándo la línea empieza con un '#'
    i:int = 0
    while (i < len(linea) and linea[i] == ' '): #se acota el i para que no se indefina si hay una línea llena de espacios
        i += 1

    return i < len(linea) and linea[i] == '#'   #linea[i] es "linea sub i" -> subíndice = i
    
clonarSinComentarios("texto.txt")