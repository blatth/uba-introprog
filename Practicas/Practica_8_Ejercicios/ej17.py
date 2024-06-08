from queue import Queue as Cola
import random

def n_pacientes_urgentes(cola:Cola[(int, str, str)]) -> int: # cola es in, así que voy a tener que generar una aux para no modificarla
    contador:int=0
    cola_aux:Cola[(int, str, str)]=Cola()
    while not cola.empty():
        paciente:(int, str, str)=cola.get()
        cola_aux.put(paciente) # paso cada paciente a la cola auxiliar
        if paciente[0] in [1,2,3]:
            contador+=1
    while not cola_aux.empty():
        paciente:(int, str, str)=cola_aux.get()
        cola.put(paciente) # paso cada paciente de colaAux a la cola inicial
    return contador

cola=Cola()
cola.put((1,'Franco','obs'))
cola.put((1,'Julieta','obs'))
cola.put((5,'Luciana','obs'))
cola.put((3,'Micaela','obs'))
print(n_pacientes_urgentes(cola))
