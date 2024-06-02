import typing

def es_comentario (linea: str) -> bool: # auxiliar para determinar cuándo la línea empieza con un '#'
    i:int = 0
    while (i < len(linea) and linea[i] == ' '): # se acota el i para que no se indefina si hay una línea llena de espacios. si linea[i] == ' ' (espacio), se va a la siguiente línea
        i += 1

    return i < len(linea) and linea[i] == '#'   # si linea[i] == #, devuelve True

def clonarSinComentarios (nombreArchivo: str):
    arch = open(nombreArchivo, "r") 
    arch_lineas:[str] = arch.readlines()
    clon_arch = open("archClon.txt", "w") # crea un nuevo archivo clon de solo lectura
    
    for linea in arch_lineas:
        if (not(es_comentario(linea))):
            clon_arch.write(linea) # si la línea no es comentario, escribe la línea en un nuevo archivo clon
    arch.close()
    clon_arch.close()
    
# luego de utilizar archivos, recordar siempre cerrarlos

clonarSinComentarios("/run/media/frnc/BLATTH/Facultad/IP-Algo1/introprog/Practicas/Practica_8_Ejercicios/texto.txt")