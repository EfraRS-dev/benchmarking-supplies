criba_eratostenes <- function(limite_superior) {
  n <- limite_superior
  es_primo <- rep(TRUE, n)
  es_primo[1] <- FALSE      
  
  for (i in 2:floor(sqrt(n))) {
    if (es_primo[i]) {
      es_primo[seq(i * i, n, by = i)] <- FALSE
    }
  }
  
  which(es_primo)
}

principal <- function() {
  tiempo_inicio <- Sys.time()
  
  limite <- 40000000
  lista_primos <- criba_eratostenes(limite)
  suma_primos <- sum(lista_primos)
  
  tiempo_fin <- Sys.time()
  tiempo_ejecucion <- as.numeric(difftime(tiempo_fin, tiempo_inicio, units = "secs"))
  
  cat(sprintf("R: Suma de los primos hasta %.0f: %.0f\n", limite, suma_primos))
  cat(sprintf("Tiempo de ejecucion: %.2f s\n", tiempo_ejecucion))
  
  directorio_script <- getwd()
  ruta_archivo <- file.path(directorio_script, "data_r.txt")
  
  writeLines(c(as.character(tiempo_ejecucion), as.character(suma_primos)), ruta_archivo)
}

principal()
