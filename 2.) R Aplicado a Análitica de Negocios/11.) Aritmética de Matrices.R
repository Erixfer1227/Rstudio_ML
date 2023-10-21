# Aritmética de Matrices
# En la aritmética de matrices debemos reconocer tres tipos de operaciones:
# A. Escalar por Matriz
# B. Las que se realizan elemento por elemento entre dos matrices: en este caso, 
# las matrices # deben tener la misma dimensión, es decir, el mismo número de filas y 
# columnas
# C. La multiplicación vectorial: en este caso, el número de columnas de la
# primer matriz, debe ser igual al número de filas de la segunda matriz

# Ejemplos de operaciones de escalar por matriz

# Creamos la matriz
Matriz = matrix(1:15, ncol=5)
Matriz

# Sumamos 5 a cada elemento de la Matriz
5+Matriz

# Ahora restamos 2 a cada elemento de la Matriz

-2+ Matriz

# Ahora multiplicamos por 3 cada elemento de la Matriz

3*Matriz

# Ahora hagamos ejemplos de operaciones elemento por elemento 
# Crear otra matriz de las mismas dimensiones de Matriz
Matriz1 = matrix (16:30, ncol=5)

# Ahora sumo las matrices y la guardo como Matriz2
Matriz2= Matriz + Matriz1

#Ahora multiplico Matriz2 y Matriz1, elemento por elemento
Matriz2*Matriz1

#Creo una matriz con dimensión diferente
Matriz4X4 = matrix(1:16, ncol=4)

#Intento multiplicar elemento or elemento Matriz original y Matriz4X4
Matriz*Matriz4X4
# Recibo un error porque no tienen la misma dimensión

# Veamos un ejemplo de multiplicación vectorial, en este caso, las matrices
# deben tener la forma de ixn %*% nxj, es decir, el número de 
# columnas de la primera matriz, deben ser igual al número de filas de la 
# segunda.

Matriz5 = matrix(1:15, nrow=5)
Matriz%*%Matriz5

# Voy a probar multiplicar vectorialmente dos matrices con la misma dimensión
Matriz%*%Matriz1
# Obtengo un error

Matriz2%*%Matriz5
