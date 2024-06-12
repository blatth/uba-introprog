module Solucion where

-- Ej1
aproboMasDeNMaterias :: [(String, [Int])] -> String-> Int ->Bool
aproboMasDeNMaterias ((p,notas):rs) nombre cant | p == nombre = cantidadAprobada notas > cant
                                                | otherwise = aproboMasDeNMaterias rs nombre cant


cantidadAprobada :: [Int] -> Int
cantidadAprobada [] = 0
cantidadAprobada (n:ns) | n >= 4 = 1 + cantidadAprobada ns
                        | otherwise = cantidadAprobada ns

-- Ej2

buenosAlumnos:: [(String, [Int])] -> [String]
buenosAlumnos [] = []
buenosAlumnos ((p,notas):rs) | (promedio notas >=8) && (noTieneAplazos notas) = p : pasoRecursivo
                             | otherwise = pasoRecursivo
                             where pasoRecursivo = buenosAlumnos rs

noTieneAplazos :: [Int] -> Bool
noTieneAplazos [] = True
noTieneAplazos (l:ls) = (l >= 4) && (noTieneAplazos ls)

promedio :: [Int] -> Float
promedio [] = 0
promedio ls = fromIntegral (sumatoria ls) / fromIntegral (cantidad ls)

sumatoria :: [Int] -> Int
sumatoria [] = 0
sumatoria (l:ls) = l + sumatoria ls

cantidad :: [Int] -> Int
cantidad [] = 0
cantidad (_:ls) = 1 + cantidad ls


-- Ej3
mejorPromedio::  [(String, [Int])] -> String
mejorPromedio registros = mayorPromedio (todosLosPromedios registros) (personas registros)

personas :: [(String, [Int])] -> [String]
personas [] = []
personas ((p,_):rs) = p: personas rs

todosLosPromedios :: [(String, [Int])] -> [Float]
todosLosPromedios [] = []
todosLosPromedios ((_,n):rs) = (promedio n) : todosLosPromedios rs

mayorPromedio :: [Float] -> [String] -> String
mayorPromedio [_] [p] = p
mayorPromedio (n1:n2:notas) (p1:p2:pers) | n1 >= n2 = mayorPromedio (n1:notas) (p1:pers)
                                         | otherwise = mayorPromedio (n2:notas) (p2:pers)

-- Ej4
seGraduoConHonores :: [(String, [Int])] -> Int -> String -> Bool
seGraduoConHonores registros cant estudiante = (aproboMasDeNMaterias registros estudiante (cant-1)) &&
  pertenece estudiante (buenosAlumnos registros) &&
  diferenciaDeUnoDePromedio registros estudiante

pertenece ::(Eq a) => a -> [a] -> Bool
pertenece a [] = False
pertenece a (b:bs) = a == b || pertenece a bs

diferenciaDeUnoDePromedio :: [(String, [Int])] -> String -> Bool
diferenciaDeUnoDePromedio registros estudiante = ((elPromedio -1) < promedioDeMejorPromedio) && (promedioDeMejorPromedio < (elPromedio + 1))
                                                where elPromedio = promedioDe estudiante registros
                                                      promedioDeMejorPromedio = (promedioDe (mejorPromedio registros) registros)

promedioDe :: String -> [(String, [Int])] -> Float
promedioDe nombre ((nombre1, notas):elResto) | nombre1 == nombre = promedio notas
                                             | otherwise = promedioDe nombre elResto

