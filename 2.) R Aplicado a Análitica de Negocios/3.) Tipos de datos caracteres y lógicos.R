# Adem?s de los datos num?ricos, hay otros tipos de datos en R: caracteres y l?gicos
# Los caracteres son datos de texto como "hola" "Jorge" "rojo" "Ford"
# Los datos l?gicos, son valores booleanos de verdadero y falso

# Ejemplo de datos de caracteres

Variable_caracter = "Rojos"
class(Variable_caracter)
typeof(Variable_caracter)

# ?Podemos asignar un n?mero como variable de caracter? si, pero debemos ponerlo
# entre comillas
Variable_caracter2 = "5.2"
class(Variable_caracter2)

# Ejemplo de datos l?gicos
# Para asignar valores l?gicos, debemos ocupar las palabras TRUE o FALSE
# Tambi?n podr?amos utilizar simplemente T o F
TRUE
class(TRUE)

FALSE
class(FALSE)

x = TRUE
class(x)


T
class(T)

y = F
class(y)
