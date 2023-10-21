###

# Las matrices tiene la siguiente sintaxis:
  
  # matrix("Vector", nrow="#", ncol="#", byrow="T o F")

# Donde matrix es el comando para generar la matriz:
  # vector es el vector desde donde se generar? la matriz, 
  # nrow tomar? un valor num?rico que especifica el n?mero de filas,
  # ncol especificar? el n?mero de columas, 
  # byrow tomar? TRUE o FALSE que indica si se ordenar? los elementos 
  # de la matriz a trav?s de filas o columas respectivamente.

# CREEMOS UNA MATRIZ DE 15 ELEMENTOS, CON 3 FILAS Y 5 COLUMNAS
MATRIZ <-matrix(1:15, nrow=3) # por defecto entiende que son 5 columnas
MATRIZ

# CREEMOS UNA MATRIZ DE 15 ELEMENTOS, CON 5 FILAS Y 3 COLUMNAS
MATRIZ1 <-matrix(1:15, ncol=3)
MATRIZ1

# COMO HEMOS VISTO, R POR DEFAULT ORDENA LOS ELEMENTOS POR COLUMNA
# CREEMOS UNA MATRIZ DE 15 ELEMENTOS, CON 5 FILAS Y 3 COLUMNAS
# CON ELEMENTOS ORDENADOS POR FILA
MATRIZ2 <-matrix(1:15, ncol=3, byrow=T)
MATRIZ2

# AHORA TRANSPONGAMOS LA MATRIZ2 Y LLAMEMOSLA MATRIZ3

MATRIZ3 <- t(MATRIZ2)
MATRIZ3
dim(MATRIZ2)
dim(MATRIZ3)

# AHORA,creemos una matriz a partir de un vector
x<-seq(1,40, by=2)
x

MATRIZX = matrix(x, nrow=4)
MATRIZX

# Combinemos varias vectores en una matriz

y<-seq(41,60, by=2)
y
z<-seq(61,80, by=2)
z

# Combinemos los vectores por filas
MATRIZXYZ = rbind(x,y,z)
MATRIZXYZ

# Ahora combinemos los vectores por columna
MATRIZXYZCOL = cbind(x,y,z)
MATRIZXYZCOL
