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

--cifrar:: String -> Int -> String
--cifrar s n | 

-- 5



-- 7

-- frecuencia:: String -> [Float]

contar:: String -> Int
contar [] = 0
contar (x:xs) | ord x < 97 || ord x > 122 = 0 + contar xs
              | ord x >= 97 && ord x <= 122 = 1 + contar xs

