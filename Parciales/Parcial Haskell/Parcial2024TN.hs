{-

La Unidad de Tecnologías de la Información (UTI) de nuestra Facultad nos ha encargado que desarrollemos un nuevo sistema para el registro de alumnos. En este sistema se guarda la información de cada alumno, que está representada como una tupla de dos elementos: el primero es el nombre completo del alumno y el segundo una lista con las notas de los finales que rindió.

Para implementar este sistema nos enviaron las siguientes especificaciones y nos pidieron que hagamos el desarrollo enteramente en Haskell, utilizando los tipos requeridos y solamente las funciones que se ven en la materia Introducción a la Programación / Algoritmos y Estructuras de Datos I (FCEyN-UBA).
Ejercicio 1 (2 puntos)

problema aproboMasDeNMaterias (registro: seq⟨seq⟨Char⟩ x seq⟨Z⟩⟩, alumno:seq⟨Char⟩, n: Z) : Bool {
  requiere: {No hay nombres de alumnos repetidos en registro}
  requiere: {Las notas de registro son todas iguales o mayores a cero y menores o iguales a 10}
  requiere: {n > 0}
  requiere: {El alumno se encuentra en el registro }
  asegura: {res = true <=> el alumno tiene más de n notas de finales mayores o iguales a 4 en el registro}
}
Ejercicio 2 (2 puntos)

problema buenosAlumnos (registro: seq⟨seq⟨Char⟩ x seq⟨Z⟩⟩) : seq⟨seq⟨Char⟩⟩ {
  requiere: {No hay nombres de alumnos repetidos en registro}
  requiere: {Las notas de registro son todas iguales o mayores a cero y menores o iguales a 10}
  asegura: {res es la lista de los nombres de los alumnos que están en registro cuyo promedio de notas es mayor o igual a 8 y no tiene aplazos (notas menores que 4)}
}
Para resolver el promedio pueden utilizar la función del Preludio de Haskell fromIntegral que dado un valor de tipo Int devuelve su equivalente de tipo Float.
Ejercicio 3 (2 puntos)

problema mejorPromedio (registro: seq⟨seq⟨Char⟩ x seq⟨Z⟩⟩) : seq⟨Char⟩ {
  requiere: {No hay nombres de alumnos repetidos en registro}
  requiere: {Las notas de registro son todas iguales o mayores a cero y menores o iguales a 10}
  requiere: {|registro| > 0 }
  asegura: {res es el nombre del alumno cuyo promedio de notas es el más alto; si hay más de un alumno con el mismo promedio de notas, devuelve el nombre de alumno que aparece primero en registro}
}
Ejercicio 4 (3 puntos)

problema seGraduoConHonores (registro: seq⟨seq⟨Char⟩ x seq⟨Z⟩⟩, cantidadDeMateriasDeLaCarrera: Z, alumno: seq⟨Char⟩ ) : Bool {
  requiere: {No hay nombres de alumnos repetidos en registro}
  requiere: {Las notas de registro son todas iguales o mayores a cero y menores o iguales a 10}
  requiere: {cantidadDeMateriasDeLaCarrera > 0}
  requiere: {El alumno se encuentra en el registro }
  requiere: {|buenosAlumnos(registro)| > 0}
  asegura: {res <=> true si aproboMasDeNMaterias(registro, alumno, cantidadDeMateriasDeLaCarrera -1) = true y alumno pertenece al conjunto de buenosAlumnos(registro) y el promedio de notas de finales de alumno está a menos (estrictamente) de 1 punto del mejorPromedio(registro)}
}

Ejercicio 5 (1 punto)

Conteste marcando la opción correcta. El Testing es una técnica de verificación que sirve para:
- Demostrar que un programa es correcto.
- Probar propiedades de un programa.
- Encontrar fallas en un programa.

-}

{-

Parcial - tema2

Nota: 9.5 / 10.0 (APROBADO)

puntaje ej1: 2
puntaje ej2: 2
puntaje ej3: 2
puntaje ej4: 2.5 -> En este ejercicio hay un error que no corregí
puntaje ej5: 1

-}

-- Ejercicio 1

aproboMasDeNMaterias :: [(String, [Int])] -> String -> Int -> Bool
aproboMasDeNMaterias (x:xs) a n | n < cuantasMateriasAprobo (notasDelAlumno (x:xs) a) = True
                                | otherwise = False

cuantasMateriasAprobo:: [Int] -> Int
cuantasMateriasAprobo [] = 0
cuantasMateriasAprobo (x:xs) | x >= 4 = 1 + cuantasMateriasAprobo xs
                             | otherwise = cuantasMateriasAprobo xs

notasDelAlumno:: [(String, [Int])] -> String -> [Int]
notasDelAlumno (x:xs) a = snd (encontrarAlumno (x:xs) a)

encontrarAlumno:: [(String, [Int])] -> String -> (String, [Int])
encontrarAlumno [x] a = x
encontrarAlumno ((x1, x2):xs) a | a == x1 = (x1, x2)
                                | otherwise = encontrarAlumno xs a

-- Ejercicio 2

pertenece:: (Eq t) => t -> [t] -> Bool
pertenece x [] = False
pertenece x (y:ys) | x == y = True 
                   | otherwise = pertenece x ys

contarNotas::  [Int] -> Int
contarNotas [] = 0
contarNotas (x:xs) = 1 + contarNotas xs

sumarNotas:: [Int] -> Int
sumarNotas [] = 0
sumarNotas (x:xs) = x + sumarNotas xs

promedioNotas:: [Int] -> Float
promedioNotas [] = 0
promedioNotas (x:xs) = fromIntegral(sumarNotas(x:xs)) / fromIntegral(contarNotas(x:xs))

notaDesaprobada:: [Int] -> Bool
notaDesaprobada (y:ys) | pertenece 3 (y:ys) = True
                       | pertenece 2 (y:ys) = True
                       | pertenece 1 (y:ys) = True
                       | otherwise = False

buenosAlumnos:: [(String, [Int])] -> [String]
buenosAlumnos [] = []
buenosAlumnos ((x1,x2):xs) | promedioNotas (notasDelAlumno ((x1, x2):xs) x1) >= 8.0 && notaDesaprobada (notasDelAlumno ((x1, x2):xs) x1) == False = [x1] ++ buenosAlumnos xs
                           | otherwise = buenosAlumnos xs

-- Ejercicio 3


mejorPromedio:: [(String, [Int])] -> String
mejorPromedio [x] = fst x
mejorPromedio ((x1, x2):(y1, y2):xs) | promedioNotas(notasDelAlumno ((x1, x2):(y1, y2):xs) x1) >= promedioNotas(notasDelAlumno ((x1, x2):(y1, y2):xs) y1) = mejorPromedio((x1,x2):xs)
                                     | otherwise = mejorPromedio ((y1,y2):xs)

-- Ejercicio 4
-- En este ejercicio hay un pequeño error que no está corregido


seGraduoConHonores :: [(String, [Int])] -> Int -> String -> Bool
seGraduoConHonores ((x1, x2):xs) cm a | (aproboMasDeNMaterias ((x1, x2):xs) a (cm-1)) && (pertenece a (buenosAlumnos ((x1, x2):xs))) && promedioNotas (notasDelAlumno ((x1, x2):xs) a) - promedioNotas (notasDelAlumno ((x1, x2):xs) (mejorPromedio ((x1, x2):xs))) < 1 = True    
                                     | otherwise = False
