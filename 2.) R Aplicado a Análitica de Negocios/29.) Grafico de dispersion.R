# Veamos cómo funciona ggplot con el conjunto de datos mtcars. 
# Empiece trazando un diagrama de dispersión de la variable mpg y la variable drat.
# drat es el torque del vehículo

#Primero pasa el conjunto de datos mtcars a ggplot.
#Dentro del argumento aes (), agrega el eje xy el eje y.
#El signo + significa que desea que R siga leyendo el código. 
# Hace que el código sea más legible al romperlo.
#Utilice geom_point () para el objeto geométrico.
str(mtcars)
ggplot(mtcars, aes(x = drat, y = mpg)) + geom_point()

# Muchas veces nos resultará interesante distinguir entre grupos en nuestro grafico
# de dispersion. Cambiemos el color de las observaciones por el tipo 


ggplot(mtcars, aes(x = drat, y = mpg)) +
  geom_point(aes(color = factor(gear)))

# El aes () dentro de geom_point () controla el color del grupo. 
# El grupo debe ser una variable factorial. 
# Por lo tanto, convierte la marcha variable en un factor.

# Cambiar la escala de los datos es una gran parte del trabajo del científico de datos. 
# En raras ocasiones, los datos vienen normalizados
# en forma de campana. Una solución para hacer 
# que sus datos sean menos sensibles a los valores atípicos es cambiar su escala.

# Transforma las variables x e y en log () directamente dentro del mapeo aes ().
# Tenga en cuenta que se puede aplicar cualquier otra transformación, como 
# estandarización o normalización.
# En total, tienes el código aes (color = factor (engranaje)) que cambia el color 
# de los puntos.

ggplot(mtcars, aes(x = log(drat), y = log(mpg))) +
  geom_point(aes(color = factor(gear)))

# Puede agregar otro nivel de información al gráfico. 
# Puede trazar el valor ajustado de una regresión lineal.
# Se intervalo de confianza

migrafica <- ggplot(mtcars, aes(x = log(drat), y = log(mpg))) +
  geom_point(aes(color = factor(gear))) +
  stat_smooth(method = "lm",
              col = "black",
              se = FALSE,
              size = 1)
migrafica

# Ahora agreguemosle títulos a nuestro gráfico

migrafica +
    labs(
    x = "Millas por Galón, escala logarítmica",
    y = "Torque, escala logarítmica",
    color = "Velocidades de Tansmisión",
    title = "Relación entre el Torque y las Millas por Galón",
    subtitle = "Segmentacíon por Número de Velocidades de Transmisión",
    caption = "Elaboración propia con base a fuentes secundarias"
  )

ggsave("migrafica.png")
