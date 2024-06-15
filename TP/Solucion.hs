module Solucion where
import Data.Char

{-

Nota final: 83/100
Calidad del código: Buen código
Calificación por ej (casos de test de la materia): [0.25, 0.25, 0.25, 0.25, 0.25, 0.25,	0.5, 0.75, 1, 0.84,	1, 1, 1, 1,	0.68]	
Calificación por casos de test del grupo: [MB, B, MB, B, B,	B, B, B, MB, MB, B,	B, B, R, B]

Devolución: 

"Buenas. 
En casos como estos:
    esMinuscula c | ord c >= 97 && ord c <= 122 = True
usar 'a' en vez de 97 facilita entender el código. Lo mismo con todos los números sueltos que aparecen en el código. 

En algunos casos, como faltan comentarios que aclaren lo que quieren hacer, es muy difícil seguir el código."

-}


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


-- 1

esMinuscula:: Char -> Bool
esMinuscula c | ord c >= 97 && ord c <= 122 = True
              | otherwise = False

-- 2

letraANatural:: Char -> Int
letraANatural c = ord c - 97

-- 3

desplazar:: Char -> Int -> Char
desplazar c n | letraANatural c >= 0 && letraANatural c <= 25 = chr((mod(letraANatural c + n) 26) + 97)
              | otherwise = c

-- 4

cifrar :: String -> Int -> String
cifrar "" _ = ""
cifrar s n | esMinuscula (head s) = (desplazar (head s) n) : (cifrar (tail s) n)
           | otherwise = (head s) : (cifrar (tail s) n)

-- 5

descifrar:: String -> Int -> String
descifrar s n = cifrar s (n*(-1))

-- 6 

indiceDeLaLista :: Eq t => [t] -> t -> Int
indiceDeLaLista (x:xs) t | (x == t) = 0
                         | otherwise = 1 + (indiceDeLaLista xs t)

-- Esta función agarra una lista de Strings y un n y devuelve una lista con cada string cifrado con (n-1) + el lugar de la lista
cifrarConNLaLista :: [String] -> Int -> [String]
cifrarConNLaLista [] _ = []
cifrarConNLaLista l n   | length l == 1 = (cifrar (head l) n  : [])
                        | otherwise = (cifrar (head l) n : []) ++ (cifrarConNLaLista (tail l) (n+1)) 

cifrarLista :: [String] -> [String]
cifrarLista l = cifrarConNLaLista l 0

-- 7

frecuencia :: String -> [Float]
frecuencia xs | hayLetrasMinusculas xs == False = producirListaDeNCeros 0 26
              | otherwise = encontrarFrecuenciaDeAparicion xs 97

producirListaDeNCeros :: Int -> Int -> [Float]
producirListaDeNCeros n m | n == m = []
                          | otherwise = 0: producirListaDeNCeros (n+1) m

encontrarFrecuenciaDeAparicion :: String -> Int -> [Float]
encontrarFrecuenciaDeAparicion _ 123 = []
encontrarFrecuenciaDeAparicion xs n = (porcentaje (cantidadDeApariciones (chr n) xs) (contarMinusculas xs)) : encontrarFrecuenciaDeAparicion xs (n+1)

cantidadDeApariciones :: Char -> String -> Int
cantidadDeApariciones _ [] = 0
cantidadDeApariciones n (x:xs) | x == n = 1 + (cantidadDeApariciones n xs)
                               | otherwise = 0 + (cantidadDeApariciones n xs)

porcentaje :: Int -> Int -> Float
porcentaje x y = ((fromIntegral x)*100) / (fromIntegral y)

contarMinusculas :: String -> Int
contarMinusculas [x]    | esMinuscula x = 1
                        | not (esMinuscula x) = 0
contarMinusculas (x:xs) | length (x:xs) == 0 = 0
                        | esMinuscula x = 1 + contarMinusculas xs
                        | otherwise = contarMinusculas xs

hayLetrasMinusculas :: String -> Bool
hayLetrasMinusculas [] = False
hayLetrasMinusculas (x:xs) = esMinuscula x || hayLetrasMinusculas xs

-- 8

soloMinusculas :: String -> String
soloMinusculas [] = []
soloMinusculas (x:xs) | esMinuscula x = x : soloMinusculas xs
                      | otherwise = soloMinusculas xs

letraMasFrecuente :: String -> Char
letraMasFrecuente (x:y:ys) | length (soloMinusculas (x:y:ys)) == 1 || length (soloMinusculas (x:y:ys)) == 2 = head (soloMinusculas (x:y:ys))
                           | cantidadDeApariciones (head (soloMinusculas (x:y:ys))) (soloMinusculas (x:y:ys)) >= cantidadDeApariciones (head (soloMinusculas (y:ys))) (soloMinusculas (x:y:ys)) = letraMasFrecuente (soloMinusculas (x:ys))
                           | otherwise = letraMasFrecuente (soloMinusculas (y:ys))

frecuenciaChar :: String -> Char -> Float
frecuenciaChar [] _ = 0
frecuenciaChar (x:xs) c = (fromIntegral (cantidadDeApariciones c (x:xs)) / fromIntegral (contarMinusculas (x:xs))) * 100

