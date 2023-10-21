# Los gráfico de barras o gráfico de columnas, son una forma de representar 
# gráficamente un conjunto de datos o valores mediante barras rectangulares de 
# longitud proporcional a los valores representados. Los gráficos de barras pueden 
# ser usados para comparar cantidades de una variable en diferentes momentos o 
# diferentes variables para el mismo momento. Las barras pueden orientarse 
# horizontal y verticalmente.

# Para elaborar graficos de barra utilizaremos la funcion
# geom_bar () hace que la altura de la barra sea proporcional al número de casos
# en cada grupo.
# geom_bar () usa stat_count () por defecto: 
# cuenta el número de casos en cada posición x. 

# Podríamos cargar un archivo csv como aprendimos en sesiones anteriores
# Pero por facilidad, utilizaré la base mpg o millas por galòn que viene incluida en R 

# Veamos la estrucutra de la base
str(mpg)

# Utilicemos geom_bar para graficar el numero de casos en cada clase de vehiculo

ggplot(mpg, aes(class)) + geom_bar()
# Ahora cambiemos la orientaciòn del grafico hacia el eje y
ggplot(mpg) + geom_bar(aes(y = class))

# Ahora elaboremos un grafico de barras apiladas segmentado por el tipo de traccion

ggplot(mpg, aes(class)) + geom_bar(aes(fill = drv))


# Cambiemos a orientacion horizontal
ggplot(mpg, aes(y = class)) +   geom_bar(aes(fill = drv)) 
     