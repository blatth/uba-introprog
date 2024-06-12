from queue import Queue as Cola

# 1

def reordernar_cola_priorizando_vips(filaClientes:Cola[(str, str)]) -> Cola[str]:
    colaComun=Cola() # cola con nombres de comunes
    colaVip=Cola() # cola con nombres de vips
    colaAux=Cola() # cola nueva
    res=Cola()

    while not(filaClientes.empty()): # me fijo que no esté vacía filaClientes
        cliente = filaClientes.get() # defino a clientes como clientes = ("nombre", "tipoAfiliado")
        if cliente[1] == "vip":
            colaVip.put(cliente[0]) # devuelvo el nombre de la persona en colaVip
        elif cliente[1] == "comun":
            colaComun.put(cliente[0])
        colaAux.put(cliente)

    while not(colaVip.empty()): # pongo todos los elem de colaVip en res
        res.put(colaVip.get())
    while not(colaComun.empty()):
        res.put(colaComun.get())

    while not(colaAux.empty()): # restauro 
        filaClientes.put(colaAux.get())
    
    return res

filaClientes=Cola()
filaClientes.put(("Pepe", "vip"))
filaClientes.put(("Jose", "comun"))
filaClientes.put(("Maria", "vip"))
filaClientes.put(("Josefa", "comun"))

print(reordernar_cola_priorizando_vips(filaClientes).queue)

# 2

"""
Si 2 chocan entre sí: cada uno pierde 5 puntos
si ambos se desvían ambos pierden 10 puntos
Si uno se desvía y el otro no: el que se desvía pierde 15 puntos y el otro gana 10 puntos
"""

estrategias:dict[(str, str)] = {
    "Pepe":"me desvío siempre",
    "Jose":"me desvío siempre",
    "Maria":"me la banco y no me desvío",
    "Josefa":"me la banco y no me desvío"
}

def torneo_de_gallinas(estrategias:dict[(str, str)]) -> dict[(str, int)]:
    res:dict[(str, int)] = {}
    for jugador in estrategias.items(): # jugador se piensa como la tupla (nombre, estrategia) de res
        puntaje = 0 #contador
        for jugador2 in estrategias.items(): # jugador2 se define para compararse con jugador
            if jugador != jugador2: # defino 4 opciones porque hay 4 posibilidades de puntaje, de acuerdo a si las estrategias son iguales o no
                if jugador[1] == "me la banco y no me desvío" and jugador[1] == jugador2[1]: 
                    puntaje -= 5
                elif jugador[1] == "me desvío siempre" and jugador[1] == jugador2[1]:
                    puntaje -= 10
                elif jugador[1] == "me la banco y no me desvío" and jugador[1] != jugador2[1]:
                    puntaje += 10
                elif jugador[1] == "me desvío siempre" and jugador[1] != jugador2[1]:
                    puntaje -= 15
        
        res[jugador[0]] = puntaje # a la key de jugador (el nombre), le doy el valor que obtuve en el paso anterior (puntaje)
    return res

print(torneo_de_gallinas(estrategias))

# 3

'''
def quien_gano_el_tateti_facilito(tablero: list[list[str]]) -> int:
    res1:int=0
    res2:int=0
    for linea in range(len(tablero)-2):
        for i in range(len(tablero[linea])): # esto sería como escribir la longitud de la línea 
            if tablero[linea][i] == tablero[linea+1][i] and tablero[linea][i] == tablero[linea+2][i] and tablero[linea][i] == "X":
                res1 += 1
            elif tablero[linea][i] == tablero[linea+1][i] and tablero[linea][i] == tablero[linea+2][i] and tablero[linea][i] == "O":
                res2 += 2

    return res1 + res2
'''

# Lo hice de otra forma para "mecanizar" esta solución. Itero sobre un i_columna en el rango de la len de la lista, luego itero dentro de eso con la len de la lista, nuevamente. en este caso acoté y lo hice entre 0, 1 para que no se indefina (porque comparo con los 2 siguientes al 0)
# Voy comparando línea a línea con el término de cada lista (o fila) que se encuentra en igual posición

def quien_gano_el_tateti_facilito(tablero: list[list[str]]) -> int:
    resX:int = 0
    resO:int = 0

    for i_columna in range(len(tablero[0])): # range (len(tablero[0])) = 3 

        for i_fila in range (0, 1): # range (0, 1) = 2
            if tablero[i_fila][i_columna] == tablero[i_fila+1][i_columna] and tablero[i_fila][i_columna] == tablero[i_fila+2][i_columna] == "X":
                resX = 1
            elif tablero[i_fila][i_columna] == tablero[i_fila+1][i_columna] and tablero[i_fila][i_columna] == tablero[i_fila+2][i_columna] == "O":
                resO = 2
    
    return resX + resO

print(quien_gano_el_tateti_facilito([["X","O","X"],["O","X","O"],["X","O","O"]])) # -> 0
# print(quien_gano_el_tateti_facilito([["X","O","X"],["X","X","O"],["X","O","O"]])) # -> 1
# print(quien_gano_el_tateti_facilito([["X","O","X"],["X","O","O"],["X","O","O"]])) # -> 3
# print(quien_gano_el_tateti_facilito([["X","O","X"],["X","X","O"],["X","O","O"]])) # -> 1
# print(quien_gano_el_tateti_facilito([["X","O","X"],["O","O","O"],["X","O","O"]])) # -> 2


# 4

def es_palindromo(texto:str) -> bool:
    ultimaLetra:int = len(texto)-1
    i:int = 0

    while i < ultimaLetra:
        if texto[i] != texto[ultimaLetra]:
            return False
        i += 1
        ultimaLetra -= 1
    return True

def cuantos_sufijos_son(texto: str) -> int:
    contador:int = 0
    
    for i in range(len(texto)):
        sufijo = "" # voy armando un sufijo
        for j in range(i, len(texto)):
            sufijo += texto[j]
        if es_palindromo(sufijo):
            contador += 1
    
    return contador

# todas las palabras van a tener un contador >= 1 porque cuando queda una sola letra (por ej: en anastasia la última iteración es "a"), eso cuenta como un palíndromo (contador = 1)

print(es_palindromo("anastasia"))
print(cuantos_sufijos_son("anastasia"))