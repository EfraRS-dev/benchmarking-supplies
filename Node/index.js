const fs = require('fs');
const path = require('path');

function cribaEratostenes(limiteSuperior) {
    let esPrimo = new Array(limiteSuperior + 1).fill(true);
    esPrimo[0] = esPrimo[1] = false;

    for (let i = 2; i * i <= limiteSuperior; i++) {
        if (esPrimo[i]) {
            for (let multiplo = i * i; multiplo <= limiteSuperior; multiplo += i) {
                esPrimo[multiplo] = false;
            }
        }
    }

    return esPrimo
        .map((primo, index) => (primo ? index : 0))
        .filter(numero => numero !== 0);
}

function principal() {
    const tiempoInicio = Date.now();
    
    const limite = 10000000;
    const listaPrimos = cribaEratostenes(limite);
    const sumaPrimos = listaPrimos.reduce((acc, num) => acc + num, 0);
    
    const tiempoFin = Date.now();
    const tiempoEjecucion = (tiempoFin - tiempoInicio) / 1000.0;

    console.log(`NODE: Suma de los primos hasta 10 millones: ${sumaPrimos}`);
    console.log(`Tiempo de ejecución: ${tiempoEjecucion.toFixed(2)} s`);

    const directorioScript = __dirname;
    const rutaArchivo = path.join(directorioScript, 'data_js.txt');

    fs.writeFileSync(rutaArchivo, `${tiempoEjecucion}\n${sumaPrimos}`);
}

principal();
