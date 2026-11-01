# Análisis multivariado: PCA y clasificación de países de América

**Asignatura:** Análisis Multivariado  
**Carrera:** Licenciatura en Estadística  
**Institución:** Universidad de la República (Udelar), Uruguay  
**Año:** 2021  
**Autores:** Miguel Barreto, Leonardo Perazza y Macarena Perdomo

## Descripción

Proyecto académico de análisis exploratorio multivariado de indicadores sociodemográficos y sanitarios de países y territorios de América. La primera entrega estudia **48 países y territorios y 22 variables originales**, a partir de datos atribuidos en el informe a la Organización Panamericana de la Salud (OPS). Se aplican técnicas de **análisis de componentes principales (PCA)** para explorar la estructura de variabilidad entre observaciones.

El material de trabajo conservado también incluye scripts de **clasificación jerárquica / análisis de conglomerados** que corresponden a una segunda etapa de trabajo. No se adjunta aquí un informe final de esa etapa.

## Metodología

- Exploración de datos faltantes y preparación de variables.
- Análisis de componentes principales y criterios de selección de componentes.
- Interpretación de valores propios, varianza explicada, contribuciones y cosenos cuadrados.
- Estudio de observaciones potencialmente influyentes y alternativas de tratamiento.
- Análisis por subgrupos de variables.
- Exploración de agrupamientos jerárquicos mediante los scripts conservados.

## Archivos

| Ruta | Contenido |
| --- | --- |
| `reports/informe_pca_2021.pdf` | Informe académico de la primera entrega, conservado sin modificaciones. |
| `scripts/analisis_pca.R` | Script académico original asociado al análisis de componentes principales. |
| `scripts/analisis_clustering.R` | Script de trabajo de clasificación jerárquica. |
| `scripts/indicadores.R` | Funciones auxiliares citadas por el script de clustering. |
| `data/Data_2.xlsx` | Base de trabajo conservada en los archivos del proyecto. |
| `data/base_comp.xlsx` | Base de componentes conservada en los archivos de la segunda etapa. |

## Tecnologías

R, análisis multivariado, PCA, análisis de conglomerados, visualización y preparación de datos.

## Nota sobre reproducibilidad

Los scripts se preservan como **material académico original de 2021**. Contienen referencias a objetos de una sesión de R y, en ciertos casos, rutas locales o dependencias no incluidas; **no se ha verificado su ejecución autónoma** en la estructura de carpetas actual. Las bases incluidas se seleccionaron de los archivos de trabajo y deben contrastarse con el origen de los datos antes de difundir el repositorio públicamente.

## Autoría y alcance

Trabajo académico grupal de Miguel Barreto, Leonardo Perazza y Macarena Perdomo. El informe corresponde a la **primera entrega**; el código de clustering proviene de materiales conservados de una etapa posterior. Esta presentación no sustituye ni modifica el informe entregado en 2021.
