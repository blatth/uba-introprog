inventario: dict[str, dict[str, float, str, int]] = {}


def agregar_producto(
    inventario: dict[str, dict[str, float, str, int]],
    nombre: str,
    precio: float,
    cantidad: int,
) -> None:
    info_producto: dict[str, float, str, int] = {
        "precio": precio,
        "cantidad": cantidad,
    }
    inventario[nombre] = info_producto


def actualizar_stock(
    inventario: dict[str, dict[str, float, str, int]],
    nombre: str,
    cantidad: int,
) -> None:
    inventario[nombre]["cantidad"] = cantidad


def actualizar_precios(
    inventario: dict[str, dict[str, float, str, int]],
    nombre: str,
    precio: float,
) -> None:
    inventario[nombre]["precio"] = precio


def calcular_valor_inventario(
    inventario: dict[str, dict[str, float, str, int]]
) -> float:
    res: float = 0.0
    for producto in inventario.values():
        res += producto["cantidad"] * producto["precio"]
    return res

agregar_producto(inventario, "Camisa", 20.0, 50)
agregar_producto(inventario, "Pantalon", 30.0, 30)
actualizar_stock(inventario, "Camisa", 10)

print("Valor total del inventario:", calcular_valor_inventario(inventario))