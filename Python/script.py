import time

def suma_primos(n):
    if n < 1:
        return 0

    es_primo = [True] * (n + 1)
    es_primo[0] = es_primo[1] = False

    for p in range(2, int(n**0.5) + 1):
        if es_primo[p]:
            for i in range(p * p, n + 1, p):
                es_primo[i] = False

    suma = sum(p for p in range(2, n + 1) if es_primo[p])
    return suma

n = 1000000  # Cambia este valor para probar con otros números
inicio = time.time()

resultado = suma_primos(n)

fin = time.time()
duracion = (fin - inicio) * 1000  # Convertir a milisegundos

# Guardar la suma en un archivo
with open("python_suma.txt", "w") as archivo_suma:
    archivo_suma.write(str(resultado))

# Guardar el tiempo en un archivo
with open("python_tiempo.txt", "w") as archivo_tiempo:
    archivo_tiempo.write(str(duracion))

print(f"Suma de los primeros {n} primos: {resultado}")
print(f"Tiempo de ejecucion: {duracion:.2f} ms")