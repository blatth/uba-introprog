pertenece:: (Eq t) => t -> [t] -> Bool
pertenece x [] = False
pertenece x (y:ys) | x == y = True 
                   | otherwise = pertenece x ys

sacarRepetido:: (Eq t) => t -> [t] -> [t]
sacarRepetido x [] = [x]
sacarRepetido x (y:ys) | x == y = sacarRepetido x ys
                       | otherwise = y:sacarRepetido x ys

sacarTodosR:: (Eq t) => t -> [t] -> [t]
sacarTodosR x [] = []
sacarTodosR x (y:ys) | x == y = sacarTodosR x ys
                     | otherwise = y:sacarTodosR x ys

maximo:: [Int] -> Int
maximo [x] = x
maximo (x:y:ys) | x > y = maximo (x:ys)
                | otherwise = maximo (y:ys)

apariciones:: String -> [(String, String)] -> Int
apariciones _ [] = 0
apariciones persona ((p1, p2):xs) | persona == p1 = 1 + apariciones persona xs
                                  | persona == p2 = 1 + apariciones persona xs
                                  | otherwise = apariciones persona xs

contar:: [Int] -> Int
contar [] = 0
contar (x:xs) = 1 + contar xs