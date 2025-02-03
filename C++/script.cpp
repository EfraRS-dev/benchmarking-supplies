#include <iostream>
#include <vector>
#include <chrono>
#include <fstream>

using namespace std;
using namespace std::chrono;

int sumaPrimos(int n) {
    if (n < 1) return 0;

    vector<bool> esPrimo(n + 1, true);
    esPrimo[0] = esPrimo[1] = false;

    for (int p = 2; p * p <= n; p++) {
        if (esPrimo[p]) {
            for (int i = p * p; i <= n; i += p) {
                esPrimo[i] = false;
            }
        }
    }

    int suma = 0;
    for (int p = 2; p <= n; p++) {
        if (esPrimo[p]) {
            suma += p;
        }
    }

    return suma;
}

int main() {
    int n = 1000000; // Cambia este valor para probar con otros números
    auto inicio = high_resolution_clock::now();

    int resultado = sumaPrimos(n);

    auto fin = high_resolution_clock::now();
    auto duracion = duration_cast<milliseconds>(fin - inicio);

    // Guardar la suma en un archivo
    ofstream archivoSuma("cpp_suma.txt");
    if (archivoSuma.is_open()) {
        archivoSuma << resultado;
        archivoSuma.close();
    }

    // Guardar el tiempo en un archivo
    ofstream archivoTiempo("cpp_tiempo.txt");
    if (archivoTiempo.is_open()) {
        archivoTiempo << duracion.count();
        archivoTiempo.close();
    }

    cout << "Suma de los primeros " << n << " primos: " << resultado << endl;
    cout << "Tiempo de ejecucion: " << duracion.count() << " ms" << endl;

    return 0;
}