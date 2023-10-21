# En las siguiente sesión, aprenderemos algunas funciones que nos facilitaran
# la limpieza de datos en R. 
# Esta puede parecer una tarea irrelevante,
# pero limpiar datos es la habilidad más fructífera que puede aprender como 
# científico de datos. Le ahorrará horas de tiempo y hará que sus datos 
# sean mucho más fáciles de visualizar, manipular y modelar con R.

# El paquete tidyverse de Hadley Wickham  
# Contiene cuatro funciones que alteran el diseño de los conjuntos de datos 
# tabulares, al tiempo que preservan los valores y las relaciones contenidos 
# en los conjuntos de datos. Estas funciones son spread(), gather(), separate()
# y unite()

#NOO Las primeras dos funciones son spread() y gather() 
# Cada uno se basa en la idea de un par clave-valor.

# Un par clave-valor es una forma sencilla de registrar información. 
# Un par contiene dos partes: una clave que explica lo que describe la 
# información y un valor que contiene la información real. 



# Cada celda de una tabla de datos contiene la mitad de un par clave-valor, 
# al igual que el nombre de cada columna. En los datos ordenados, 
# cada celda contendrá un valor y el nombre de cada columna contendrá una 
# clave, pero no es necesario que este sea el caso de los datos desordenados.

###
# Primero que nada, Instalemos y pongamos en la biblioteca el paque tidyverse
library(tidyverse)

# El conjunto de datos que usaré en esta publicación es el tabaquismo, 
# el alcohol y el (O) cáncer de esófago, que se incluye de forma 
# predeterminada en la R. Echemos un vistazo a las variables.

datos = esoph

summary(datos)
datos

# Este conjunto de datos tiene 88 filas y 5 variables compuestas por grupo 
# de edad, consumo de alcohol, tabaquismo y número de casos (cáncer de esófago)
# y controles para cada fila.

### Ilustremos la función SPREAD()
# Como podemos observar, la variable agegp tiene 6 grupos #
# (es decir, 25-34, 35-44) que tienen diferentes combinaciones de consumo
# de alcohol y consumo de tabaco. Utilicemos la función spread para
# pasar este conjunto de 
# datos de largo a ancho y crear una columna para cada grupo de edad y 
# mostrar los casos respectivos. Veamos cómo se verá el conjunto de datos.

spreadpor_edad = datos %>% 
  spread(agegp, ncases) 

spreadpor_edad

### ILUSTRACÍON DE LA FUNCIÓN GATHER()
# Como podemos observar el conjunto de datos esa mas informativo cuando
# las variables estan separadas por por cada grupo de edad. 
# Sin embargo, si quisieramos regresar a la estructura original, 
# podriamos hacerlo con la función gather().


spreadpor_edad %>% 
  gather(agegp, ncases, -alcgp, -tobgp, -ncontrols) %>% 
  filter(!is.na(ncases)) 

# Le pedimos que recopile las filas por grupo de edad y número de casos
# y con filter, le pedimos que ignore aquellas observaciones con valores
# faltantes

###
#Ahora ilustremos la función separate
# Esta función se utiliza para crear varias columnas a partir de una sola. 
#A continuación, vamos separar la variable agegp en otras dos variables
#año mínimo y máximo.

datos

datos %>% 
  separate(agegp, into = c("min", "max"), sep = "-")

## Ilustración de la función unite o unir

# Lo opuesto a separate es unite. Usando el ejemplo anterior, uniré la 
# variable min y max en agegp como estaba en el conjunto de datos original.

datos2 = datos %>% 
  separate(agegp, into = c("min", "max"), sep = "-")
datos2 %>% 
  unite(agegp, min, max, sep = "-")
