##
# En las siguientes dos sesiones, aprenderemos las cinco funciones clave de dplyr que le 
# permiten resolver la gran mayoría de sus desafíos de manipulación de datos:
  
# Elegir observaciones por sus valores: filter()
# Reordenar las filas: arrange()
# Elegir las variables por sus nombres: select()
# Crear nuevas variables con funciones de variables existentes: mutate()
# Contraer muchos valores en un solo resumen summarise()
# Todos estos se pueden usar junto con group_by() que cambia el alcance de 
# cada función de operar en todo el conjunto de datos a operar en 
# él grupo por grupo. 

# Estas seis funciones proporcionan los verbos para un lenguaje de 
# manipulación de datos.

# Todos los verbos funcionan de manera similar:
  
  # El primer argumento es un marco de datos.

# Los argumentos subsecuentes describen qué hacer con el marco de datos, 
# utilizando los nombres de las variables (sin comillas).

# El resultado es un nuevo marco de datos.

# Juntas, estas propiedades hacen que sea fácil encadenar varios pasos 
# simples para lograr un resultado complejo. Profundicemos y veamos cómo 
# funcionan estos verbos.

# Ahora ilustremos las primeras tres funciones del paquete Dplyr con la base
# nycflights2013, que contiene datos sobre vuelos en NY en 2013. Primero,
# carguemos en biblioteca el paquete Tidyverse y la base nycflights2013

install.packages("tidyverse")
install.packages("nycflights13")
library(tidyverse)
library(nycflights13)


flights


# Filtrando filas con filter()

# filter() le permite crear subconjuntos de observaciones en función de 
# sus valores. El primer argumento es el nombre del marco de datos. 
# El segundo y los siguientes argumentos son las expresiones que filtran 
# el marco de datos. Por ejemplo, podemos seleccionar todos los vuelos el 
# 31 de octubre:

filter(flights, month == 10, day == 31)

# Cuando ejecutamos esa línea de código, dplyr ejecuta la operación de 
# filtrado y devuelve un nuevo marco de datos. Las funciones de dplyr 
# nunca modifican la base original, por lo que si desea guardar el resultado, 
# deberá usar el operador de asignación:

vuelos31oct = filter(flights, month == 10, day == 31)
vuelos31oct

# Tambíen podemos utilizar operadores lógicos, recordemos algunas cosas que
# ya hemos aprendido, y filtremos los vuelos de los meses de junio y julio

vuelosjunyjul = filter(flights, month == 6 | month == 7)
vuelosjunyjul

## 
# arrange() funciona de manera similar a filter() excepto que en lugar de 
# seleccionar filas, cambia su orden. Se necesita un marco de datos y un 
# conjunto de nombres de columna para ordenar. Si proporciona más de un 
# nombre de columna, cada columna adicional se utilizará para romper 
# empates en los valores de las columnas anteriores. Por ejemplo, ordenemos
# la base flights por año, mes y dia

arrange(flights, year, month, day)

# Use desc() para reordenar por una columna en orden descendente. Ordenemos
# por año, mes, dia, y hora de arribo descendente:

arrange(flights, year, month, day, desc(arr_time))
