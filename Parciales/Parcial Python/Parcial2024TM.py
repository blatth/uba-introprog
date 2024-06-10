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
    for jugador in estrategias.items(): # jugador se piensa como la tupla (nombre, puntaje) de res
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

print(quien_gano_el_tateti_facilito([["X","O","X"],["O","X","O"],["X","O","O"]]))

# 4

def es_palindromo(texto:str) -> bool:
    ultimaLetra:int = len(texto)-1
    i:int = 0

    while i < ultimaLetra and i != ultimaLetra:
        if texto[i] != texto[ultimaLetra]:
            return False
        i += 1
        ultimaLetra -= 1
    return True

# Tengo que corregirlo v
def cuantos_sufijos_son(texto: str) -> int:
    contador:int = 0
    while len(texto) > 0:
        texto.pop(0)
        sufijo = texto
        if es_palindromo(sufijo):
            contador += 1
    return contador

# print(es_palindromo("anastasia"))
print(cuantos_sufijos_son("anastasia"))