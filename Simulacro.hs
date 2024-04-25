module Simulacro where

-- 1

relacionesValidas:: [(String, String)] -> Bool
relacionesValidas [] = True
relacionesValidas [x, y]   | x /= y = True
relacionesValidas (x:y:xs) | fst(x) == snd(x) || x == y = False
                           | otherwise = relacionesValidas(y:xs)

-- 2

personas:: [(String, String)] -> [String]
personas [] = []
personas ((p1, p2):ps) = (sacarRepetido p1 (sacarRepetido p2 (personas ps)))

{- nombré p1=persona1 y ps2=persona2 para no confundirme sobre qué evalúa cada función -}

sacarRepetido:: Eq t => t -> [t] -> [t]
sacarRepetido x [] = [x]
sacarRepetido x (y:ys) | x==y = y:ys
                       | otherwise = y:sacarRepetido x ys {- si x/=y => devuelve la lista con y para luego aplicar la función al término que dejé y el resto de la lista con la cual "concatené" -}

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