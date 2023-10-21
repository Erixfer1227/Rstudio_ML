##

# Imagine que queremos explorar la relación entre la distancia y el retraso
# promedio para cada ubicación. Usando lo que sabemos sobre dplyr, agrupemos
# los datos por destino, y luego calculemos el número de vuelos, distancia y
# tiempo de retraso

por_destino <- group_by(flights, dest)
retrasos <- summarise(por_destino,
                   vuelos = n(),
                   distancia = mean(distance, na.rm = TRUE),
                   retraso = mean(arr_delay, na.rm = TRUE)
)

## Ahora grafiquemos

ggplot(data = retrasos, mapping = aes(x = distancia, y = retraso)) +
  geom_point(aes(size = vuelos), alpha = 1/3) +
  geom_smooth(se = FALSE)

# Parece que los retrasos aumentan con la distancia hasta ~ 750 millas
# y luego disminuya. Tal vez a medida que los vuelos se alargan, hay más
# capacidad para compensar retrasos en el aire?