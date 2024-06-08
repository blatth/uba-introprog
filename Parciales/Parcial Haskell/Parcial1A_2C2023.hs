{-

CONSIGNA

1) Votos en Blanco [1 punto]

problema votosEnBlanco (formulas: seq⟨String x String⟩,votos:seq< Z >, cantTotalVotos: Z) : Z {
  requiere: {formulasValidas(formulas)}
  requiere: {|formulas| = |votos|}
  requiere: {Todos los elementos de votos son mayores o iguales a 0}
  requiere: {La suma de todos los elementos de votos es menor o igual a cantTotalVotos}
  asegura: {res es la cantidad de votos emitidos que no correspondieron a niguna de las fórmulas que se presentaron}
}

2) Formulas Válidas [3 puntos]

problema formulasValidas (formulas: seq⟨String x String⟩) : Bool {
  requiere: {True}
  asegura: {(res = true) <=> formulas no contiene nombres repetidos, es decir que cada candidato está en una única fórmula (no se puede ser candidato a presidente y a vicepresidente ni en la misma fórmula ni en fórmulas distintas)}
}

3) Porcentaje de Votos [3 puntos]

problema porcentajeDeVotos (presidente: String, formulas: seq⟨String x String⟩,votos:seq< Z >) : R {
  requiere: {La primera componente de algún elemento de formulas es presidente}
  requiere: {formulasValidas(formulas)}
  requiere: {|formulas| = |votos|}
  requiere: {Todos los elementos de votos son mayores o iguales a 0}
  requiere: {Hay al menos un elemento de votos que es mayor que estricto que 0}
  asegura: {res es el porcentaje de votos que obtuvo la fórmula encabezada por presidente sobre el total de votos afirmativos}
}
Para resolver este ejercicio pueden utilizar la siguiente función que devuelve como Float la división entre dos números de tipo Int:

division :: Int -> Int -> Float
division a b = (fromIntegral a) / (fromIntegral b) 

4) Próximo Presidente [3 puntos]

problema proximoPresidente (formulas: seq⟨String x String⟩, votos:seq< Z >) : String {
  requiere: {formulasValidas(formulas)}
  requiere: {|formulas| = |votos|}
  requiere: {Todos los elementos de votos son mayores o iguales a 0}
  requiere: {Hay al menos un elemento de votos mayores estricto a 0}
  requiere: {|formulas| > 0}
  asegura: {res es el candidato a presidente de formulas más votado de acuerdo a los votos contabilizados en votos}
}

-}

-- 1

computoVotosAfirmativos:: [Int] -> Int
computoVotosAfirmativos [] = 0
computoVotosAfirmativos (x:xs) = x + computoVotosAfirmativos xs

{- dada una lista con números, los suma. si la lista es vacía o ya verificó todos los valores, va al caso base de []=0 -}

votosEnBlanco:: [(String, String)] -> [Int] -> Int -> Int
votosEnBlanco _ votosAfirmativos votosTotales = votosTotales - (computoVotosAfirmativos votosAfirmativos)

{- dado lo siguiente: [("Biden","Peron")] [1,1,2,3,4,1,1] 180, donde 1: fórmula, 2: votosafirmativos, 3: votostotales, le resta a la totalidad de los votos el cómputo de votos afirmativos realizado sobre la lista que le es dada. sería como sacar un cardinal por complemento. -}


-- 2


formulasValidas:: [(String, String)] -> Bool
formulasValidas [] = True
formulasValidas ((a,b):xs) | a == b = False
                           | candidatoPerteneceTupla a xs = False
                           | candidatoPerteneceTupla b xs = False 
                           | otherwise = formulasValidas xs 
 
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
numeroDeVotos presidente ((candidato, vice):xs) (votos:ys) | presidente == candidato = votos
                                                           | otherwise = numeroDeVotos presidente xs ys

porcentajeDeVotos:: String -> [(String, String)] -> [Int] -> Float
porcentajeDeVotos presidente formulas (votos:ys) = division ((numeroDeVotos presidente formulas (votos:ys))*100) (computoVotosAfirmativos (votos:ys))

-- 4

proximoPresidente:: [(String, String)] -> [Int] -> String
proximoPresidente [(candidato, vice)] _ = candidato
proximoPresidente (f1:f2:fs) (v1:v2:vs) | v1 >= v2 = proximoPresidente (f1:fs) (v1:vs)
                                        | otherwise = proximoPresidente (f2:fs) (v2:vs)

{- 
ejemplo: proximoPresidente [("Massa","Rossi"),("Lavagna", "Petri"),("Milei","Villarruel")] [105, 111, 82] -> "Lavagna"
Si los v1 (votos1) es mayor o igual a v2 (votos2), se va al paso recursivo comparando la f1 (formula1) y v1 con el resto de la lista. Si es al revés, se compara la f2 (formula2) y v2 con el resto de la lista -}