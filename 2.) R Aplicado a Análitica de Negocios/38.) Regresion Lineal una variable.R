###
# Para este ejemplo, usaremos el conjunto de datos "cars" que viene preinstaladao
# en R y que por su simplicidad es muy  
# conveniente para ilustrar la regresión lineal de una manera simple y fácil de 
# entender. Puede acceder a este conjunto de datos simplemente escribiendo 
# cars en su consola R. 
# Encontrará que consta de 50 observaciones (filas) y 2 variables (columnas): 
# distancia y velocidad. Imprimamos las primeras seis observaciones aquí.

str(cars)
cars

# Antes de comenzar a construir el modelo de regresión, es una buena práctica
# analizar y comprender las variables. El análisis gráfico y el estudio de
# correlación a continuación ayudarán con esto.

# Para el análisis gráfico, utilizaremos ggplot para elaborar un gráfico de 
# dispersión, con una línea de tendencia suavizada

graficars = ggplot(cars, aes(x = speed, y = dist)) + 
  geom_point() +
    stat_smooth(method = "lm",
              col = "skyblue",
              se = FALSE,
              size = 1)
    
graficars

# Como podemos observar, la gráfica sugiere una relación lineal entre las
# variables velocidad y distrancia. Calculemos la correlación para confirmar
# esta relación.

# La correlación es una medida estadística que sugiere el nivel de dependencia
# lineal entre dos variables, que ocurren en pares, al igual que lo que tenemos
# aquí en speed y dist. La correlación puede tomar valores entre -1 y +1. 
# Si observamos para cada instancia donde la velocidad aumenta, 
# la distancia también aumenta junto con ella, entonces hay una alta 
# correlación positiva entre ellos y por lo tanto la correlación entre ellos 
# será más cercana a 1. Lo contrario es cierto para una relación inversa, 
# en la que caso, la correlación entre las variables será cercana a -1.

# Un valor más cercano a 0 sugiere una relación débil entre las variables. 
# Una correlación baja (-0,2 <x <0,2) probablemente sugiere que gran parte
# de la variación de la variable de respuesta (Y) no se explica por el
# predictor (X), en cuyo caso, probablemente deberíamos buscar mejores 
# variables explicativas.

## Ahora calculemos la correlación
cor(cars$speed, cars$dist) 

# Una correlación de 0.8 nos indica que hay una relación fuerte entre las
# variables, no necesariamente de causalidad

## Ahora tiremos la regresión
## la sintaxis de la regresión lineal es muy sencilla
## lm(formula = y ~ x, data = nombredeldataset)

lm(formula = dist ~ speed, data = cars)

## 
# El intercepto es el valor en donde la gráfica toca el eje y (donde x=0)
# No intenten interpretarlo, no siempre hace sentido
# El coeficiente de 3.932 si tiene interpretación: Por cada unidad de velocidad
# el carro recorre casi 4 unidades de distancia.
