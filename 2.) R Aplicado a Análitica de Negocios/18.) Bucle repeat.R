#####

# Los bucles se utilizan en la programación para repetir un bloque de código específico.
# En esta sesión, aprenderemos a crear un bucle repeat en la programación R.

# Los bucles repeat se utilizan para iterar sobre un bloque de código varias veces.

# A diferencia del bucle for, en el bucle repeat no hay verificación de condición 
# en el ciclo para salir del mismo.

# Nosotros mismos debemos poner una condición explícitamente dentro del cuerpo 
# del ciclo y usar la instrucción break para salir del ciclo. Si no lo hacemos, 
# se generará un bucle infinito.

# Sintaxis del bucle repeat

repeat {
  statement
}

## ADVERTENCIA ##
# En el bloque de instrucciones, debemos usar la instrucción break para salir 
# del ciclo. DE LO CONTRARIO, CREAREMOS UN BUCLE INFINITO

# Veamos un ejemplo similar al que hicimos para el bucle for

x <- 1
repeat {
  print(x)
  x = x+1
  if (x == 6){
    break
  }
}

