#include <iostream>
#include <vector>
#include <cmath>
#include <chrono>
#include <fstream>
#include <filesystem>

void criba_eratostenes(int limite_superior, std::vector<int>& primos) {
    std::vector<bool> es_primo(limite_superior + 1, true);
    es_primo[0] = es_primo[1] = false;

    for (int i = 2; i <= std::sqrt(limite_superior); ++i) {
        if (es_primo[i]) {
            for (int multiplo = i * i; multiplo <= limite_superior; multiplo += i) {
                es_primo[multiplo] = false;
            }
        }
    }

    for (int i = 2; i <= limite_superior; ++i) {
        if (es_primo[i]) {
            primos.push_back(i);
        }
    }
}

int main() {
    using namespace std::chrono;
    auto tiempo_inicio = high_resolution_clock::now();

    int limite = 100000000; // 100 millones
    std::vector<int> lista_primos;
    criba_eratostenes(limite, lista_primos);

    long long suma_primos = 0;
    for (int primo : lista_primos) {
        suma_primos += primo;
    }

    auto tiempo_fin = high_resolution_clock::now();
    double tiempo_ejecucion = duration<double>(tiempo_fin - tiempo_inicio).count();

    std::cout << "C++: Suma de los primos hasta 100 millones: " << suma_primos << std::endl;
    std::cout << "Tiempo de ejecucion: " << tiempo_ejecucion << " s" << std::endl;

    std::string ruta_archivo = "/usr/src/app/data/data_cpp.txt";

    std::ofstream archivo_salida(ruta_archivo);
    if (archivo_salida.is_open()) {
        archivo_salida << tiempo_ejecucion << "\n";
        archivo_salida << suma_primos;
        archivo_salida.close();
    } else {
        std::cerr << "Error al abrir el archivo para escribir." << std::endl;
    }

    return 0;
}
