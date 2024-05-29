maximo:: [Integer] -> Integer
maximo [x] = x
maximo (x:y:xs) | x > y = maximo(x:xs)  
                | otherwise = maximo(y:xs)

quitar:: (Eq t) => t -> [t] -> [t]
quitar _ [] = []
quitar z (x:xs) | z == x = xs
                | otherwise = x:quitar z xs 

ordenar:: [Integer] -> [Integer]
ordenar [] = []
ordenar (x:xs) = ordenar(quitar(maximo(x:xs)) (x:xs)) ++ [maximo(x:xs)]

quitarTodos :: (Eq t) => t -> [t] -> [t]
quitarTodos x [] = []
quitarTodos x (y:ys) | y == x = quitarTodos x ys 
                     | otherwise = y:(quitarTodos x ys)




