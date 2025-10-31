# Bulletproof Car Rental Architecture
Proyecto para el diseño de la arquitectura de un software para la renta de vehículos blindados.

## Arquitectura

![Car rental software Architecture](softwareArchitecture.png "Arquitectura del sistema de renta de vehículos blindados")

La arquitectura propuesta cumple con los requisitos para el manejo de transacciones y análisis de los datos que genere la aplicación. Todos los servicios de la app se encontrarán en un único grupo de recuros.

## Servicios a Utilizar para el Despliegue
Se propone utilizar los siguientes servicios de Azure para cumplir con los requisitos de la aplicación:

### App Service Plan
Se debe desplegar un app service plan que contenga dos webapps para el despliegue de la UI y la API.

### Base de Datos en SQL Server con Azure SQL: OLTP y Data Warehouse 
Se propone desplegar un SQL Server como servidor de bases de datos que contenga dos bases de datos: La base de datos transaccional de la app (OLTP) y una base de datos para almacenar registros históricos (Data Warehouse).

Se propone esta solución para mantener el rendimiento en la base de datos transaccional una vez esta tenga cantidad masivas de registros. Estos registros históricos deben de moverse al Data Warehouse  para luego poder ser analizados.

## Proceso de ETL en Batch: Azure Data Factory
Se propone utilizar Azure Data Factory como servicio de batch ETL para el movimiento de los datos de la base OLTP a el Data Lake.

Azure Data Factory ofrece servicios de ETL ya programados y que pueden ejecutarse periódicamente, por lo que los ETL pueden ejecutarse en batch en momentos que la app no tenga una gran cantidad de usuarios activos.


### Data Lake: Blob Storage
Se propone utilizar un Blob Storage como data lake para almacenar los datos históricos y logs, en formato JSON, de la aplicación. 

Almacenar los datos en un data lake permitirá que los datos sean accesibles tanto para su análisis en el Data Warehouse, análisis en Spark y proyectos futuros.

Además, utilizando el almacenamiento en tiers, la solución puede ser más económica.

### Plataforma de Análisis Avanzado: Data Bricks
Databricks debe ser la plataforma de análisis avanzado por su soporte con Apache Spark y notebooks colaborativos, cumpliendo así con los requisitos propuestos para el proyecto. 

Los modelos y resultados generados en databricks se almacenarán en el Data Lake para uso posterior.

### Gestión de Secretos: Azure Data Vault
Utilizar la gestión de secretos de azure permitirá almacenar las claves de los distintos servicios de manera más segura, permitiendo el acceso únicamente a los servicios del sistema.


### Análisis de datos: Power BI
Se propone conectar Power BI con el Data Warehouse para poder poder generar reportes de los datos históricos de la aplicación.
