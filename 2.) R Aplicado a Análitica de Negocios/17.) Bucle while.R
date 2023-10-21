#####

# Los bucles se utilizan en la programación para repetir un bloque de código específico.
# En esta sesión, aprenderemos a crear un bucle while en la programación R.

# Los bucles while se utilizan para iterar un bloque de código hasta que se cumpla 
# cierta condición

# Sintaxis del bucle while

while (expresion_a_evaluar)
{
  declaracion
}

# Aquí, expresion_a_evaluar se evalúa y se ingresa el cuerpo del bucle 
# si el resultado es TRUE

# Las declaraciones dentro del ciclo se ejecutan y el flujo regresa para 
# evaluar expresion_a_evaluar nuevamente.

# Esto se repite cada vez hasta que expresion_a_evaluarse evalúa como FALSE, 
# en cuyo caso, el bucle finaliza.

# Veamos un ejemplo

i <- 1
while (i < 6) {
  print(i)
  i = i+1
}