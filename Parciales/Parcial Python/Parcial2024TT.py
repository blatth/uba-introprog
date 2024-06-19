# 1

def stock_productos(stock_cambios: list[tuple[str, int]]) -> dict[str, tuple[int, int]]:
    resultado = {}

    for nombre, cantidad in stock_cambios:
        if nombre in resultado:
            min_cantidad, max_cantidad = resultado[nombre] # hago que el primer elem de la tupla que es valor sea min_c y el segundo max_c y que ambos tengan el valor de la cantidad ya cargada
            if cantidad < min_cantidad: # comparo las cantidades de acuerdo a lo que va ingresando
                min_cantidad = cantidad
            if cantidad > max_cantidad:
                max_cantidad = cantidad
            resultado[nombre] = (min_cantidad, max_cantidad)

        else:
            resultado[nombre] = (cantidad, cantidad)
    return resultado

stock_cambios = [("producto1", 5), ("producto2", 3), ("producto1", 2), ("producto2", 8)]
print(stock_productos(stock_cambios)) # -> {'producto1': (2, 5), 'producto2': (3, 8)}

# 2

def es_primo(numero: int) -> bool:
    es_primo = True

    if numero < 2:
        es_primo = False

    for i in range(2, numero):
        if numero % i == 0:
            return False
        
    return es_primo

def filtrar_codigos_primos(codigos_barra: list[int]) -> list[int]:
    resultado = []

    for codigo in codigos_barra:
        ultimos_tres = codigo % 1000
        if es_primo(ultimos_tres):
            resultado.append(codigo)
    return resultado

codigos_barra = [321101, 7457202, 865307, 8658404, 747003]
print(filtrar_codigos_primos(codigos_barra)) # -> [321101, 865307, 747003]
print(es_primo(404))

# 3

def subsecuencia_mas_larga(tipos_pacientes_atendidos: list[str]) -> int:
    max_longitud = 0
    max_indice = 0
    longitud_actual = 0
    indice_actual = 0

    for i in range(len(tipos_pacientes_atendidos)):
        if tipos_pacientes_atendidos[i] == "perro" or tipos_pacientes_atendidos[i] == "gato":
            if longitud_actual == 0:
                indice_actual = i 
            longitud_actual += 1 
            if longitud_actual > max_longitud:
                max_longitud = longitud_actual
                max_indice = indice_actual

        else:
            longitud_actual = 0

    return max_indice

tipos_pacientes_atendidos = ["ave", "perro", "gato", "perro", "ave", "gato", "gato", "perro", "gato", "perro", "perro"]
print(subsecuencia_mas_larga(tipos_pacientes_atendidos)) # -> i = 4

# 4

def una_responsable_por_turno_en_grilla(grilla_horaria: list[list[str]]) -> list[tuple[bool, bool]]:
    resultado = []

    for i_columna in range(len(grilla_horaria[0])):
        maniana_continua = True
        tarde_continua = True
        
        for i_fila in range(1, 4):  # turnos de la mañana (índices: 0, 1, 2, 3)
            if maniana_continua and grilla_horaria[i_fila][i_columna] != grilla_horaria[0][i_columna]:
                maniana_continua = False
        
        for j_fila in range(5, 8):  # turnos de la tarde (índices: 4, 5, 6, 7)
            if tarde_continua and grilla_horaria[j_fila][i_columna] != grilla_horaria[4][i_columna]:
                tarde_continua = False
        
        resultado.append((maniana_continua, tarde_continua))

    return resultado
        

grilla_horaria = [ # Turno mañana
                  ["Ana", "Ana", "Ana", "Ana", "Carlos", "Carlos", "Carlos", "Carlos"], # i_fila = 0 -> todos comparan con este
                  ["Ana", "Ana", "Ana", "Pedro", "Carlos", "Carlos", "Pedro", "Carlos"], # i_fila = 1
                  ["Ana", "Ana", "Ana", "Pedro", "Carlos", "Carlos", "Pedro", "Carlos"], # i_fila = 2
                  ["Ana", "Ana", "Ana", "Pedro", "Carlos", "Carlos", "Pedro", "Carlos"], # i_fila = 3
                  # Turno tarde
                  ["Ana", "Ana", "Ana", "Pedro", "Carlos", "Carlos", "Pedro", "Carlos"], # i_fila = 4 -> todos comparan con este
                  ["Ana", "Ana", "Ana", "Pedro", "Carlos", "Carlos", "Pedro", "Carlos"], # i_fila = 5
                  ["Ana", "Ana", "Ana", "Pedro", "Carlos", "Carlos", "Pedro", "Carlos"], # i_fila = 6
                  ["Ana", "Ana", "Ana", "Pedro", "Carlos", "Carlos", "Ana", "Carlos"]] # i_fila = 7

print(una_responsable_por_turno_en_grilla(grilla_horaria)) # -> [(True, True), (True, True), (True, True), (False, True), (True, True), (True, True), (False, False), (True, True)]

    