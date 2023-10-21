## 

# En estadística, un histograma es una representación gráfica de una variable 
# en forma de barras, donde la superficie de cada barra es proporcional a la 
# frecuencia de los valores representados. Sirven para obtener una "primera vista" 
# general, o panorama, de la distribución de la población, o de la muestra, 
# respecto a una característica, cuantitativa y continua (como la longitud o el peso). 
# De esta manera ofrece una visión de grupo permitiendo observar una preferencia, 
# o tendencia, por parte de la muestra o población por ubicarse hacia una 
# determinada región de valores.

# Para elaborar un histograma en R 
# Lo primero que debemos hacer es cargar los datos que vamos a graficar
# Podría importar datos csv como hemos visto en tutoriales anteriores
# Para fines del tutorial, voy a utilizar la base trees que viene precargada
# en R. Reviso la estructura de la base

str(trees)

# Quiero graficar la altura de los árboles, es decir la variable $Height

qplot(trees$Height, geom="histogram") 



# Otra forma de graficarlo es utilizando la función ggplot
# Para ello, utilizemos siempre la columna Height del conjunto de datos trees

ggplot (data = trees, aes (Height)) + geom_histogram()

# Pero, ¿cuál es la diferencia entre estas dos opciones?
# Se supone que la función qplot () hace el mismo gráfico que ggplot (), 
# pero con una sintaxis más simple. De hecho el nombre qplot, viene de
# quick plot o gráfico rápido. Mientras que ggplot () permite el máximo de funciones 
# y flexibilidad, qplot () es una función más sencilla pero menos 
# personalizable de ggplot.

# Luego de recibir el mensaje, puedo agregar otros parámetros en q plot

qplot(trees$Height,
      geom="histogram",
      binwidth = 1,  
      main = "Histograma de Altura de Cerezos Negros", 
      xlab = "Altura en metros",  
      fill=I("white"), 
      col=I("blue"))
