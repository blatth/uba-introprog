
fibonacci:: Int -> Int

fibonacci n | 1 == 0 = 0
            | 1 == 1 = 1
            | n = fibonacci(n-1)+fibonacci(n+2)