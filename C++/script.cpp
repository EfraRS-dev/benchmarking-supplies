#include <iostream>
#include <vector>
#include <numeric>
#include <fstream>
#include <chrono>
#include <filesystem>

using namespace std;
namespace fs = filesystem;

vector<int> cribaEratostenes(int limiteSuperior) {
    vector<bool> esPrimo(limiteSuperior + 1, true);
    esPrimo[0] = esPrimo[1] = false;

    for (int i = 2; i * i <= limiteSuperior; i++) {
        if (esPrimo[i]) {
            for (int multiplo = i * i; multiplo <= limiteSuperior; multiplo += i) {
                esPrimo[multiplo] = false;
            }
        }
    }

    vector<int> listaPrimos;
    for (int i = 2; i <= limiteSuperior; i++) {
        if (esPrimo[i]) {
            listaPrimos.push_back(i);
        }
    }
    return listaPrimos;
}

void principal() {
    auto tiempoInicio = chrono::high_resolution_clock::now();
    
    int limite = 100000000;
    vector<int> listaPrimos = cribaEratostenes(limite);
    long long sumaPrimos = accumulate(listaPrimos.begin(), listaPrimos.end(), 0LL);
    
    auto tiempoFin = chrono::high_resolution_clock::now();
    double tiempoEjecucion = chrono::duration<double>(tiempoFin - tiempoInicio).count();

    cout << "C++: Suma de los primos hasta 100 millones: " << sumaPrimos << endl;
    cout << "Tiempo de ejecución: " << tiempoEjecucion << " s" << endl;

    // Obtener el directorio actual
    string directorioScript = fs::current_path().string();
    string rutaArchivo = directorioScript + "/data_cpp.txt";

    // Escribir en archivo
    ofstream archivo(rutaArchivo);
    if (archivo.is_open()) {
        archivo << tiempoEjecucion << endl;
        archivo << sumaPrimos << endl;
        archivo.close();
    } else {
        cerr << "Error al escribir el archivo." << endl;
    }
}

int main() {
    principal();
    return 0;
}
