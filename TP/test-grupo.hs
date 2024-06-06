import Test.HUnit
import Solucion
import Data.List

runGrupoTests = runTestTT tests

tests = test [
    -- esMinuscula
    "esMinuscula: ñ" ~: esMinuscula 'ñ' ~?= False,
    "esMinuscula: á" ~: esMinuscula 'á' ~?= False,
    "esMinuscula: A" ~: esMinuscula 'á' ~?= False,
    "esMinuscula: Á" ~: esMinuscula 'Á' ~?= False,
    "esMinuscula: 6" ~: esMinuscula '6' ~?= False,
    "esMinuscula: espacio" ~: esMinuscula ' ' ~?= False,
    "esMinuscula: a" ~: esMinuscula 'a' ~?= True,
    "esMinuscula: z" ~: esMinuscula 'z' ~?= True,
    -- letraANatural
    "letraANatural: a" ~: letraANatural 'a' ~?= 0,
    "letraANatural: z" ~: letraANatural 'z' ~?= 25,
    -- desplazar
    "desplazar: a 3" ~: desplazar 'a' 3 ~?= 'd',
    "desplazar: z 3" ~: desplazar 'z' 3 ~?= 'c',
    "desplazar: a 1" ~: desplazar 'a' 1 ~?= 'b',
    "desplazar: z 1" ~: desplazar 'z' 1 ~?= 'a',
    "desplazar: Z 3" ~: desplazar 'Z' 3 ~?= 'Z',
    "desplazar: a -3" ~: desplazar 'a' (-3) ~?= 'x',
    "desplazar: z -3" ~: desplazar 'z' (-3) ~?= 'w',
    "desplazar: a -1" ~: desplazar 'a' (-1) ~?= 'z',
    "desplazar: z -1" ~: desplazar 'z' (-1) ~?= 'y',
    "desplazar: Z -3" ~: desplazar 'Z' (-3) ~?= 'Z',
    "desplazar: z 0" ~: desplazar 'z' 0 ~?= 'z',
    "desplazar: 6 1" ~: desplazar '6' 1 ~?= '6',
    "desplazar: a 1200" ~: desplazar 'a' 1200 ~?= 'e',
    -- cifrar
    "cifrar: primeraMayus+a+z" ~: cifrar "Holaz" 3 ~?= "Hrodc",
    "cifrar: mayus" ~: cifrar "HOLA" 3 ~?= "HOLA",
    "cifrar: espacio+primeraMayus" ~: cifrar "Hola Como Estas" 3 ~?= "Hrod Crpr Evwdv",
    "cifrar: espacio" ~: cifrar "hola como estas" 3 ~?= "krod frpr hvwdv",
    "cifrar: mayusIntercalada" ~: cifrar "ASJjhjkghAKJGHKFjkhgjk" 3 ~?= "ASJmkmnjkAKJGHKFmnkjmn",
    "cifrar: mayusIntercalada29" ~: cifrar "ASJjhjkghAKJGHKFjkhgjk" 29 ~?= "ASJmkmnjkAKJGHKFmnkjmn",
    "cifrar: mayusIntercalada0" ~: cifrar "ASJjhjkghAKJGHKFjkhgjk" 0 ~?= "ASJjhjkghAKJGHKFjkhgjk",
    "cifrar: mayusIntercalada25" ~: cifrar "ASJmmmASHGAm" 25 ~?= "ASJlllASHGAl",
    -- descifrar
    "descifrar: primeramayus+a+z" ~: descifrar "Hrodc" 3 ~?= "Holaz",
    "descifrar: mayus" ~: descifrar "HOLA" 3 ~?= "HOLA",
    "descifrar: espacio+primeraMayus" ~: descifrar "Hrod Crpr Evwdv" 3 ~?= "Hola Como Estas",
    "descifrar: espacio" ~: descifrar "krod frpr hvwdv" 3 ~?= "hola como estas",
    "descifrar: mayusIntercalada" ~: descifrar "ASJmkmnjkAKJGHKFmnkjmn" 3 ~?= "ASJjhjkghAKJGHKFjkhgjk",
    "descifrar: mayusIntercalada29" ~: descifrar "ASJmkmnjkAKJGHKFmnkjmn" 29 ~?= "ASJjhjkghAKJGHKFjkhgjk",
    "descifrar: mayusIntercalada0" ~: descifrar "ASJmkmnjkAKJGHKFmnkjmn" 0 ~?= "ASJmkmnjkAKJGHKFmnkjmn",
    "descifrar: espaciosolo" ~: descifrar " " 1830 ~?= " ",
    "descifrar: vacio" ~: descifrar "" 1830 ~?= "",   
    --cifrarLista
    "crifrarLista: primeraMayus+a+z" ~: cifrarLista ["Compu", "Intro", "IaP", "Algoritmoz"] ~?= ["Compu","Iousp","IcP","Aojrulwprc"],
    "crifrarLista: mayus" ~: cifrarLista ["COMPU", "INTRO", "IAP", "ALGORITMOZ"] ~?= ["COMPU","INTRO","IAP","ALGORITMOZ"],
    "crifrarLista: espacio+primeraMayus" ~: cifrarLista ["Com pu", "In tro", "IaP", "Alg or itm oz"] ~?= ["Com pu","Io usp","IcP","Aoj ru lwp rc"],
    "crifrarLista: espacio" ~: cifrarLista ["com pu", "in tro", "iap", "alg or itm oz"] ~?= ["com pu","jo usp","kcr","doj ru lwp rc"],
    "crifrarLista: espacio+mayusIntercalada" ~: cifrarLista ["coM pu", "iN tRo", "iAp", "aLg or iTm Oz"] ~?= ["coM pu","jN uRp","kAr","dLj ru lTp Oc"],
    "crifrarLista: vacio" ~: cifrarLista [] ~?= [],
    -- frecuencia
    "frecuencia: primeraMayus" ~: frecuencia "Algoritmo" ~?= [0.0,0.0,0.0,0.0,0.0,0.0,12.5,0.0,12.5,0.0,0.0,12.5,12.5,0.0,25.0,0.0,0.0,12.5,0.0,12.5,0.0,0.0,0.0,0.0,0.0,0.0],
    "frecuencia: mayus" ~: frecuencia "ALGORITMO" ~?= [0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0],
    "frecuencia: abecedario" ~: frecuencia "abcdefghijklmnopqrstuvwxyz" ~?= [3.8461537,3.8461537,3.8461537,3.8461537,3.8461537,3.8461537,3.8461537,3.8461537,3.8461537,3.8461537,3.8461537,3.8461537,3.8461537,3.8461537,3.8461537,3.8461537,3.8461537,3.8461537,3.8461537,3.8461537,3.8461537,3.8461537,3.8461537,3.8461537,3.8461537,3.8461537],
    "frecuencia: mayusIntercalada" ~: frecuencia "ASJmkmnjkAKJGHKFmnkjmn" ~?= [0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,16.666666,25.0,0.0,33.333332,25.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0],
    "frecuencia: espacio+mayusIntercalada" ~: frecuencia "ASJmkmn jkAKJG HKFmnkjmn" ~?= [0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,16.666666,25.0,0.0,33.333332,25.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0],
    "frecuencia: espacio" ~: frecuencia " " ~?=[0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0],
    "frecuencia: vacio" ~: frecuencia "" ~?=[0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0],
    -- cifradoMasFrecuente
    "cifradoMasFrecuente: COMPu 3" ~: cifradoMasFrecuente "COMPu" 3 ~?= ('x',100.0),
    "cifradoMasFrecuente: mayusIntercalada 3" ~: cifradoMasFrecuente "ASJmkmnjkAKJGHKFmnkjmn" 3 ~?= ('p',33.333336),
    "cifradoMasFrecuente: espacio+mayusIntercalada 3" ~: cifradoMasFrecuente "ASJmkmn jkAKJGHK Fmnkjmn" 3 ~?= ('p',33.333336),
    "cifradoMasFrecuente: min 3" ~: cifradoMasFrecuente "compu" 3 ~?= ('f',20.0),
    "cifradoMasFrecuente: z 3" ~: cifradoMasFrecuente "zzzzzzzeafzz" 1 ~?= ('a',75.0),
    "cifradoMasFrecuente: COMPu -3" ~: cifradoMasFrecuente "COMPu" (-3) ~?= ('r',100.0),
    "cifradoMasFrecuente: mayusIntercalada -3" ~: cifradoMasFrecuente "ASJmkmnjkAKJGHKFmnkjmn" (-3) ~?= ('j',33.333336),
    "cifradoMasFrecuente: espacio+mayusIntercalada 3" ~: cifradoMasFrecuente "ASJmkmn jkAKJGHK Fmnkjmn" (-3) ~?= ('j',33.333336),
    "cifradoMasFrecuente: min -3" ~: cifradoMasFrecuente "compu" (-3) ~?= ('z',20.0),
    "cifradoMasFrecuente: a -3" ~: cifradoMasFrecuente "aaaaaaaezfaa" (-1) ~?= ('z',75.0),
    "cifradoMasFrecuente: mayusIntercalada 29" ~: cifradoMasFrecuente "ASJmkmnjkAKJGHKFmnkjmn" 29 ~?= ('p',33.333336),
    "cifradoMasFrecuente: mayusIntercalada 25" ~: cifradoMasFrecuente "ASJmmmASHGAm" 25 ~?= ('l',100.0),
    "cifradoMasFrecuente: soloMinuscula 235" ~: cifradoMasFrecuente "e" 235 ~?= ('e',100.0),
    -- esDescifrado
    "esDescifrado: mayus cualquiercosa " ~: esDescifrado "COMPU" "algoritmo" ~?= False,
    "esDescifrado: min min f " ~: esDescifrado "compu" "algoritmo" ~?= False,
    "esDescifrado: min5 min5 f" ~: esDescifrado "compu" "ritmo" ~?= False,
    "esDescifrado: min min t" ~: esDescifrado "compu" "frpsx" ~?= True,
    "esDescifrado: permutacion t " ~: esDescifrado "frpsx" "compu" ~?= True,
    "esDescifrado: iguales " ~: esDescifrado "compu" "compu" ~?= True,
    "esDescifrado: rtacifrarcon25 " ~: esDescifrado "compu" "bnlot" ~?= True,
    "esDescifrado: 1letra " ~: esDescifrado "c" "h" ~?= True,
    "esDescifrado: 1min 1mayusc " ~: esDescifrado "c" "H" ~?= False,
    "esDescifrado: 1mayusc 1mayusc " ~: esDescifrado "C" "H" ~?= False,
    -- todosLosDescifrados 
    "todosLosDescifrados: vacio " ~: todosLosDescifrados [] ~?= [],
    "todosLosDescifrados: compu bnlot " ~: expectPermutacion (todosLosDescifrados ["compu", "bnlot"]) [("bnlot", "compu"), ("compu", "bnlot")],
    "todosLosDescifrados: compu bnLot " ~: todosLosDescifrados ["compu", "bnLot"] ~?= [],
    "todosLosDescifrados: COMPU bnlot dpnqv " ~: expectPermutacion (todosLosDescifrados ["COMPU", "bnlot", "dpnqv"]) [("dpnqv", "bnlot"), ("bnlot", "dpnqv")],
    "todosLosDescifrados: compu bnlot dpnqv " ~: expectPermutacion (todosLosDescifrados ["compu", "bnlot", "dpnqv"]) [("bnlot", "compu"), ("compu", "bnlot"), ("dpnqv", "compu"), ("compu", "dpnqv"), ("dpnqv","bnlot"), ("bnlot","dpnqv")],
    "todosLosDescifrados: sin cifrados " ~: todosLosDescifrados ["compu", "abcde"] ~?= [],
    "todosLosDescifrados: test catedra " ~: expectPermutacion (todosLosDescifrados ["compu", "frpsx", "mywza"]) [("compu", "frpsx"), ("frpsx", "compu")],
    "todosLosDescifrados: test catedra + otros tamaños " ~: expectPermutacion (todosLosDescifrados ["compu", "frpsx", "mywza","hola como va"]) [("compu", "frpsx"), ("frpsx", "compu")],
    -- expandirClave
    "expandirClave: a 1 " ~: expandirClave "a" 1 ~?= "a",
    "expandirClave: a 4 " ~: expandirClave "a" 4 ~?= "aaaa",
    "expandirClave: hola 2 " ~: expandirClave "hola" 2 ~?= "ho",
    "expandirClave: compu 8 " ~: expandirClave "compu" 8 ~?= "compucom",
    -- cifrarVigenere
    "cifrarVigenere: test catedra " ~: cifrarVigenere "computacion" "ip" ~?= "kdueciirqdv",
    "cifrarVigenere: vacio ip " ~: cifrarVigenere "" "ip" ~?= "",
    "cifrarVigenere: espacio clave " ~: cifrarVigenere " " "clave" ~?= " ",
    "cifrarVigenere: MAYUS clave " ~: cifrarVigenere "MAYUS" "clave" ~?= "MAYUS",
    "cifrarVigenere: HoLa ip " ~: cifrarVigenere "HoLa" "ip" ~?= "HdLp",
    "cifrarVigenere: compu tacion " ~: cifrarVigenere "compu" "tacion" ~?= "vooxi",
    "cifrarVigenere: hola que tal compu " ~: cifrarVigenere "hola que tal" "compu" ~?= "jcxp siq ncz",
    -- descifrarVigenere
    "descifrarVigenere: test catedra " ~: descifrarVigenere "kdueciirqdv" "ip" ~?= "computacion",
    "descifrarVigenere: vacio clave " ~: descifrarVigenere "" "clave" ~?= "",
    "descifrarVigenere: espacio clave " ~: descifrarVigenere " " "clave" ~?= " ",
    "descifrarVigenere: MAYUS clave " ~: descifrarVigenere "MAYUS" "clave" ~?= "MAYUS",
    "descifrarVigenere: MiXtO clave " ~: descifrarVigenere "MiXtO" "clave" ~?= "MxXyO",
    "descifrarVigenere: jcxp siq ncz compu " ~: descifrarVigenere "jcxp siq ncz" "compu" ~?= "hola que tal",
    "descifrarVigenere: introduccion a la computacion " ~: descifrarVigenere "kbfgifiorcqb p no elqudpgcqudh" "compu" ~?= "introduccion a la programacion",
    --peor descifrado
    "peorCifrado: test catedra " ~: peorCifrado "computacion" ["ip", "asdef", "ksy"] ~?= "asdef",
    "peorCifrado: abecedario" ~: peorCifrado "abcdefghijklmnopqrstuvwxyz" ["perro", "tomate", "llave", "murcielago"]  ~?= "llave",
    "peorCifrado: mismo distancia" ~: expectAny (peorCifrado "fgh" ["e", "z", "r", "b"]) ["z", "b"],
    "peorCifrado: repetido ok " ~: peorCifrado "computacion" ["ip", "asdef", "ksy","asdef"] ~?= "asdef",
    "peorCifrado: repetido no ok " ~: peorCifrado "computacion" ["ip", "asdef", "ksy", "ip"] ~?= "asdef",
    --combinaciones de vigenere
    "combinacionesVigenere: test catedra " ~: combinacionesVigenere ["hola", "mundo"] ["a", "b"] "ipmb" ~?= [("hola", "b")] ,
    "combinacionesVigenere: rta vacia " ~: combinacionesVigenere ["hola", "mundo"] ["a", "b"] "irty" ~?= [] ,
    "combinacionesVigenere: msje con vacio " ~: combinacionesVigenere ["hola", "mundo", ""] ["a", "b", "c"] "ipmb" ~?= [("hola", "b")] ,
    "combinacionesVigenere: msje con mayusc" ~: combinacionesVigenere ["hoLa", "munDo", ""] ["a", "b", "c"] "ipLb" ~?= [("hoLa", "b")] ,
    "combinacionesVigenere: msje con espacios" ~: combinacionesVigenere ["hoLa como", "munDo martavilloso", ""] ["abc", "rta", "cda"] "yhLr cffo" ~?= [("hoLa como", "rta")] ,
    "combinacionesVigenere: claves dist tamaño" ~: combinacionesVigenere ["hola como va", "mundo maravilloso", ""] ["perro", "gato", "murcielago"] "ticc gzmu hu" ~?= [("hola como va", "murcielago")] ,
    "combinacionesVigenere: claves mayores msjs" ~: combinacionesVigenere ["hola", "como", "va"] ["trigonometria", "computacion", "murcielago"] "oidq" ~?= [("como", "murcielago")] ,
    "combinacionesVigenere: dos correctas" ~: expectPermutacion (combinacionesVigenere ["fgh", "ghi", "va"] ["r", "q", "tyuer"] "wxy") [("fgh","r"),("ghi","q")] 
    
    ]

