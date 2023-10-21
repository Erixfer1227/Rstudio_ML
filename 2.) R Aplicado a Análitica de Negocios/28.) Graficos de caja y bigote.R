## También conocido como box plot, o box and whiskers plot en ingles
# Es un método estandarizado para representar gráficamente una serie de datos numéricos 
# a través de sus cuartiles. De esta manera, el diagrama de caja muestra a simple vista 
# la mediana y los cuartiles de los datos,??? pudiendo también representar los valores 
# atípicos de estos. 

# El diagrama de caja es compuesto de los siguientes elementos:
  
# Rango (sin datos atípicos)
# Datos atípicos.
# Rango intercuartil (también conocido como RIC)
# Cuartiles (denotados como Q1, Q2 y Q3)
# Mediana (Q2)
# Mínimo y máximo.

# En R, el diagrama de caja (y el diagrama de bigotes) se crea usando la función boxplot ().

# La función boxplot () toma cualquier número de vectores numéricos, dibujando una 
# gráfica de caja para cada vector.

# También puede pasar una lista (o marco de datos) con vectores numéricos como 
# sus componentes. Usemos el conjunto de datos integrado de calidad del aire que 
# tiene "Mediciones diarias de la calidad del aire en Nueva York, de mayo a septiembre 
# de 1973". - Documentación R.

str(airquality)

boxplot(airquality$Ozone)

# Podemos ver que los datos por encima de la mediana están más dispersos. 
# También podemos notar dos valores atípicos en el extremo superior.

# Podemos pasar parámetros adicionales para controlar el aspecto de nuestra trama.
# Puede leer sobre ellos en la sección de ayuda? Boxplot.

# Algunos de los que se utilizan con frecuencia son, main-para dar el título, 
# xlab e ylab-para proporcionar etiquetas para los ejes, col para definir el color, etc.

# Además, con el argumento horizontal = TRUE podemos trazarlo horizontalmente y 
# con notch = TRUE podemos agregar una muesca al cuadro.

boxplot(airquality$Ozone,
        main = "Ozono en partes por billon en New York 1973",
        xlab = "Partes por Billón",
        ylab = "Ozono",
        col = "skyblue",
        border = "blue",
        horizontal = TRUE,
        notch = TRUE
)

# La función boxplot () devuelve una lista con 6 componentes que se muestran a 
# continuación.

b <- boxplot(airquality$Ozone)
b

# Como podemos ver arriba, se devuelve una lista que tiene stats, 
# con la posición de los extremos superior / inferior de los bigotes y el cuadro
# junto con la mediana, 

# n-el número de observación con el que se dibuja la gráfica de caja (observe que 
# las NA no se tienen en cuenta)

# conf-extremos superior / inferior de la muesca: 

# out valor de los valores atípicos superiores

# grupo: un vector de la misma longitud que out cuyos elementos indican a qué grupo 
# pertenecen los valores atípico y 
# names: un vector de nombres para los grupos.

## Multiples Diagramas de Caja
# Podemos dibujar múltiples diagramas de caja en un solo gráfico, pasando una lista, 
# marco de datos o múltiples vectores.

# Consideremos el campo de ozono y temperatura del conjunto de datos de calidad del 
# aire. Generemos también una distribución normal con la misma media y desviación 
# estándar y grafiquemos una al lado de la otra para comparar.

# preparemos los datos
ozono <- airquality$Ozone
temperatura <- airquality$Temp
# generemos una distribuión normal con media y distribución estandar
ozono_normal <- rnorm(200,mean=mean(ozono, na.rm=TRUE), sd=sd(ozono, na.rm=TRUE))
temperatura_normal <- rnorm(200,mean=mean(temperatura, na.rm=TRUE), sd=sd(temperatura, na.rm=TRUE))

# Ahora grafiquemos las cuatro variables que creamos, utilizando at and names para distinguirlos
boxplot(ozono, ozono_normal, temperatura, temperatura_normal,
        main = "Graficos multiples de Comparacion",
        at = c(1,2,4,5),
        names = c("ozono", "normal", "temp", "normal"),
        col = c("blue","red"),
        las = 2,
        border = "brown",
        horizontal = TRUE,
        notch = TRUE
)