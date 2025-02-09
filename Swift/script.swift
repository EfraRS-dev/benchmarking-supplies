import Foundation

func cribaEratostenes(limiteSuperior: Int) -> [Int] {
    var esPrimo = [Bool](repeating: true, count: limiteSuperior + 1)
    esPrimo[0] = false
    esPrimo[1] = false

    for i in 2...Int(Double(limiteSuperior).squareRoot()) {
        if esPrimo[i] {
            for multiplo in stride(from: i * i, through: limiteSuperior, by: i) {
                esPrimo[multiplo] = false
            }
        }
    }

    return (2...limiteSuperior).filter { esPrimo[$0] }
}

func principal() {
    let tiempoInicio = Date()

    let limite = 100000000
    let listaPrimos = cribaEratostenes(limiteSuperior: limite)
    let sumaPrimos = listaPrimos.reduce(0, +)

    let tiempoFin = Date()
    let tiempoEjecucion = tiempoFin.timeIntervalSince(tiempoInicio)

    print("Swift: Suma de los primos hasta 100 millones: \(sumaPrimos)")
    print(String(format: "Tiempo de ejecución: %.2f s", tiempoEjecucion))

    // Obtener la ruta del directorio del script
    let directorioScript = FileManager.default.currentDirectoryPath
    let rutaArchivo = "\(directorioScript)/data_swift.txt"

    // Escribir en un archivo
    do {
        let contenido = "\(tiempoEjecucion)\n\(sumaPrimos)"
        try contenido.write(toFile: rutaArchivo, atomically: true, encoding: .utf8)
    } catch {
        print("Error al escribir el archivo: \(error)")
    }
}

principal()
