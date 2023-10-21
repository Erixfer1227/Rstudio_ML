###
# Las medidas de asimetría son indicadores que permiten establecer el grado 
# de simetría (o asimetría) que presenta una distribución de probabilidad de 
# una variable aleatoria sin tener que hacer su representación gráfica. Como 
# eje de simetría consideramos una recta paralela al eje de ordenadas que pasa 
# por la media de la distribución. Si una distribución es simétrica, existe el
# mismo número de valores a la derecha que a la izquierda de la media, por tanto, 
# el mismo número de desviaciones con signo positivo que con signo negativo. 
# Decimos que hay asimetría positiva (o a la derecha) si la "cola" a la derecha 
# de la media es más larga que la de la izquierda, es decir, si hay valores 
# más separados de la media a la derecha. Diremos que hay asimetría negativa 
# (o a la izquierda) si la "cola" a la izquierda de la media es más larga que 
# la de la derecha, es decir, si hay valores más separados de la media a la 
# izquierda.

# La asimetría resulta útil en muchos campos. Muchos modelos simplistas 
# asumen una distribución normal, esto es, simétrica en torno a la media.
# La distribución normal tiene una asimetría cero. Cuando el tamaño de la
# muestra aumenta cualquier población tiende a volverse simétrica. Una 
# asimetría positiva implica que hay más valores distintos a la derecha de 
# la media.

# Las medidas de asimetría, sobre todo el coeficiente de oblicuidad, 
# junto con las medidas de apuntamiento o curtosis se utilizan para contrastar
# si se puede aceptar que una distribución estadística sigue la distribución 
# normal. Esto es necesario para realizar numerosos contrastes estadísticos 
# en la teoría de inferencia estadística.


# Ahora ilustremos colo calcular la oblicuidad y la kurtosis en R


# Para la oblicuidad, usaremos la función skewness() de la libreria moments 
install.packages("moments")
library(moments) 


distancia <- c(23.45, 14.64, 17.69, 13.53, 15.65, 27.27, 25.24, 21.05, 21.65, 20.92, 22.61, 15.71, 22.04, 22.60, 24.25)



skewness(distancia)

kurtosis(distancia)

# Una oblicuidad negativa, significa que la campana está cargada a la izquierda
# Una kurtosis menor 3 significa que la campana es platicurtica o achatada

# Grafiquemos

library(ggplot2)
qplot(distancia, geom = 'histogram', binwidth = 2) + xlab('Distancia en metros')


#Simulation
muestranormal <- rnorm(n = 25000, mean = 100, sd = 5)

#Skewness and Kurtosis
library(moments)
skewness(muestranormal)


kurtosis(muestranormal)



#Ahora grafiquemos el histograma
library(ggplot2)
qplot(muestranormal, geom = 'histogram', binwidth = 2) + xlab('Muestra Simulada Distribución Normal')
