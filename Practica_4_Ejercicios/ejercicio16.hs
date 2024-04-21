menorDivisorP :: Integer -> Integer -> Integer
menorDivisorP a b | mod a b == 0 = b
                  | otherwise = menorDivisorP a (b+1)

menorDivisor :: Integer -> Integer
menorDivisor n = menorDivisorP n 2

esPrimo:: Integer -> Bool
esPrimo n | menorDivisor n == n = True
          | otherwise = False  

sonCoprimos:: Integer -> Integer -> Bool
sonCoprimos 