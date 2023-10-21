#####
# Una funci?n es un fragmento de c?digo escrito para realizar una tarea espec?fica;
# que puede aceptar argumentos o par?metros y devolver uno o m?s valores.
# En programaci?n, se utilizan funciones para incorporar conjuntos de instrucciones 
# que se desean usar repetidamente o que, debido a su complejidad, est?n mejor 
# autocontenidas en un subprograma y se llaman cuando son necesarias.

# Argumento es el ingreso (o input) de una funci?n: una variable que afecta 
# al resultado de una funci?n.

# Ejemplo. si una función que obtiene la altura de un arbol es:
  
#  h(año) = 20 * año,

# entonces"año" es el argumento de la funci?n "h".

## FUNCIONES EN R

# En R, definimos una funci?n con el constructo: 

# function (listadeargumento) {body}

# Hagamos un ejemplo:

MiPrimeraFuncion <- function(n) 
{
  # Multiplique el n?mero n por 2
  2*n  
}

m <- MiPrimeraFuncion(5)
m
  

  