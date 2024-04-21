sumatoria1:: Int -> Int-> Int

sumatoria1 n 1 = 1
sumatoria1 n j = n^j + sumatoria1 n (j-1)

sumatoria2:: Int -> Int -> Int

sumatoria2 1 m = 1
sumatoria2 n m = sumatoria2 (n-1) m + sumatoria1 n m

{- En sumatorias, siempre se separan y se resuelve el último valor
de la sumatoria de forma separada, para luego plantear (por recursión)
la suma de todos lo valores anteriores al último. -}


