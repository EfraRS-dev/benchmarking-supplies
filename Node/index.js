const fs = require('fs');

function sumaPrimos(n) {
    if (n < 1) return 0;

    const esPrimo = new Array(n + 1).fill(true);
    esPrimo[0] = esPrimo[1] = false;

    for (let p = 2; p * p <= n; p++) {
        if (esPrimo[p]) {
            for (let i = p * p; i <= n; i += p) {
                esPrimo[i] = false;
            }
        }
    }

    let suma = 0;
    for (let p = 2; p <= n; p++) {
        if (esPrimo[p]) {
            suma += p;
        }
    }

    return suma;
}

const n = 1000000; // Cambia este valor para probar con otros números
const inicio = Date.now();

const resultado = sumaPrimos(n);

const fin = Date.now();
const duracion = fin - inicio;

// Guardar la suma en un archivo
fs.writeFileSync('nodejs_suma.txt', resultado.toString());

// Guardar el tiempo en un archivo
fs.writeFileSync('nodejs_tiempo.txt', duracion.toString());

console.log(`Suma de los primeros ${n} primos: ${resultado}`);
console.log(`Tiempo de ejecucion: ${duracion} ms`);