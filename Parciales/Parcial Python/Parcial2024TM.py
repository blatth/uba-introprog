'''

1) Fila en ExactaBank (1 p)

En el banco ExactaBank los clientes hacen cola para ser atendidos por un representante. Los clientes son representados por las tuplas
(nombre, tipo afiliado) donde la primera componente es el nombre y el tipo afiliado puede ser "comun" o "vip".
Se nos pide implementar una función en Python que dada una cola de clientes del banco, devuelva una nueva cola con los mismos clientes, pero en donde
los clientes vipp están primero que los clientes comunes manteniendo el orden original de los clientes vips y los comunes entre sí.

problema reordenar_cola_priorizando_vips(in: filaClientes: Cola<String x String>): Cola<String> {
    requiere: {la longitud de los valores de la primera componentes de las tuplas de la cola filaClientes es mayor a 0}
    requiere: {los valores de la segunda componente de las tuplas de la cola filaClientes son "comun" o "vip"}
    requiere: {no hay dos tuplas en filaClientes que tengan la primer componente iguales entre sí}
    asegura: {todo valor de res aparece como primera componente de alguna tupla de filaClientes}
    asegura: {|res| = |filaClientes|}
    asegura: {res no tiene elementos repetidos}
    asegura: {no hay ningun cliente "comun" antes que un "vip" en res}
    asegura: {para todo cliente c1 y cliente c2 de tipo "comun" pertenecientes a filaClientes, si c1 aparece antes que c2 en filaClientes entonces el nombre de
    c1 aparece antes que el nombre de c2 en res}
    asegura: {para todo cliente c1 y cliente c2 de tipo "vip" pertenecientes a filaClientes, si c1 aparece antes que c2 en filaClientes, entonces el nombre de
    c1 aparece antes que el nombre de c2 en res}
}


2) Chicken Game (3p)

El juego de la gallina es una competición en la que dos participantes conducen un vehículo en dirección al del contrario; si alguno se desvía de la trayectoria
de choque pierde y es humillado por comportarse como un "gallina". Se hizo un torneo para ver quién es menos gallina. Juegan todos contra todos una vez y van
sumando puntos o restando. Si dos jugadores juegan y se chocan entre sí, entonces pierde cada uno 5 puntos por haberse dañado. Si ambos jugadores se desvían,
cada uno pierde 10 puntos por gallinas. Si uno no se desvía y el otro sí, el gallina pierde 15 puntos por ser humillado y el ganador suma 10 puntos! En este
torneo, cada persona que participa tiene una estrategia predefinida para competir: o siempre se desvía, o nunca lo hace. Se debe programar la función
"torneo_de_gallinas" que recibe un diccionario (donde las claves representan los nombres de los participantes que se anotaron en el torneo, y los valores
sus respectivas estrategias) y devuelve un diccionario con los puntajes obtenidos por cada jugador.

problema torneo_de_gallinas(in: estrategias: dict(String,String)) : dict(String, Z) {
    requiere: {estrategias tiene por lo menos 2 elementos (jugadores)}
    requiere: {las claves de estrategias tienen longitud mayor a 0}
    requiere: {los valores de estrategias sólo pueden ser los strings "me desvio siempre" o "me la banco y no me desvio"}
    asegura: {las claves de res y las claves de estrategias son iguales}
    asegura: {para cada jugador p perteneciente a claves(estrategias), res[p] es igual a la cantidad de puntos que obtuvo al finalizar el torneo, dado que
    jugó una vez contra cada otro jugador}
}

3) Cuasi Ta-Te-Ti (2 puntos)
Ana y Beto juegan al Ta-Te-Ti-Facilito. El juego es en un tablero cuadrado de lado entre 5 y 10. Cada jugador va poniendo su
ficha en cada turno. Juegan intercaladamente y comienza Ana. Ana pone siempre una "X" en su turno y Beto pone una "O" en 
el suyo. Gana la persona que logra poner 3 fichas suyas consecutivas en forma vertical. SI el tablero está completo y no ganó
nadie, entonces se declara un empate. El tablero comienza vacío, representado por " " en cada posición.
Notar que dado que juegan por turnos y comienza Ana poniendo una "X" se cumple que la cantidad de "X" es igual a la 
cantidad  de "O" o bien la cantidad de "X" son uno más que la cantidad de "O".
Se nos pide implementar una función en pyhon 'problema_quien_gano_el_tateti_facilito' que determine si ganó alguno, o si
Beto hizo trampa (puso una 'O' cuando Ana ya había ganado).

problema quien_gano_el_tateti_facilito(in tablero: sez<seq<Char>>) : Z{
    requiere: {tablero es una matriz cuadrada}
    requiere: {5 <= |tablero[0]| <= 10]}
    requiere: {tablero sólo tiene 'X', 'O' y '' (espacio vacío) como elementos}
    requiere: {En tablero la cantidad de 'X' es igual a la cantidad de 'O' o bien la cantidad de 'X' es uno más que la cantidad de
    'O'}
    asegura: {res = 1 <==> hay tres 'X' consecutivas en forma vertical (misma columna) y no hay tres 'O' consecutivas en forma
    vertical(misma columna)}
    asegura: {res = 0 <==> no hay tres 'O' ni hay tres 'X' consecutivas en forma vertical}
    asegura: {res = 3 <==> hay tres 'X' y hay tres 'O' consecutivas en forma vertical (evidenciando que beto hizo trampa)}
}


4) Cuántos palíndromos sufijos (2 puntos)
Decimos que una palabra es palíndromo si se lee igual de izquierda a derecha que de derecha a izquierda. Se nos pide
programar en python la siguiente función:

problema cuantos_sufijos_son_palindromos(in texto:String) : Z{
    requiere: {-}
    asegura: {res es igual a la cantidad de palíndromos que hay en el conjunto de sufijos de texto}
    }

Nota: un sufijo es una subsecuencia de texto que va desde una posición cualquiera hasta el final de la palabra. Ej: "Diego",
el conjunto de sufijos es: "Diego", "iego", "ego", "go", "o". Para este ejercicio no consideramos a "" como sufjo de ningún texto.

'''


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