{-

Funciones válidas:

mod :: Integral a => a -> a -> a
div :: Integral a => a -> a -> a
fst :: (a, b) -> a
snd :: (a, b) -> b
sqrt :: Floating a => a -> a
(:) :: a -> [a] -> [a]
(++) :: [a] -> [a] -> [a]
head :: [a] -> a
tail :: [a] -> [a]
fromIntegral :: (Integral a, Num b) => a -> b
fromInteger :: Num a => Integer -> a
ariméticas (+,-,*,/)
potencia (**,^)
not :: Bool -> Bool
lógicas (&&,||,==,/=,>,<,>=,<=)
length :: Foldable t => t a -> Int
elem :: (Foldable t, Eq a) => a -> t a -> Bool

Requieren import Data.Char
ord :: Char -> Int
chr :: Int -> Char

-}

import Data.Char

-- 1

esMiniscula:: Char -> Bool
esMiniscula c | ord c >= 97 && ord c <= 122 = True
              | otherwise = False

-- 2

letraANatural:: Char -> Int
letraANatural c = ord c - 97

-- 3

desplazar:: Char -> Int -> Char
desplazar c n | ord c + n <= 122 && letraANatural c >= 0 && letraANatural c <= 25 = chr(letraANatural c + 97 + n)
              | ord c + n > 122 && letraANatural c >= 0 && letraANatural c <= 25 = chr(letraANatural c + 71 + n)
              | otherwise = c

-- 4

cifrar :: String -> Int -> String
cifrar "" _ = ""
cifrar s n | esMiniscula (head s) = (desplazar (head s) n) : (cifrar (tail s) n)
           | otherwise = (head s) : (cifrar (tail s) n)

-- 5

-- CORREGIR
descifrar:: String -> Int -> String
descifrar s n = cifrar s (-n)

-- 6 

indiceDeLaLista :: Eq t => [t] -> t -> Int
indiceDeLaLista (x:xs) t    | (x == t) = 0
                            | otherwise = 1 + (indiceDeLaLista xs t)


-- Esta función agarra una lista de Strings y un n y devuelve una lista con cada string cifrado con (n-1) + el lugar de la lista
cifrarConNLaLista :: [String] -> Int -> [String]
cifrarConNLaLista [] _ = []
cifrarConNLaLista l n   | length l == 1 = (cifrar (head l) n  : [])
                        | otherwise = (cifrar (head l) n : []) ++ (cifrarConNLaLista (tail l) (n+1)) 

cifrarLista :: [String] -> [String]
cifrarLista l = cifrarConNLaLista l 1

-- 7

-- frecuencia:: String -> [Float]

contar:: String -> Int
contar [] = 0
contar (x:xs) | ord x < 97 || ord x > 122 = 0 + contar xs
              | ord x >= 97 && ord x <= 122 = 1 + contar xs

-- 8

mayorElementoLista :: [Float] -> Float
mayorElementoLista [] = 0
mayorElementoLista l    | length l == 1 = head l
                        | head(l) >= head(tail l) = mayorElementoLista (head(l) : tail(tail l))
                        | otherwise =  mayorElementoLista (tail l)

indiceMayorElementoLista :: [Float] -> Int
indiceMayorElementoLista l = 1 + (indiceDeLaLista l (mayorElementoLista l)) 


cifradoMasFrecuente :: String -> Int -> (Char, Float)
cifradoMasFrecuente [] n = []
cifradoMasFrecuente l n =  (chr (97 + indiceMayorElementoLista (frecuencia (cifrar l n))) ,mayorElementoLista (frecuencia (cifrar l n)))

-- 10

-- Esta función toma el primer elemento de una lista de frases/palabras y lo compara contra todos los demas, devuelve las tuplas: ((head, cifrado head) para algun n)
descifradosDeHead :: [String] -> [(String, String)]
descifradosDeHead l | length l <= 1 = []
                    | (esDescifrado (head l) head(tail l)) = ((head l),head(tail l)): (descifradosDeHead (head l): tail(tail l))
                    | otherwise = descifradosDeHead (head l): tail(tail l)

-- Esta función toma una lista de frases/palabras cifradas y devuelva las tuplas que son "pareja" (o sea (s1,s2) esta en la respuesta si S1 es cifrado de S2 para algun n) 
descifradosUnicos :: [String] -> [(String, String)]
descifradosUnicos l = descifradosDeHead l ++ descifradosDeHead (tail l)

-- Esta función le damos una lista de tuplas y le agrega las tuplas invertidas (si S1 es la cifrada de s2 con n => s2 es la cifrada de s1 con 26-n)
concatenaConEspejados :: [(String, String)] -> [(String, String)]
concatenaConEspejados [] = []
concatenaConEspejados l | length l == 1 = (snd(head l),fst(head l)):l
                        | otherwise = concatenaConEspejados (head l) ++ concatenaConEspejados (tail l)

todosLosDescifrados :: [String] -> [(String, String)]
todosLosDescifrados l = concatenaConEspejados (descifradosUnicos l)

-- 12

-- Esta función le damos la frase y la clave expandidad (con la longitud de la frase), devuelve el cifrado vigenere 
cifrarConClaveExpandida :: String -> String -> String
cifrarConClaveExpandida [] _ = []
cifrarConClaveExpandida l e = (cifrar (head l) ord (head (e))) ++ (cifrarConClaveExpandida (tail l) (tail e))


cifrarVigenere :: String -> String -> String
cifrarVigenere l c  = cifrarConClaveExpandida l (expandirClave c (length l))
                    
-- 14

-- Funcion modulo
modulo :: Int -> Int
modulo x    | x >= 0 = x
            | otherwise = -x

-- Esta función calcula la distancia entre dos Strings de la misma longitud
distanciaEntreSecuencias :: String -> String -> Int --Requiere que ambos strings tengan la misma longitud
distanciaEntreSecuencias [] _ = 0
distanciaEntreSecuencias l c  = modulo(ord (head l) - ord (head c)) + (distanciaEntreSecuencias (tail l) (tail c))


-- Esta función le damos nuestra frase y una lista de palabras clave y devuelve un lista con todos los cifrados Vig para cada clave
muchosCifradosVig :: String -> [String] -> [String]
muchosCifradosVig _ [] = []
muchosCifradosVig l s  = cifrarVigenere l (head s) : muchosCifradosVig l (tail s)


peorCifrado :: String -> [String] -> String
peorCifrado _ [] = []
peorCifrado l s | (distanciaEntreSecuencias l head(muchosCifradosVig l s)) < distanciaEntreSecuencias l head(tail (muchosCifradosVig l )) = peorCifrado l (head s:tail(tail s))
                | otherwise = peorCifrado l (tail s)
