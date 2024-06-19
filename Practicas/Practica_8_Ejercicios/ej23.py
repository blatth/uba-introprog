inventario: dict[str, dict[str, float, str, int]] = {}

def agregarProducto(inventario: dict[str, dict[str, float, str, int]], nombre:str, precio:float, cantidad:int) -> None: 
    if not nombre in inventario: # se fija que la clave, con ese nombre de producto, no esté registrado en el inventario anteriormente
        inventario[nombre] = { # agrego el producto como clave y, como un nuevo diccionario, su precio y cantidad 
            "Precio": precio,
            "Cantidad": cantidad
        }

#   return inventario -> acá el return no hace falta

def actualizarStock(inventario:dict[str, dict[str, float, str, int]], nombre:str, cantidad:int) -> None:
    if nombre in inventario:
        inventario[nombre]["Cantidad"] = cantidad

    #   return inventario -> acá el return no hace falta
    else:
        print("El producto no está en el inventario")

def actualizarPrecios(inventario:dict[str, dict[str, float, str, int]], nombre:str, precio:float) -> None:
    if nombre in inventario:
        inventario[nombre]["Precio"] = precio

    #   return inventario -> acá el return no hace falta 
    else:
        print("El producto no está en el inventario") 

def calcularValorInventario(inventario:dict[str, dict[str, float, str, int]]) -> float:
    res:float = 0.0
    for producto in inventario.values():
        res += producto["Cantidad"] * producto["Precio"]
    
    return res

agregarProducto(inventario, "Camisa", 20.0, 50)
agregarProducto(inventario, "Pantalon", 30.0, 30)
actualizarStock(inventario, "Camisa", 10)

print("Valor total del inventario:", calcularValorInventario(inventario))