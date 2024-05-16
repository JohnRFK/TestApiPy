from django.shortcuts import render

from django.http import JsonResponse
from .models import ListaNumeros

def extraer_numero(request, numero):
    lista_num = ListaNumeros()
    result = lista_num.extract(numero)
    return JsonResponse({"result": result})
