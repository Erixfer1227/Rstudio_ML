####
# Cuando llamamos una funci?n con un argumento de tipo incorrecto,
# R intentar? de convertir dichos valores (coercitivamente o a la fuerza)
# para que la funci?n trabaje. Por ejemplo, supongamos que definimos
# el siguient vector:
  
x <- c(1L, 2L, 3L, 4L, 5L)
as.data.frame(x)
typeof(x)
class(x)

# Ahora cambiemos el segundo elemento por "pelota"
# R autom?ticamente cambiar? la clase del objeto a "caracter"

x[2] <- "pelota"
as.data.frame(x)
typeof(x)
class(x)

# R tambi?n nos permite que nosotros forcemos la clase del objeto

y<-c(0, 1, 0, 3) 
as.data.frame(y)
typeof(y)
class(y)

# Cambiemoslo a caracter
z= as.character(y) 
as.data.frame(z)
typeof(z)
class(z)

