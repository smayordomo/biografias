# Cargamos los datos
data(mtcars)
attach(mtcars)

# Tabla de frecuencias
mi_tabla <- table(cyl)
mi_tabla

# Una fila, dos columnas
par(mfrow = c(1, 2))

# Gráfico de barras de frecuencia absoluta
barplot(mi_tabla, main = "Frequencia absoluta",
        col = rainbow(3))

# Gráfico de barras de frecuencia relativa
barplot(prop.table(mi_tabla) * 100, main = "Frequencia relativa (%)",
        col = rainbow(3))

par(mfrow = c(1, 1))

#Comentario mas ferson que son personas diacríticas

