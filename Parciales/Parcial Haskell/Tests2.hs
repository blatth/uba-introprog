import Test.HUnit
import Parcial1B_2C2023

main = runTestTT tests

-- "nombre" ~: (funcion parametros) ~?= resultado_esperado

tests = test [
    "atajaronSuplentes" ~: atajaronSuplentes [("River","Armani"),("Boca","Romero")] [11, 20] 150 ~?= 119,
    "equiposValidos: caso base" ~: equiposValidos [] ~?= True,
    "equiposValidos: caso recursivo" ~: equiposValidos [("River","Armani"),("Boca","Romero"),("Racing","Arroyo")] ~?= True,
    "equiposValidos: caso recursivo" ~: equiposValidos [("River","Armani"),("Boca","Romero"),("Boca","Arroyo")] ~?= False,
    "equiposValidos: caso recursivo" ~: equiposValidos [("River","Armani"),("Boca","Romero"),("Racing","Romero")] ~?= False,
    "porcentajeDeGoles" ~: porcentajeDeGoles "Romero" [("River","Armani"),("Boca","Romero")] [11, 20] ~?= 64.51613,
    "vallaMenosVencida: caso base" ~: vallaMenosVencida [("River","Armani")] [11, 20] ~?= "Armani",
    "vallaMenosVencida: caso recursivo" ~: vallaMenosVencida [("River","Armani"),("Boca","Romero")] [11, 20] ~?= "Armani"
  ]