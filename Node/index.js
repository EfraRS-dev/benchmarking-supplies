const fs = require("fs");
const path = require("path");

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

    return esPrimo.map((primo, index) => (primo ? index : -1)).filter(num => num !== -1);
}

function principal() {
    const tiempoInicio = process.hrtime();

    const limite = 40000000;
    const listaPrimos = cribaEratostenes(limite);
    const sumaPrimos = listaPrimos.reduce((acc, val) => acc + val, 0);

    const tiempoFin = process.hrtime(tiempoInicio);
    const tiempoEjecucion = tiempoFin[0] + tiempoFin[1] / 1e9;

    console.log(`JS: Suma de los primos hasta 40 millones: ${sumaPrimos}`);
    console.log(`Tiempo de ejecucion: ${tiempoEjecucion.toFixed(2)} s`);

    const directorioScript = __dirname;
    const rutaArchivo = path.join(directorioScript, "data_js.txt");

    fs.writeFileSync(rutaArchivo, `${tiempoEjecucion}\n${sumaPrimos}`);
}

principal();
