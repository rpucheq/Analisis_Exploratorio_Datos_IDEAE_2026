# Instalacion de R y RStudio

Esta guia explica como instalar R y RStudio para trabajar con los scripts de este repositorio.

## 1) Instalar R

1. Ir al sitio oficial de CRAN:
   https://cran.r-project.org/
2. Entrar en Download R for Windows.
3. Descargar la version mas reciente de base R.
4. Ejecutar el instalador y mantener la configuracion por defecto.

Nota: Si usas macOS o Linux, en CRAN tambien estan las instrucciones oficiales para cada sistema.

## 2) Instalar RStudio Desktop

1. Ir al sitio oficial de Posit:
   https://posit.co/download/rstudio-desktop/
2. Descargar RStudio Desktop (version gratuita).
3. Ejecutar el instalador.
4. Abrir RStudio y verificar que detecte tu instalacion de R.

## 3) Verificar instalacion

En RStudio, abrir la consola y ejecutar:

```r
R.version.string
```

Si devuelve la version de R, la instalacion esta correcta.

## 4) Instalar paquetes necesarios para este repositorio

En la consola de R o RStudio ejecutar:

```r
install.packages(c("medicaldata", "ggplot2", "skimr"))
```

## 5) Probar ejecucion del script

Desde la raiz del repositorio:

```bash
Rscript AED_covidtesting.r
```

Si no hay errores, el entorno esta listo para trabajar.
