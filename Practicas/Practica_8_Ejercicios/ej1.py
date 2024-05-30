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

#Otra implementación del mismo ej

def contarLineas (nombre_del_archivo: str) -> int:
    archivo = open (nombre_del_archivo,"r")
    contenido:[str] = archivo.readlines()
    cantidad_lineas = len(contenido)
    archivo.close()
    return cantidad_lineas

print(contarLineas("texto.txt"))

'''
# Ej 1.2
def existePalabra (palabra: str, nombre_del_archivo: str) -> bool:
    existe = False
    archivo = open (nombre_del_archivo,"r")
    contenido = archivo.read()
    aux = ""
    for i in contenido:
        if (i == ' ' or i == '\n'): #/n es un salto de línea
            if (palabra == aux):
                archivo.close()
                existe = True
            aux = ""
        else:
            aux = aux + i
    archivo.close()
    return existe
#print(existePalabra("Lautaro","texto.txt"))

# Ej 1.3
def cantidad_de_apariciones (nombre_del_archivo:str,palabra:str) -> int:
    archivo = open (nombre_del_archivo,"r")
    apariciones = 0
    contenido = archivo.read()
    aux = ''
    for i in contenido:
        if (i == ' ' or i == '\n'):
            if(palabra == aux):
                apariciones += 1
            aux = ""
        else:
            aux += i
    archivo.close()
    return apariciones
#print(cantidad_de_apariciones("texto.txt","sos"))
'''
