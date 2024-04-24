--todoMenor:: (Float, Float) -> (Float, Float) -> Bool

--todoMenor (x, y) (z, g) | x<z && y<g = True
--                        | otherwise = False

-- Otra forma (aunque la anterior también funciona, y es más adecuada):

todoMenor:: (Float, Float) -> (Float, Float) -> Bool

todoMenor v w | (fst v)<(fst w) && (snd v)<(snd w) = True
              | otherwise = False

prodInt:: (Float, Float) -> (Float, Float) -> Float

prodInt v w = ((fst v)*(snd w)) + ((fst w)*(snd v)) 

-- En parcial es mejor hacer pattern matching, o sea, el primer ejemplo hecho en comentario

distanciaPuntos:: (Float, Float) -> (Float, Float) -> Float

distanciaPuntos (x, y) (z, g) =  sqrt (((x-y)^2) + ((z-g)^2))

sumarSoloMultiplos:: Int -> Int -> Int -> Int -> Int

sumarSoloMultiplos  x y z n| mod (abs x) n == 0 && mod (abs y) n == 0 && mod (abs z) n == 0 = x + y + z
                           | mod (abs x) n /= 0 && mod (abs y) n /= 0 && mod (abs z) n == 0 = z
                           | mod (abs x) n /= 0 && mod (abs y) n == 0 && mod (abs z) n /= 0 = y
                           | mod (abs x) n == 0 && mod (abs y) n /= 0 && mod (abs z) n /= 0 = x
                           | mod (abs x) n /= 0 && mod (abs y) n /= 0 && mod (abs z) n /= 0 = 0
                           | mod (abs x) n /= 0 && mod (abs y) n == 0 && mod (abs z) n == 0 = y + z
                           | mod (abs x) n == 0 && mod (abs y) n == 0 && mod (abs z) n /= 0 = x + y
                           | mod (abs x) n == 0 && mod (abs y) n /= 0 && mod (abs z) n == 0 = x + z

-- (abs n) = devuelve el valor absoluto del término n, sin signo

posPrimerPar:: (Int, Int, Int) -> Int

posPrimerPar (x, y, z) | mod (abs x) 2 == 0 = 0
                       | mod (abs y) 2 == 0 = 1
                       | mod (abs z) 2 == 0 = 2
                       | otherwise = 4

crearPar:: a -> b -> (a, b)

crearPar a b = (a, b)

invertir:: a -> b -> (b, a)

invertir a b = (b, a)