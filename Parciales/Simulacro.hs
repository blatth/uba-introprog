{-
ENUNCIADO
 
    Ejercicio 1
    Para empezar a diseñar la novedosa y rupturista red social Y el famoso Elio Mark nos ha pedido que desarrollemos algunas funciones básicas, que tendrán como objetido representar algunas relaciones e interacciones entre los usuarios. Para esto nos envió las siguientes especificaciones en lenguaje semiformal y nos pidió que hagamos el desarrollo enteramente en Haskell, utilizando los tipos requeridos y solamente las funciones que se ven en Introducción a la Programación de Exactas-UBA.
 
    problema relacionesValidas (relaciones: seq⟨String x String⟩) : Bool {
      requiere: {True}
      asegura: {(res = true) <=> relaciones no contiene ni tuplas repetidas1, ni tuplas con ambas componentes iguales}
    }
    1 A los fines de este problema consideraremos que dos tuplas son iguales si el par de elementos que las componen (sin importar el orden) son iguales.
 
    problema personas (relaciones: seq⟨String x String⟩) : seq⟨String⟩ {
      requiere: {relacionesValidas(relaciones)}
      asegura: {res no tiene elementos repetidos}
      asegura: {res tiene exactamente los elementos que figuran en alguna tupla de relaciones, en cualquiera de sus posiciones}
    }
 
    problema amigosDe (persona: String, relaciones: seq⟨String x String⟩) : seq⟨String⟩ {
      requiere: {relacionesValidas(relaciones)}
      asegura: {res tiene exactamente los elementos que figuran en las tuplas de relaciones en las que una de sus componentes es persona}
    }
 
    problema personaConMasAmigos (relaciones: seq⟨String x String⟩) : String {
      requiere: {relaciones no vacía}
      requiere: {relacionesValidas(relaciones)}
      asegura: {res es el Strings que aparece más veces en las tuplas de relaciones (o alguno de ellos si hay empate)}
    }
 
LISTA DE FUNCIONES PERMITIDAS
=============================
mod :: Integral a => a -> a -> a
div :: Integral a => a -> a -> a
fst :: (a, b) -> a
snd :: (a, b) -> b
sqrt :: Floating a => a -> a
(:) :: a -> [a] -> [a]
(++) :: [a] -> [a] -> [a]
head :: [a] -> a
tail :: [a] -> [a]
fromIntegral :: (Integral a, Num b) => a -> b
fromInteger :: Num a => Integer -> a
arim´eticas (+, -, *, /)
potencia (**, ^)
not :: Bool -> Bool
logicas (&&, ||, ==, /=, >, <, >=, <=)
-}



-- 1

relacionesValidas:: [(String, String)] -> Bool
relacionesValidas [] = True
relacionesValidas ((p1, p2):xs) | p1 == p2 || p2 == p1 || pertenece (p1, p2) xs = False
                                | otherwise = relacionesValidas xs

{- nombré p1=persona1 y ps2=persona2 para no confundirme sobre qué evalúa cada función -}

pertenece :: (Eq t) => t -> [t] -> Bool
pertenece x [] = False
pertenece x (y:ys) | x == y = True
                   | otherwise = pertenece x ys
                              
-- 2

personas:: [(String, String)] -> [String]
personas [] = []
personas ((p1, p2):ps) = sacarRepetido p1 (sacarRepetido p2 (personas ps))

sacarRepetido:: Eq t => t -> [t] -> [t]
sacarRepetido x [] = [x]
sacarRepetido x (y:ys) | x==y = y:ys
                       | otherwise = y:sacarRepetido x ys 

{- si x/=y => devuelve la lista con y para luego aplicar la función (de forma recursiva) al término que dejé y el resto de la lista con la cual ""concatené"" -}

{-
Esto era todo un paso engorroso que no tenía sentido, puede reducirse todo a una línea (sacarRepetido)
pertenece:: (Eq String) => String -> [String] -> Bool

pertenece _ [] = []
pertenece x (y:ys) = x == y || pertenece x ys

estaRepetido:: (Eq String) => [String] -> Bool
estaRepetido [] = False
estaRepetido (x:xs) = pertenece x xs || estaRepetido xs

quitar:: (Eq String) => String -> [String] -> [String]
quitar _ [] = []
quitar z (x:xs) | z == x = xs
                | otherwise = x:quitar z xs
-}

-- 3

amigosDe:: String -> [(String, String)] -> [String]
amigosDe _ [] = []
amigosDe x ((p1, p2):ys) | x == p1 = p2:amigosDe x ys
                         | x == p2 = p1:amigosDe x ys
                         | otherwise = amigosDe x ys
  
-- 4

apariciones:: String -> [(String, String)] -> Int
apariciones _ [] = 0
apariciones persona ((p1, p2):xs) | persona == p1 = 1 + apariciones persona xs
                                  | persona == p2 = 1 + apariciones persona xs
                                  | otherwise = apariciones persona xs

{- 
ejemplo: apariciones "Pedro" [("Pedro", "Juan"),("Pedro", "María"),("Julieta", "Juan")] -> 2 
Lo que hace es ver cuántas veces aparece la persona en una lista de varias personas, ignorando si está repetido (por lo que no hay que validar si es una relacionValida o no!). Lo que me devuelve es un int con la cantidad de veces que aparece dicha persona
-}
                                  
personaConMasAmigos :: [(String, String)] -> String 
personaConMasAmigos [(p1, p2)] = p1
personaConMasAmigos ((p1, p2):xs) | apariciones p1 ((p1, p2):xs) > apariciones (personaConMasAmigos xs) xs = p1
                                  | apariciones p2 ((p1, p2):xs) > apariciones (personaConMasAmigos xs) xs = p2
                                  | otherwise = personaConMasAmigos xs

{-

Todo lo que está acá abajo es un código que intenté (que, por lo que probé, funcionaba) pero era mucho más extenso que lo anterior

aparicionesPorPersona:: [String] -> [(String, String)] -> [(String, Int)]
aparicionesPorPersona [] _ = []
aparicionesPorPersona (persona:xs) relaciones = (persona, apariciones persona relaciones) : aparicionesPorPersona xs relaciones

{- 
ejemplo: aparicionesPorPersona ["Pedro","Julieta"] [("Pedro", "Juan"),("Pedro", "María"),("Julieta", "Juan")] -> [("Pedro",2),("Julieta",1)] 
Lo que hace es matchear una lista de personas con la cantidad de veces que aparece, devolviendo una lista de tuplas compuestas por el nombre y las apariciones.
-}

listaAparicionesPorPersona:: [(String, String)] -> [(String,Int)]
listaAparicionesPorPersona relaciones = aparicionesPorPersona (personas relaciones) relaciones

maximoAp:: [(String, Int)] -> String
maximoAp ((p1, ap1):xs) = p1
maximoAp ((p1, ap1):(p2, ap2):xs) | ap1 > ap2 = maximoAp((p1, ap1):xs)  
                                  | otherwise = maximoAp((p2, ap2):xs)
-}
