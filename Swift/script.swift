import Foundation

func sumaPrimos(_ n: Int) -> Int {
    if n < 1 {
        return 0
    }

    var esPrimo = [Bool](repeating: true, count: n + 1)
    esPrimo[0] = false
    esPrimo[1] = false

    for p in 2...Int(sqrt(Double(n))) {
        if esPrimo[p] {
            for i in stride(from: p * p, through: n, by: p) {
                esPrimo[i] = false
            }
        }
    }

    var suma = 0
    for p in 2...n {
        if esPrimo[p] {
            suma += p
        }
    }

    return suma
}

let n = 1000000 // Cambia este valor para probar con otros números
let inicio = CFAbsoluteTimeGetCurrent()

let resultado = sumaPrimos(n)

let fin = CFAbsoluteTimeGetCurrent()
let duracion = (fin - inicio) * 1000 // Convertir a milisegundos

// Guardar la suma en un archivo
do {
    try String(resultado).write(toFile: "swift_suma.txt", atomically: true, encoding: .utf8)
} catch {
    print("Error al guardar la suma: \(error)")
}

// Guardar el tiempo en un archivo
do {
    try String(duracion).write(toFile: "swift_tiempo.txt", atomically: true, encoding: .utf8)
} catch {
    print("Error al guardar el tiempo: \(error)")
}

print("Suma de los primeros \(n) primos: \(resultado)")
print("Tiempo de ejecucion: \(duracion) ms")