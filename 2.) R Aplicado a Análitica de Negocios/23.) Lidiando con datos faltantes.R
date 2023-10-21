###
# En esta sesión, veremos 3 funciones de tidyr que son útiles para manejar 
# los valores faltantes (NA) en el conjunto de datos. 


# Tidyr es un paquete que forma parte del ecosistema tidyverse
# y su objetivoes ayudar a crear un conjunto de datos ordenados. 
# Los datos ordenados son datos donde:
  
# Cada columna es una variable.
# Cada fila es una observación.
# Cada celda es un valor único.

# tidyr tiene 3 funciones que son útiles para procesar valores perdidos

drop_na ()
fill()
replace_na ()

# Para no extender tanto la sesión, la partiremos en dos. En esta primera parte
# añadiremos valores faltantes a un dataframe y abordarmeos la función drop_na
# Comencemos cargando la biblioteca tidyr y el dataframe marketing, contenido
# en el paquete datarium

install.packages("datarium")
library(datarium)
library(tidyr)

str(marketing)

# Ahora añadiremos valores faltantes a la base marketing
datosNA <- marketing
datosNA$youtube[5] <- NA
datosNA$facebook[10] <- NA
datosNA$newspaper[10] <- NA
datosNA$sales[15] <- NA

# observemos la base
datosNA

# Contemos en número de datos faltantes
paste("Número de datos faltanes:", sum(is.na(datosNA)))

# Remover las filas es una forma de lidiar con los datos faltantes, pero tiene
# el inconveniente de que perdemos observaciones. En la próxima sesión, 
# aprenderemos otras formas de lidiar con datos faltantes sin perder observaciones


#Ahora utilicemos drop_na() para remover las filas con datos faltantes

datos_noNA <- drop_na(datosNA)
sum(is.na(datos_noNA))
nrow(datos_noNA)

