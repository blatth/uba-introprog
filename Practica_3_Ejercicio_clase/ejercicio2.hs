maximo3:: Integer -> Integer -> Integer -> Integer

maximo3 x y z | x >= y && x >= z = x 
              | y >= x && y >= z = y
              | otherwise = z   

sumaDistintos:: Int -> Int -> Int -> Int

sumaDistintos x y z | x /= y && x/= z && y /= z = x + y + z
                    | x == y && x /= z = z
                    | x /=y && x == z = y
                    | y == z && y /=x = x
                    | otherwise = 0

--- corregir ^

digitoUnidades:: Int -> Int 

digitoUnidades n | n >= 0 = mod n 10
                 | otherwise = mod (-n) 10   

-- Otra forma (mejor):
-- digitoUnidades:: Int -> Int 

-- digitoUnidades n mod (abs n) 10

digitoDecenas:: Int -> Int

digitoDecenas n = digitoUnidades (div (abs n) 10)