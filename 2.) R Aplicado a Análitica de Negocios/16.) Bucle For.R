#####

# Los bucles se utilizan en la programacion para repetir un bloque de codigo 
# especifico.
# En esta sesion, aprenderemos a crear un bucle for en la programacion R.

# Los bucles for se utilizan para iterar sobre un vector en R.

# Sintaxis del bucle for

for (val in secuencia)
{
  declaracion
}

# En donde, la secuencia es un vector y val toma cada uno de sus valores 
# durante el ciclo. En cada iteracion, se evalua la declaracion.

# Veamos un ejemplo

x <- c(1,2,3,4,5,6,7,8,9,10)
x <- data.frame(x)
contador <- 0
for (val in x$x) {
  if(val %% 2 == 0)  contador = contador + 1
}
print(contador)
