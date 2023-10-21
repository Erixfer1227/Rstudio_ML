## 
#En esta segunda sesión de Dplyr, abordaremos las funciones select, mutate,
# summarise y group_by

##
# No es raro obtener conjuntos de datos con cientos o incluso miles de variables.
# En este caso, el primer desafío suele ser limitar las variables que realmente 
# le interesan. Select () le permite acercarse rápidamente a un subconjunto
# útil mediante operaciones basadas en los nombres de las variables.

# select () no es muy útil con los datos de vuelos porque solo tenemos 19 
# variables, pero aún puede hacerse una idea general:

# Selecciones las columnas año, mes y dia
select(flights, year, month, day)

# Seleccionemos todas las columnas entre año y dia, incluisve
select(flights, year:day)

# Selecconemos todas las columnas con excepcion a las contenidas entre año y dia
# (inclusive)
select(flights, -(year:day))

##
# Además de seleccionar conjuntos de columnas existentes, a menudo es útil 
# agregar nuevas columnas que sean funciones de columnas existentes. 
# Ese es el trabajo de mutate ().

# mutate () siempre agrega nuevas columnas al final de su conjunto de datos, 
# por lo que comenzaremos creando un conjunto de datos más estrecho para que 
# podamos ver las nuevas variables. Recuerde que cuando está en RStudio, 
# la forma más fácil de ver todas las columnas es View().

vuelos <- select(flights, 
                      year:day, 
                      ends_with("delay"), 
                      distance, 
                      air_time
)
mutate(vuelos,
       ganancia = dep_delay - arr_delay,
       velocidad = distance / air_time * 60
)

# Si solo se quieren crear las variables nuevas dentro de la base se utiliza
# transmute

solo3variables = transmute(flights,
          gain = dep_delay - arr_delay,
          hours = air_time / 60,
          gain_per_hour = gain / hours
)

##
# La última función clave de Dplyr es resumir (). 
# Esta función colapsa un marco de datos en una sola fila:
  
summarise(flights, delay = mean(dep_delay, na.rm = TRUE))

##
# summarise() no es muy útil a menos que lo emparejemos con group_by (). 
# Esto cambia la unidad de análisis del conjunto de datos completo a grupos 
# individuales. Luego, cuando use los verbos dplyr en un marco de datos agrupado,
# se aplicarán automáticamente "por grupo". Por ejemplo, si aplicamos 
# exactamente el mismo código a un marco de datos agrupado por fecha, 
# btenemos el retraso promedio por fecha:

por_dia <- group_by(flights, year, month, day)
summarise(por_dia, delay = mean(dep_delay, na.rm = TRUE))

#Juntos, group_by () y summarise () proporcionan una de las herramientas que 
#utilizará con más frecuencia cuando trabaje con dplyr: resúmenes agrupados.
## En la siguiente sesión, haremos un ejemplo práctico, en el que aprenderá
# como puede utilizar la transformación y visualización en analítica de negocios
#Muchas gracias!