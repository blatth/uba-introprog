import Language.Haskell.TH (javaScript)
{-

CONSIGNA

¡Vamos Campeones!
En exactas se está jugando un torneo de fútbol y la facultad le pidió a los alumnos de IP programar algunas
funcionalidades en Haskell, Los datos con los que contamos para esto son los nombres de los equipos que participan
del torneo, los nombres de los arqueros titulares de cada uno de dichos equipos, y la cantidad de goles recibidos
por esos arqueros. Los nombres de los equipos y sus respectivos arqueros serán modelados mediante tuplas de tipo
(String, String), donde la primera componente representa el nombre del equipo, y la segunda representa el nombre
del arquero titular de dicho equipo.
En los problemas en los cuales se reciben como parámetros secuencias arquerosPorEquipo y goles, cada posición de
la lista goles representará la cantidad de goles recibidos por el arquero del equipo que se encuentra en esa misma
posicion de arquerosPorEquipo. Por ejemplo, si la lista arquerosPorEquipo es [("Sacachispas", "Neyder Aragon"),
("Fenix", "Nahuel Galardi")] y la lista de goleses [3, 5], eso indicaría que Neyder Aragon recibió 3 goles, y
Nahuel Galardi 5.

Se pueden usar las siguientes funciones del preludio:
	- Listas: head, tail, last, init, length, elem, ++
	- Tuplas: fst, snd
	- Operaciones Lógicas: &&, ||, not
	- Constructores de listas: (x:xs), []
	- Constructores de tuplas: (x, y)


1) Atajaron Suplentes

problema atajaronSuplentes (arquerosPorEquipo: seq<String X String>, goles: seq<Z>, totalGolesTorneo: Z): Z {
	requiere: {equiposValidos(arquerosPorEquipo)
	requiere: {|arquerosPorEquipo| = |goles|}
	requiere: {Todos los elementos de goles son mayores o iguales a 0}
	requiere: {La suma de todos los elementos de goles es menor o igual a totalGolesTorneo}
	asegura: {
	res es la cantidad de goles recibidos en el torneo por arqueros que no son titulares en sus equipos.
	}
}


2) Equipos Válidos

problema equiposValidos (arquerosPorEquipo: seq<String X String>): Bool {
	requiere: {True}
	asegura: {
	(res = True) <=> arquerosPorEquipo no contiene nombres de clubes repetidos, ni arqueros repetidos, ni jugadores con nombre del club
	}
}


3) Porcentaje de goles

problema porcentajeDeGoles (arquero: String, arquerosPorEquipo: seq<String X String>, goles: seq<Z>): R {
	requiere: {La segunda componente de algún elemento de arquerosPorEquipo es arquero}
	requiere: {equiposValidos(arquerosPorEquipo)}
	requiere: {|arquerosPorEquipo| = |goles|}
	requiere: {Todos los elementos de goles son mayores o iguales a 0}
	requiere: {Hay al menos un elemento de goles mayores estricto a 0}
	asegura: {
	res es el porcentaje de goles que recibió arquero sobre el total de goles recibidos por arqueros titulares
	}
}

Para resolver este ejercicio pueden utilizar la siguiente función que devuelve como float la división entre dos
numeros de tipo Int.

division :: Int -> Int -> Float
division a b = fromIntegral a / fromIntegral b


4) Valla Menos Vencida

problema vallaMenosVencida (arquerosPorEquipo: seq<String X String>, goles: seq<Z>): String {
	requiere: {equiposValidos(arquerosPorEquipo)}
	requiere: {|arquerosPorEquipo| = |goles|}
	requiere: {Todos los elementos de goles son mayores o iguales a 0}
	requiere: {|goles| > 0}
	asegura: {
	res es alguno de los arqueros de arquerosPorEquipo que menor goles recibió de acuerdo a goles
	}
}

-}

-- 1

atajaronSuplentes:: [(String, String)] -> [Int] -> Int -> Int
atajaronSuplentes arquerosPorEquipo goles totalGolesTorneo = totalGolesTorneo - (sumaGoles goles)


sumaGoles:: [Int] -> Int
sumaGoles [] = 0
sumaGoles (x:xs) = x + sumaGoles xs

{- sumaGoles suma todos los valores de una lista de Ints, en este caso esa lista son los goles que le hicieron al titular. cuando se los resto al total, son los del suplente -}

-- 2 

equiposValidos:: [(String, String)] -> Bool
equiposValidos [] = True
equiposValidos ((e,j):xs) | e == j = False
                          | elementoRepetido e xs = False
                          | elementoRepetido j xs = False
                          | otherwise = equiposValidos xs

{- e=equipo, j=jugador -}

elementoRepetido:: String -> [(String, String)] -> Bool
elementoRepetido n [] = False
elementoRepetido n ((e,j):xs) | n == e = True
                              | n == j = True
                              | otherwise = elementoRepetido n xs

-- 3

division :: Int -> Int -> Float
division a b = fromIntegral a / fromIntegral b

cantidadDeGoles:: String -> [(String, String)] -> [Int] -> Int
cantidadDeGoles arquero ((e,j):xs) (gpe:ys) | arquero == j = gpe 
                                            | otherwise = cantidadDeGoles arquero xs ys

{- gpe=goles por equipo -}

porcentajeDeGoles:: String -> [(String, String)] -> [Int] -> Float
porcentajeDeGoles arquero arquerosPorEquipo goles = division ((cantidadDeGoles arquero arquerosPorEquipo goles)*100) (sumaGoles goles)

-- 4

vallaMenosVencida:: [(String, String)] -> [Int] -> String
vallaMenosVencida [(e1,j1)] _ = j1
vallaMenosVencida ((e1,j1):(e2,j2):xs) (gpe1:gpe2:ys) | gpe1 < gpe2 = vallaMenosVencida ((e1,j1):xs) (gpe1:ys)
                                                      | otherwise = vallaMenosVencida ((e2,j2):xs) (gpe2:ys)

{- Los parciales del 2C que hice son prácticamente iguales, solamente cambia la forma de la redacción de la consigna. Hice ambos ejemplos para practicar -}
