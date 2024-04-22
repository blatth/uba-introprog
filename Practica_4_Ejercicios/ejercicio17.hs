
fibonacci:: Integer -> Integer
fibonacci n | n==0 = 0
            | n==1 = 1
            | otherwise = fibonacci(n-1) + fibonacci(n-2)

esFibonacci:: Integer -> Bool
esFibonacci m = esFibonacciAux m 0

esFibonacciAux:: Integer -> Integer -> Bool
esFibonacciAux m n | fibonacci n > m = False {-no sé si es necesario, supongo que sí-}               
                   | fibonacci n == m = True
                   | otherwise = esFibonacciAux m (n+1)
