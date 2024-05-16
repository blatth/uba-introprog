import math

# Archivo de imprimir_hola_mundo con boludeces

# Ej 1: Hola mundo

def operaciones_matematicas():
    print("Operaciones matemáticas")
operaciones_matematicas()

def suma(x: int, y: int) -> int:
    res: int = x + y
    return res

def mult(x: float, y:float) -> float:
    res: float = x*y
    return res

def dvs(x: float, y:float) -> float:
    res: float = x/y
    return res

#Ej 1.5: 

def perimetro() -> float:
    return 2*math.pi
print(perimetro())