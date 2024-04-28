{- consigna: https://gitlab.com/faustomartinez/uba-algoritmos-y-estructuras-de-datos-i/-/blob/main/1er-parcial/PrimerParcial.pdf -}

-- 1

computoVotosAfirmativos:: [Int] -> Int
computoVotosAfirmativos [] = 0
computoVotosAfirmativos (x:xs) = x + computoVotosAfirmativos xs

{- dada una lista con números, los suma. si la lista es vacía o ya verificó todos los valores, va al caso base de []=0 -}

votosEnBlanco:: [(String, String)] -> [Int] -> Int -> Int
votosEnBlanco _ votosAfirmativos votosTotales = votosTotales - (computoVotosAfirmativos votosAfirmativos)

{- dado lo siguiente: [("Biden","Biondini")] [1,1,2,3,4,1,1,] 180, donde 1: fórmula, 2: votosafirmativos, 3: votostotales, le resta a la totalidad de los votos el cómputo de votos afirmativos realizado sobre la lista que le es dada. sería como sacar un cardinal por complemento. -}


-- 2

{-
 formulasValidas:: [(String, String)] -> Bool
formulasValidas [] = True
formulasValidas ((a,b):xs) | a == b = False
                           | 
                           | 
                           | otherwise = formulasValidas xs 
-} 

{- consultar cómo hacer para poner que cuando candidatoPerteneceTupla = true, formulaValida = false  -}

candidatoPerteneceTupla:: String -> [(String, String)] -> Bool

candidatoPerteneceTupla n [] = False
candidatoPerteneceTupla n ((a,b):xs) | n == a = True
                                     | n == b = True 
                                     | otherwise = candidatoPerteneceTupla n xs

{- candidatoPerteneceTupla verifica que el candidato dado esté o no en la tupla. si se compara con una lista (que no es la vacía) y da false, comienza el proceso de vuelta. si se compara con un vacío termina la secuencia (caso base). -}

-- 3

division:: Int -> Int -> Float
division a b = fromIntegral a / fromIntegral b

numeroDeVotos:: String -> [(String, String)] -> [Int] -> Int
numeroDeVotos presidente ((candidato, vice):xs) (votos:ys) | presidente == candidato = computoVotosAfirmativos(votos:ys)
                                                           | otherwise = numeroDeVotos presidente xs ys

porcentajeDeVotos:: String -> [(String, String)] -> [Int] -> Float
porcentajeDeVotos presidente formula (votos:ys) = division ((numeroDeVotos presidente formula (votos:ys))*100) (computoVotosAfirmativos (votos:ys))

{- Me da siempre 100, obviamente, porque siempre le paso la misma lista y compara con esa. Siento como si faltase un input (votosTotales), pero no sé otra forma de interpretar el enunciado. Preguntar -}

