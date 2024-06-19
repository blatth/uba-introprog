from queue import LifoQueue as Pila

def bienBalanceada(s:str) -> bool:
    p:Pila = Pila()
    res = True
    for i in range (len(s)):
        if s[i] == "(":
            p.put(s[i])
        elif s[i] == ")": 
            if not p.empty():
                p.get() 
            else: 
                return False 
    return p.empty()

print(bienBalanceada("1+(2x3-(20/5))")) # -> True
print(bienBalanceada("1+)(2x3-(20/5))")) # -> False