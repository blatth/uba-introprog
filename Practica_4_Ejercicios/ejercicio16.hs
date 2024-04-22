menorDivisorP :: Integer -> Integer -> Integer
menorDivisorP a b | mod a b == 0 = b
                  | otherwise = menorDivisorP a (b+1)

menorDivisor :: Integer -> Integer
menorDivisor n = menorDivisorP n 2

esPrimo:: Integer -> Bool
esPrimo n | menorDivisor n == n = True
          | otherwise = False  

-- Algoritmo de Euclides (mcd = mínimo común divisor):

mcd :: Integer -> Integer -> Integer
mcd a 0 = a -- caso base
mcd a b = mcd b (rem a b) 
{- recursión: cuando queda a=n b=1, asegura que luego devuelve un b=0, por lo que va al caso base y mcd devuelve 'a'. para este ejemplo, el cb no se usa para nada, simplemente para asegurar la recursión -}

sonCoprimos:: Integer -> Integer -> Bool
sonCoprimos x y | mcd x y == 1 = True
                | otherwise = False

proximoPrimo:: Integer -> Integer
proximoPrimo n | esPrimo (n+1) = n+1
               | otherwise = proximoPrimo(n+1) {- recursión: con 2 cae en la primera op => devuelve 3. con 3 cae en la segunda, entonces hace 3+1=4 y vuelve a esPrimo. cuando vuelve, chequea que esPrimo(5) sea True; lo es => devuelve 5 (que sería n+1). pero con 4 cae devuelta en 5: no entiendo qué hace la función de abajo para que devuelva el nEsimoPrimo correcto -}

nEsimoPrimo:: Integer -> Integer
nEsimoPrimo 1 = 2
nEsimoPrimo n = proximoPrimo(nEsimoPrimo(n-1))

-- ^ preguntar cómo funciona esto
