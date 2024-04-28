-- 1

computoVotosAfirmativos:: [Int] -> Int
computoVotosAfirmativos [] = 0
computoVotosAfirmativos (x:xs) = x + computoVotosAfirmativos xs

{- dada una lista con números, los suma. si la lista es vacía o ya verificó todos los valores, va al caso base de []=0 -}

votosEnBlanco:: [(String, String)] -> [Int] -> Int -> Int
votosEnBlanco _ votosAfirmativos votosTotales = votosTotales - (computoVotosAfirmativos votosAfirmativos)

{- dado lo siguiente: [("Biden","Biondini")] [1,1,2,3,4,1,1,] 180, donde 1: fórmula, 2: votosafirmativos, 3: votostotales, le resta a la totalidad de los votos el cómputo de votos afirmativos realizado sobre la lista que le es dada. sería como sacar un cardinal por complemento. -}


-- 2

