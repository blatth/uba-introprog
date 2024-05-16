# Ej 5.1

def devolver_el_doble_si_es_par(numero):
   
    res: int
    if numero%2 == 0:
        res = numero*2
    else:
        res = numero
    return res

"""
    if 2%numero == 0:
        return (numero*2)
    else:
        return numero
"""