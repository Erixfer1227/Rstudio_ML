##
# ¿Qué es la inteligencia de negocios?

# La inteligencia de negocios o business intelligence (BI) es el conjunto 
# de procesos, aplicaciones y tecnologías que facilitan la obtención rápida 
# y sencilla de datos provenientes de los sistemas de gestión empresarial 
# para su análisis e interpretación, de manera que puedan ser aprovechados
# para la toma de decisiones y se conviertan en conocimiento para los responsables del negocio.

# ¿Cómo se relaciona R con la inteligencia de negocios?
# Ahora quiero ilustrarles con un ejemplo muy aterrizado como R puede facilitar
# su tarea de limpieza, manipulacion, y visualizacion de datos para la toma
# de decisiones

library(nycflights13)

flights

# ¿Que tanta útil le resulta estos datos? ¿Puede sacar algún tipo de conclusión?

# ¿Y que tal si pudiera hacer operaciones entre las variables y
# sacar algún tipo de estadística descriptiva?
# Por ejemplo, calculemos la media de retraso de salida para todos los vuelos

summarise(flights, delay = mean(dep_delay, na.rm = TRUE))

# ¿Que tan útil le resulta saber que el tiempo promedio de retraso es de 12.6min?

# Ahora ya sabemos que en promedio los vuelos tienen un retraso de 12.6 minutos
# como un dato de análisis exploratorio esta bien, pero podríamos indagar mas
# con algunos funciones de los paquetes de tidyverse podemos manipular datos
# con mucha eficiencia

# Imagine que queremos explorar la relación entre la distancia y el retraso
# promedio para cada ubicación. Agrupemos
# los datos por destino, y luego calculemos el número de vuelos, distancia y
# tiempo de retraso
library(tidyverse)


por_destino <- group_by(flights, dest)
retrasos <- summarise(por_destino,
                      vuelos = n(),
                      distancia = mean(distance, na.rm = TRUE),
                      retraso = mean(arr_delay, na.rm = TRUE)
)
retrasos

# Para aquellos de uds. que tienen experiencia con excel, quiero que noten el
# poder y la eficiencia de R... con 5 líneas de código nos ahorramos al menos
# quince minutos, por ser muy benevolentes,
# de limpieza y manipulación de datos con tablas dinámicas

## Pero las ventajas de R, no llegan hasta aquí... si queremos visualizar 
# los datos, no tenemos que exportarlos a Data Studio o TAbleau, podemos
# hacerlo con otras líneas de código... veamos

ggplot(data = retrasos, mapping = aes(x = distancia, y = retraso)) +
  geom_point(aes(size = vuelos), alpha = 1/3) +
  geom_smooth(se = FALSE)

# Parece que los retrasos aumentan con la distancia hasta ~ 750 millas
# y luego disminuya. Tal vez a medida que los vuelos se alargan, hay más
# capacidad para compensar retrasos en el aire... y ese es un insight
# muchísimo más valioso que simplemente presentar el promedio de retraso
# en minutos...

# Quisiera cerrar la clase modelo, enfatizando 3 bondades de R
# 1. Es poderoso y eficiente... con pocas líneas de código podemos ahorrarnos
# varias horas de trabajo limpiando y manipulando datos
# 2. Paquetes elaborados por una comunidad de investigadores en el estado
# del arte del conocimiento. Esta es una ventaja por sobre los software comerciales
# Con R podes estar seguro que tendrás los mejores recursos siempre
# 3. Por si esto fuera poco: Es gratis!

# Con esto doy por finalizada la sesión. Espero haber despertado su interes en R!
# Muchas gracias!
# 