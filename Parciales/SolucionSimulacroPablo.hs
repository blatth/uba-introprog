module Solucion where

-- ej1
pertenece :: (Eq t) => t -> [t] -> Bool
pertenece x [] = False
pertenece x (y:ys) | x == y = True
                   | otherwise = pertenece x ys

esTuplaValida :: (Eq t) => (t, t) -> Bool
esTuplaValida (a, b) = a /= b

inversa :: (t, t) -> (t, t)
inversa (a, b) = (b, a)

relacionesValidas :: [(String, String)] -> Bool 
relacionesValidas [] = True
relacionesValidas (x:xs) | not (esTuplaValida x) = False
                         | pertenece x xs = False
                         | pertenece (inversa x) xs = False
                         | otherwise = relacionesValidas xs


-- ej2

eliminarDuplicados :: (Eq t) => [t] -> [t]
eliminarDuplicados [] = []
eliminarDuplicados (x:xs) | pertenece x xs = eliminarDuplicados xs
                          | otherwise = x:(eliminarDuplicados xs)

personas :: [(String, String)] -> [String] 
personas [] = []
personas ((a, b):xs) = eliminarDuplicados (a:(b:(personas xs)))


--ej3

amigosDe :: String -> [(String, String)] -> [String] 
amigosDe _ [] = []
amigosDe x ((a, b):ys) | x == a = b:(amigosDe x ys)
                       | x == b = a:(amigosDe x ys)
                       | otherwise = amigosDe x ys

-- ej4

cantAmigos :: String -> [(String, String)] -> Int
cantAmigos _ [] = 0
cantAmigos x ((a, b):ys) | x == a = 1 + cantAmigos x ys
                         | x == b = 1 + cantAmigos x ys
                         | otherwise = cantAmigos x ys

{- personaConMasAmigos :: [(String, String)] -> String 
personaConMasAmigos [(a, b)] = a
personaConMasAmigos ((a, b):xs) | cantAmigos a ((a,b):xs) > cantAmigos (personaConMasAmigos xs) xs = a
                                | cantAmigos b ((a,b):xs) > cantAmigos (personaConMasAmigos xs) xs = b
                                | otherwise = personaConMasAmigos xs
-}

personaConMasAmigos :: [(String, String)] -> String 
personaConMasAmigos [(a, b)] = a
personaConMasAmigos ((a, b):xs)   | cantAmigos a xs > cantAmigos (personaConMasAmigos xs) xs = a
                                  | cantAmigos b xs > cantAmigos (personaConMasAmigos xs) xs = b
                                  | otherwise = personaConMasAmigos xs
