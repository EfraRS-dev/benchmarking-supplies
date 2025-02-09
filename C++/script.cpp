#include <iostream>
#include <vector>
#include <cmath>
#include <chrono>
#include <fstream>

using namespace std;
using namespace std::chrono;

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

    vector<int> primos;
    for (int i = 2; i <= limiteSuperior; i++) {
        if (esPrimo[i]) primos.push_back(i);
    }
    return primos;
}

void principal() {
    auto tiempoInicio = high_resolution_clock::now();

    int limite = 100000000;
    vector<int> listaPrimos = cribaEratostenes(limite);
    long long sumaPrimos = 0;

    for (int primo : listaPrimos) {
        sumaPrimos += primo;
    }

    auto tiempoFin = high_resolution_clock::now();
    duration<double> tiempoEjecucion = tiempoFin - tiempoInicio;

    cout << "C++: Suma de los primos hasta 100 millones: " << sumaPrimos << endl;
    cout << "Tiempo de ejecucion: " << tiempoEjecucion.count() << " s" << endl;

    ofstream archivo("data_cpp.txt");
    if (archivo.is_open()) {
        archivo << tiempoEjecucion.count() << "\n";
        archivo << sumaPrimos;
        archivo.close();
    } else {
        cerr << "Error al abrir el archivo!" << endl;
    }
}

int main() {
    principal();
    return 0;
}
