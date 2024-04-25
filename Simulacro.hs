module Simulacro where

relacionesValidas:: [(String, String)] -> Bool
relacionesValidas [] = True
relacionesValidas [x, y]   | x /= y = True
relacionesValidas (x:y:xs) | fst(x) == snd(x) || x == y = False
                           | otherwise = relacionesValidas(y:xs)

personas:: [(String, String)] -> [String]
personas [] = []
personas (x:xs) = (fst x: [snd x]) ++ personas xs

{- 
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