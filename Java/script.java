import java.io.FileWriter;
import java.io.IOException;
import java.util.Arrays;

public class script {
    public static int sumaPrimos(int n) {
        if (n < 1) return 0;

        boolean[] esPrimo = new boolean[n + 1];
        Arrays.fill(esPrimo, true);
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

    public static void main(String[] args) {
        int n = 1000000; // Cambia este valor para probar con otros números
        long inicio = System.currentTimeMillis();

        int resultado = sumaPrimos(n);

        long fin = System.currentTimeMillis();
        long duracion = fin - inicio;

        // Guardar la suma en un archivo
        try (FileWriter archivoSuma = new FileWriter("java_suma.txt")) {
            archivoSuma.write(String.valueOf(resultado));
        } catch (IOException e) {
            e.printStackTrace();
        }

        // Guardar el tiempo en un archivo
        try (FileWriter archivoTiempo = new FileWriter("java_tiempo.txt")) {
            archivoTiempo.write(String.valueOf(duracion));
        } catch (IOException e) {
            e.printStackTrace();
        }

        System.out.println("Suma de los primeros " + n + " primos: " + resultado);
        System.out.println("Tiempo de ejecucion: " + duracion + " ms");
    }
}