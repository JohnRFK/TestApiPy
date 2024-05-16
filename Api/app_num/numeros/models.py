from django.db import models

class ListaNumeros:
    def __init__(self):
        self.numeros = set(range(1, 101))

    def extract(self, numero):
        if numero in self.numeros:
            self.numeros.remove(numero)
            return f"Se extrajo el número {numero}."
        else:
            return f"El número {numero} no está en el conjunto."