cifradoMasFrecuente :: String -> Int -> (Char, Float)
cifradoMasFrecuente [x] n = (x, (fromIntegral 100))
cifradoMasFrecuente (x:xs) n = (letraMasFrecuente (cifrar (x:xs) n), frecuenciaChar (cifrar (x:xs) n) (letraMasFrecuente (cifrar (x:xs) n)))

-- 9

esDescifradoConIterador:: String -> String -> Int -> Bool
esDescifradoConIterador p1 p2 n | n == 26 = False
                                | cifrar p1 n == p2 = True
                                | otherwise = esDescifradoConIterador p1 p2 (n+1)

esDescifrado:: String -> String -> Bool
esDescifrado p1 p2 = esDescifradoConIterador p1 p2 0

-- 10

descifradosDeHead :: [String] -> [(String, String)]
descifradosDeHead l | length l <= 1 = []
                    | (esDescifrado (head l) (head(tail l))) = ((head l),head(tail l)): (descifradosDeHead ((head l): tail(tail l)))
                    | otherwise = descifradosDeHead ((head l): tail(tail l))


-- Esta función toma una lista de frases/palabras cifradas y devuelva las tuplas que son "pareja" (o sea (s1,s2) esta en la respuesta si S1 es cifrado de S2 para algun n) 
descifradosUnicos :: [String] -> [(String, String)]
descifradosUnicos l = descifradosDeHead l ++ descifradosDeHead (tail l)

-- Esta función le damos una lista de tuplas y le agrega las tuplas invertidas (si S1 es la cifrada de s2 con n => s2 es la cifrada de s1 con 26-n)
concatenaConEspejados :: [(String, String)] -> [(String, String)]
concatenaConEspejados [] = []
concatenaConEspejados l | length l == 1 = (snd(head l),fst(head l)):l
                        | otherwise = concatenaConEspejados [head l] ++ concatenaConEspejados (tail l)

todosLosDescifrados :: [String] -> [(String, String)]
todosLosDescifrados [] = []
todosLosDescifrados l = concatenaConEspejados (descifradosUnicos l)


-- 11

{-
 concatenarClave es la que hace expande efectivamente la clave, la principal solo la llama. 
- Caso base: si la longitud (el n) restante es 0, no devuelve nada (en realidad, devuelve una lista vacía)
- Paso recursivo 1: Cuando se agotaron los char del string al que aún le tengo que seguir restando, empieza a tomar el string original para realizar el paso
- Paso recursivo 2: agrega el k (primer char del string) a la lista y llama de vuelta a la función con lo que queda del string y n-1
-}

concatenarClave :: String -> Int -> String -> String
concatenarClave _ 0 _ = []
concatenarClave [] n claveOriginal = concatenarClave claveOriginal n claveOriginal
concatenarClave (k:ks) n claveOriginal = k : concatenarClave ks (n - 1) claveOriginal

expandirClave :: String -> Int -> String
expandirClave c n = concatenarClave c n c

-- 12

-- Esta función le damos la frase y la clave expandidad (con la longitud de la frase), devuelve el cifrado vigenere 
cifrarConClaveExpandida :: String -> String -> String
cifrarConClaveExpandida [] _ = []
cifrarConClaveExpandida l e = (desplazar (head l) (ord (head (e)) - 97)) : (cifrarConClaveExpandida (tail l) (tail e))


cifrarVigenere :: String -> String -> String
cifrarVigenere l c  = cifrarConClaveExpandida l (expandirClave c (length l))

-- 13

descifrarConClaveExpandida :: String -> String -> String
descifrarConClaveExpandida [] _ = []
descifrarConClaveExpandida l e = (desplazar (head l) (-(ord (head (e)) - 97))) : (descifrarConClaveExpandida (tail l) (tail e))


descifrarVigenere :: String -> String -> String
descifrarVigenere p c = descifrarConClaveExpandida p (expandirClave c (length p))


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
peorCifrado l s | length s == 1 = head(s)
                | (distanciaEntreSecuencias l (head(muchosCifradosVig l s))) <= distanciaEntreSecuencias l (head(tail (muchosCifradosVig l s))) = peorCifrado l (head s:tail(tail s))
                | otherwise = peorCifrado l (tail s)


--15

esCifradoDeHead :: [String] -> [String] -> String -> [(String, String)]
esCifradoDeHead _ [] _ = []
esCifradoDeHead (m:ms) (c:cs) cifrado | cifrarVigenere m c == cifrado = [(m, c)]
                                    | otherwise = esCifradoDeHead (m:ms) cs cifrado
 


generarCombinaciones :: [String] -> [String] -> String -> [(String, String)]
generarCombinaciones [] _ _ = []
generarCombinaciones _ [] _ = []
generarCombinaciones (m:ms) (c:cs) cifrado = (esCifradoDeHead (m:ms) (c:cs) cifrado) ++ generarCombinaciones ms (c:cs) cifrado

 
combinacionesVigenere :: [String] -> [String] -> String -> [(String, String)]
combinacionesVigenere msjs claves cifrado = generarCombinaciones msjs claves cifrado

--FIN