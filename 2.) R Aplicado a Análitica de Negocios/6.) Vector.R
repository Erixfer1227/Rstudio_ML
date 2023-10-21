###

# Un vector es la estructura de datos m?s sencilla en R. 
# Un vector es una colecci?n de uno o m?s datos del mismo tipo.

# Todos los vectores tienen tres propiedades:

# Tipo. Un vector tiene el mismo tipo que los datos que contiene. 
# Si tenemos un vector que contiene datos de tipo num?rico, el vector 
# ser? tambi?n de tipo num?rico. 

# Largo. Es el n?mero de elementos que contiene un vector. 
# El largo es la ?nica dimensi?n que tiene esta estructura de datos.


# Atributos. Los vectores pueden tener metadatos de muchos tipos, 
# los cuales describen caracter?sticas de los datos que contienen. 
# Todos ellos son incluidos en esta propiedad. 

# Ejemplos
# Vector num?rico
c(1, 2, 3, 4, 5, 6)

# Vector de cadena de texto
c("Carlos", "Roberto", "Martinez", "Romero")

# Vector l?gico
c(TRUE, TRUE, FALSE, FALSE)

# Podemos agregar elementos a un vector

mi_vector <- c(0, 0, 1)

mi_vector1 <- c(mi_vector, 1)

mi_vector1


# Podemos combinar dos vectores


mi_vector2 <- c(2, 4, 6)

mi_vector3 <- c(mi_vector1, mi_vector2)

mi_vector3


# Los vectores tambi?n siguen la regla de coerci?n de R
mi_vector <- c(1, 2, 3)

class(mi_vector)

## Si intentamos agregar un dato de tipo cadena de texto, nuestro vector ahora ser? de tipo cadena de texto.

mi_vector_nuevo <- c(mi_vector, "a")

class(mi_vector_nuevo)

#########
# Vectorizaci?n de operaciones
# Existen algunas operaciones al aplicarlas a un vector, se aplican a 
# cada uno de sus elementos. A este proceso le llamamos vectorizaci?n.

# Las operaciones aritm?ticas y relacionales pueden vectorizarse. 
# Si las aplicamos a un vector, la operaci?n se realizar? para cada uno 
# de los elementos que contiene.

# Por ejemplo, creamos un vector num?rico.

mi_vector <- c(1, 2, 3, 4, 5, 6, 7, 8)

V2 <- mi_vector + 2

mi_vector * 2

mi_vector %% 2

# Al aplicar operaciones relacionales, obtenemos un vector de TRUE y FALSE, 
# uno para cada elemento comparado.

mi_vector > 5
mi_vector < 5
mi_vector == 5

# Esta manera de aplicar una operaci?n es muy eficiente. 
# Comparada con otros procedimientos, requiere de menos tiempo de c?mputo, 
# lo cual a veces es considerable, en particular cuando trabajamos con 
# un n?mero grande de datos.

prueba1 <- c(10,15,20,25,30)
prueba1 <- prueba1 > 15

