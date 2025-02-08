import time
import os

def criba_eratostenes(limite_superior):
    es_primo = [True] * (limite_superior + 1)
    es_primo[0] = es_primo[1] = False
    for i in range(2, int(limite_superior ** 0.5) + 1):
        if es_primo[i]:
            for multiplo in range(i * i, limite_superior + 1, i):
                es_primo[multiplo] = False
    return [index for index, primo in enumerate(es_primo) if primo]

def principal():
    tiempo_inicio = time.time()
    
    limite = 100_000_000
    lista_primos = criba_eratostenes(limite)
    suma_primos = sum(lista_primos)
    
    tiempo_fin = time.time()
    tiempo_ejecucion = tiempo_fin - tiempo_inicio

    print(f"PY: Suma de los primos hasta 100 millones: {suma_primos}")
    print(f"Tiempo de ejecucion: {tiempo_ejecucion:.2f} s")

    directorio_script = os.path.dirname(os.path.abspath(__file__))
    ruta_archivo = os.path.join(directorio_script, "data_py.txt")
    
    with open(ruta_archivo, "w") as file:
        file.write(f"{tiempo_ejecucion}\n")
        file.write(f"{suma_primos}")

if __name__ == "__main__":
    principal()