-- runGrupoTests para correrlo en terminal
-- min = minúscula

-- margetFloat(): Float
-- asegura: res es igual a 0.00001
margenFloat = 0.00001

-- expectAny (actual: a, expected: [a]): Test
-- asegura: res es un Test Verdadero si y sólo si actual pertenece a la lista expected
expectAny :: (Foldable t, Eq a, Show a, Show (t a)) => a -> t a -> Test
expectAny actual expected = elem actual expected ~? ("expected any of: " ++ show expected ++ "\n but got: " ++ show actual)


-- expectlistProximity (actual: [Float], expected: [Float]): Test
-- asegura: res es un Test Verdadero si y sólo si:
--                  |actual| = |expected|
--                  para todo i entero tal que 0<=i<|actual|, |actual[i] - expected[i]| < margenFloat()
expectlistProximity:: [Float] -> [Float] -> Test
expectlistProximity actual expected = esParecidoLista actual expected ~? ("expected list: " ++ show expected ++ "\nbut got: " ++ show actual)

esParecidoLista :: [Float] -> [Float] -> Bool
esParecidoLista actual expected = (length actual) == (length expected) && (esParecidoUnaAUno actual expected)

esParecidoUnaAUno :: [Float] -> [Float] -> Bool
esParecidoUnaAUno [] [] = True
esParecidoUnaAUno (x:xs) (y:ys) = (aproximado x y) && (esParecidoUnaAUno xs ys)

