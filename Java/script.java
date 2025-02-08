import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class Script {
    
    public static List<Integer> cribaEratostenes(int limiteSuperior) {
        boolean[] esPrimo = new boolean[limiteSuperior + 1];
        for (int i = 2; i <= limiteSuperior; i++) {
            esPrimo[i] = true;
        }

        for (int i = 2; i * i <= limiteSuperior; i++) {
            if (esPrimo[i]) {
                for (int multiplo = i * i; multiplo <= limiteSuperior; multiplo += i) {
                    esPrimo[multiplo] = false;
                }
            }
        }

        List<Integer> listaPrimos = new ArrayList<>();
        for (int i = 2; i <= limiteSuperior; i++) {
            if (esPrimo[i]) {
                listaPrimos.add(i);
            }
        }
        return listaPrimos;
    }

    public static void principal() {
        long tiempoInicio = System.currentTimeMillis();
        
        int limite = 100000000;
        List<Integer> listaPrimos = cribaEratostenes(limite);
        long sumaPrimos = listaPrimos.stream().mapToLong(Integer::longValue).sum();
        
        long tiempoFin = System.currentTimeMillis();
        double tiempoEjecucion = (tiempoFin - tiempoInicio) / 1000.0;

        System.out.println("JAVA: Suma de los primos hasta 100 millones: " + sumaPrimos);
        System.out.printf("Tiempo de ejecucion: %.2f s%n", tiempoEjecucion);
        
        // Obtener el directorio donde se ejecuta el programa
        String directorioScript = System.getProperty("user.dir");
        String rutaArchivo = directorioScript + File.separator + "data_java.txt";
        
        try (FileWriter fileWriter = new FileWriter(rutaArchivo)) {
            fileWriter.write(tiempoEjecucion + "\n");
            fileWriter.write(sumaPrimos + "\n");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        principal();
    }
}
