###
# Indexando Matrices
# La indexación es la selección de subconjuntos de datos de un vector 
# matriz o de datos estructurales.

# Creamos matriz
MATRIZ<-matrix(1:20,ncol=5)
MATRIZ

# Seleccionemos el elemento en la fila 2, columna 3
MATRIZ[2,3]

# Seleccionemos la fila 3
MATRIZ[3,]

# Seleccionemos la columna 4
MATRIZ[,4]

# Seleccionemos un subconjunto, formado por los elementos de la fila 3 y 4
# y las columnas 2 y 3
# Nombremoslo MATRIZ1

MATRIZ1 = MATRIZ[c(3,4),c(2,3)]
MATRIZ1

# Seleccionemos un subconjunto excluyendo la segunda columna de MATRIZ
# Nombremola MATRIZ2

MATRIZ2 = MATRIZ[,-2]
MATRIZ2

# Seleccionemos un subconjunto formado por los elementos de la fila 2 y 3
# y todas las columnas, exceptuando 1 y 4
# Nombremoslo MATRIZ3

MATRIZ3 = MATRIZ[c(2,3),c(-1,-4)]
MATRIZ3