aproximado :: Float -> Float -> Bool
aproximado x y = abs (x - y) < margenFloat

-- expectAnyTuplaAprox (actual: CharxFloat, expected: [CharxFloat]): Test
-- asegura: res un Test Verdadero si y sólo si:
--                  para algun i entero tal que 0<=i<|expected|,
--                         (fst expected[i]) == (fst actual) && |(snd expected[i]) - (snd actual)| < margenFloat()

expectAnyTuplaAprox :: (Char, Float) -> [(Char, Float)] -> Test
expectAnyTuplaAprox actual expected = elemAproxTupla actual expected ~? ("expected any of: " ++ show expected ++ "\nbut got: " ++ show actual)

elemAproxTupla :: (Char, Float) -> [(Char, Float)] -> Bool
elemAproxTupla _ [] = False
elemAproxTupla (ac,af) ((bc,bf):bs) = sonAprox || (elemAproxTupla (ac,af) bs)
    where sonAprox = (ac == bc) && (aproximado af bf)


-- expectPermutacion (actual: [T], expected[T]) : Test
-- asegura: res es un Test Verdadero si y sólo si:
--            para todo elemento e de tipo T, #Apariciones(actual, e) = #Apariciones(expected, e)

expectPermutacion :: (Ord a, Show a) => [a] -> [a] -> Test
expectPermutacion actual expected = esPermutacion actual expected ~? ("expected list: " ++ show expected ++ "\nbut got: " ++ show actual)

esPermutacion :: Ord a => [a] -> [a] -> Bool
esPermutacion a b = (length a == length b) && (sort a == sort b)