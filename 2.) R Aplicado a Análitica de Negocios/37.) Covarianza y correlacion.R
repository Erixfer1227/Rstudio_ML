# En probabilidad y estadística, la covarianza es un valor que indica el grado 
# de variación conjunta de dos variables aleatorias respecto a sus medias. 
# Es el dato básico para determinar si existe una dependencia entre ambas 
# variables y además es el dato necesario para estimar otros parámetros
# básicos, como el coeficiente de correlación lineal o la recta de regresión.

# Cuando los valores altos de una de las variables suelen mayoritariamente 
# corresponderse con los valores altos de la otra, y lo mismo se verifica 
# para los pequeños valores de una con los de la otra, se corrobora que 
# tienden a mostrar comportamiento similar lo que se refleja en un valor 
# positivo de la covarianza1???
# Por el contrario, cuando los valores altos de una variable suelen 
# corresponder mayoritariamente a los menores valores de la otra, expresando 
# un comportamiento opuesto, la covarianza es negativa.

####
# Apredamos a calcular la Covarianza entre dos variables
# Utilizaremos dos variables de airquality
# airquality
viento = airquality$Wind
temperatura = airquality$Temp
cov(viento,temperatura)

# El signo de la covarianza, expresa la tendencia en la relación 
# lineal entre las variables. Un signo negativo, nos indicaría que viento y
# temperatura tiene una relación inversa: a menor viento, mayor temperatura
# y hace más calor, lo cual es intuitivo...

# La magnitud requiere un esfuerzo adicional de interpretación: sabemos 
# interpretar el signo negativo, pero la magnitud de 15 no nos dice nada...
  # La versión normalizada de la covarianza, el coeficiente de correlación 
# indica la magnitud de la especificidad de la relación lineal.

#####
# En estadística, el coeficiente de correlación de Pearson es una 
# medida de dependencia lineal entre dos variables aleatorias cuantitativas.
# A diferencia de la covarianza, la correlación de Pearson es 
# independiente de la escala de medida de las variables.

# De manera menos formal, podemos definir el coeficiente de correlación de 
# Pearson como un índice que puede utilizarse para medir el grado de relación 
# de dos variables siempre y cuando ambas sean cuantitativas y continuas.

#####
# Ahora calculemos la correlación entre las variables viento y temperatura que
# creamos previamente
cor(viento,temperatura)
# Si el coeficiente hubiese sido 1, diríamos que es una correlación perfecta
# Si hubiese sido cero, entonces no existiría relación alguna entre las variables
# Un coeficiente de -45% nos indica que las variables relacionadas inversamente
# pero que esta relación no es tan fuerte.