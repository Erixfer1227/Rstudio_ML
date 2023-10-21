###

# En esta sesi?n, aprenderemos sobre data frames (o marcos de datos); 
# y c?mo crearlos desde la consola 

# El marco de datos es una estructura de datos bidimensional en R. Es un caso especial
# de una lista que tiene cada componente de igual longitud.

# Cada componente forma la columna y el contenido del componente forma las filas.

# ?C?mo crear un marco de datos en R?
# Podemos crear un marco de datos usando la funci?n data.frame()

x <- data.frame("Codigo" = c(2501,2502), "Edad" = c(21,15), "Nombre" = c("Juan","Guadalupe"))
str(x)    # estructura de x

# Podemos verificar si una variable es un marco de datos o no usando la funci?n class ()
typeof(x)
class(x)

# En este ejemplo, x se puede considerar como una lista de 3 componentes y cada 
# componente tiene un vector de dos elementos.

# A continuaci?n se muestran algunas funciones ?tiles para saber m?s 
# sobre un marco de datos.

names(x)
ncol(x)
nrow(x)
length(x) # igual al n?mero de columnas

