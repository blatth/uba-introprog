
fibonacci:: Integer -> Integer

fibonacci n | n==0 = 0
            | n==1 = 1
            | otherwise = fibonacci(n-1) + fibonacci(n-2)

-- Ver práctica