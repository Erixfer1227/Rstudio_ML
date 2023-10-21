## 
# Factores y variables categóricas

#Los factores son variables en R que toman un número limitado de valores diferentes; 
# estas variables se denominan a menudo variables categóricas.

# En un conjunto de datos, podemos distinguir dos tipos de variables: 
# categóricas y continuas.

# Una variable continua puede tomar cualquier valor, desde entero hasta decimal. 
# Por ejemplo, podemos tener los ingresos, el precio de una acción, etc.

# En una variable categórica, el valor es limitado y generalmente se basa en un grupo 
# finito particular. Por ejemplo, una variable categórica puede ser países, año, género, 
# ocupación.

# Variables categóricas
# R almacena variables categóricas en un factor. 
# Revisemos el código siguiente para convertir una variable de carácter en una 
# variable de factor. Los caracteres no son compatibles con el algoritmo de 
# aprendizaje automático y la única forma es convertir una cadena de caracteres 
# en un número entero.

# Sintáxis
# factor(x = character(), levels, labels = levels, order = is.ordered(x))
# x: un vector de datos. Debe ser una cadena o un número entero, no un decimal.

# levels: un vector de posibles valores tomados por x. Este argumento es opcional. 
# El valor predeterminado es la lista única de elementos del vector x.

# labels: agregue una etiqueta a los datos x. 
# Por ejemplo, 1 puede tomar la etiqueta "hombre" mientras que 0, la etiqueta "mujer".

# order: Determine si los niveles deben ordenarse.

# Hagamos un ejemplo

# Crear un vector con días de la semana
dias_semana <- c("miercoles", "miercoles", "jueves", "lunes", "miercoles", "sabado", "viernes", "domingo", "martes", "lunes")
class(dias_semana)
# convertir dias_semana en factor
factor_dias_semana <-factor(dias_semana)
class(factor_dias_semana)
factor_dias_semana
# Contemos las ocurrencias para cada nivel
summary(factor_dias_semana)

# Variables categoricas ordinales
# Las variables categóricas ordinales tienen un orden natural. 
# Podemos especificar el orden, de menor a mayor con order = TRUE y 
# de mayor a menor con order = FALSE.

# Convirtamos dias_semana en un factor con niveles ordenados
factor_dias_ordenado <- factor(dias_semana, order = TRUE, levels =c('lunes', 'martes', 'miercoles', 'jueves', 'viernes', 'sabado', 'domingo'))
# Llamemos la nueva variable factor ordenada
factor_dias_ordenado
# Contemos las ocurrencias para cada nivel
summary(factor_dias_ordenado)