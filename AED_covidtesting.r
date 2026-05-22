#----------------------------------------------------------------------#
#          ANÁLISIS EXPLORATORIO: DATASET COVID TESTING                #
#                                                                      #
#  Este script es una guía para explorar un conjunto de                #
#  datos, limpiar la información y crear visualizaciones               #
#----------------------------------------------------------------------#


### PASO 1: Carga y Preparación de los Datos 📦 ###

# Carga de librerías esenciales para el análisis.

install.packages(c("medicaldata", "ggplot2", "skimr"))

library(medicaldata)
library(ggplot2)
library(skimr)

# Cargamos el conjunto de datos "covid_testing".
data("covid_testing")

# Asignamos los datos a un dataframe para facilitar su manejo.
df_original <- covid_testing


### PASO 2: Inspección General de los Datos 

# La función skim() nos da un resumen completo y muy fácil de leer 
# para una primera inspección.
cat("--- Resumen Detallado del Dataset con skim() ---\n")
skim(df_original)


### PASO 3: Limpieza y Filtrado de Datos 

# Como vimos con skim(), hay valores faltantes (NA).
# Para este análisis, crearemos un dataframe que contiene únicamente
# las filas completas, eliminando los NAs con na.omit().
df <- na.omit(df_original)

# Comprobamos cuántas filas nos quedaron después de la limpieza.
cat("\nFilas originales:", nrow(df_original), "\n")
cat("Filas después de limpiar NAs:", nrow(df), "\n")


### PASO 4: Análisis Gráfico y Filtrado Específico ###

# Histograma de la distribución de edades.
hist(df$age,
     main = "Distribución de Edades de los Pacientes",
     xlab = "Edad",
     ylab = "Frecuencia",
     col = "skyblue")

# Filtramos para analizar solo pruebas con un resultado de CT < 45.
df_ct_filtrado <- df[df$ct_result < 45, ]

# Histograma de los datos ya filtrados.
hist(df_ct_filtrado$ct_result,
     main = "Distribución de Resultados CT (Valores < 45)",
     xlab = "Valor CT",
     col = "lightgreen")


### PASO 5: Visualización Avanzada con ggplot2 ###

# Creamos un "lienzo" base de ggplot con nuestros datos filtrados.
p <- ggplot(df_ct_filtrado, aes(x = ct_result))

# Le añadimos una capa de geometría, como un histograma.
p + geom_histogram(aes(fill = ..count..), # El color cambia según la frecuencia
                   color = "black",
                   binwidth = 1) +
    scale_fill_gradient("Frecuencia", low = "lightblue", high = "navy") +
    labs(title = "Histograma de Resultados CT con ggplot2",
         x = "Valor CT",
         y = "Frecuencia")


### PASO 6: Análisis Comparativo con Faceting ###

# `facet_wrap()` Nos permite crear una matriz de
# gráficos para comparar distribuciones entre diferentes categorías.

# ¿Cómo se compara la distribución de los resultados CT entre géneros?
p + geom_histogram(aes(fill = gender), # Usamos un color para cada género
                   color = "black",
                   show.legend = FALSE, # Ocultamos la leyenda porque los títulos son claros
                   binwidth = 2) +
    facet_wrap(~ gender) + # Crea un gráfico para cada categoría en la columna 'sex'
    labs(title = "Comparativa de Resultados CT por Género",
         x = "Valor CT",
         y = "Frecuencia")