-- En las diapos: ultimoDigito=digitoUnidades && sacarUnidades=sacarUltimoDigito

digitoUnidades:: Integer -> Integer  
digitoUnidades n = mod n 10


sacarUnidades:: Integer -> Integer
sacarUnidades n = div n 10


todosDigitosIguales:: Integer -> Bool

todosDigitosIguales n | n<10 = True
                      | otherwise = digitoUnidades n == digitoUnidades(sacarUnidades n) && todosDigitosIguales(sacarUnidades n)

-- digitoUnidades: mod 10 -> devuelve el último dígito
-- sacarUnidades: div 10 -> devuelve todos menos el último dígito

-- v Ejercicio 8

cantDigitos:: Integer -> Integer
cantDigitos n | n<10 = 1
              | otherwise = cantDigitos(sacarUnidades n) + 1

iesimoDigito:: Integer -> Integer -> Integer
iesimoDigito n i | cantDigitos(n) == i = digitoUnidades(n)
                 | otherwise = iesimoDigito(sacarUnidades(n)) i
