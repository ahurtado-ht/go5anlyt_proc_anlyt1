4001_ProgramacionPagos_InstruccionPagoCube.Db

----------------------------------------------------------------------------
 Introducción
----------------------------------------------------------------------------

Este proyecto posee los scripts de instalacion para la construccion del cubo
de informacion: "InstruccionesPagoCube"

----------------------------------------------------------------------------
 Procedimiento de Instalación
----------------------------------------------------------------------------
1. Conectarse con el usuario que posee los permisos DBA sobre la base de 
datos SIFI(por defecto vu_sfi) y ejecutar el script:

"01_[NombreCubo]_dcl.sql"

El script mencionado se encuentra dentro del archivo .zip que se aloja en 
la siguiente ruta:

Apps/400[X]_[NombreModuloSifi]_[NombreCubo]Cube.Db/target/deploy

Siendo:
- 400[X]:------------- Modulos sifi
- [X]:---------------- Identificador único del modulo
- [NombreModuloSifi]:- Nombre del modulo en SIFI
- [NombreCubo]:------- Nombre descriptivo del cubo creado

Ejemplo:

Apps/4001_ProgramacionPagos_InstrucionesPagoCube.Db/target/deploy

2. Conectarse al usuario de la base de datos datawarehouse 
(por defecto pentaho_sfi) y ejecutar los siguientes scripts para realizar 
la instalación de los objetos asociados al cubo de información:

"02_[NombreCubo]_ddl.sql"

El script mencionado se encuentra en la siguiente ruta:

Apps/400[X]_[NombreModuloSifi]_[NombreCubo]Cube.Db/target/deploy

Siendo:

- 400[X]:------------- Modulos sifi
- [X]:---------------- Identificador único del modulo
- [NombreModuloSifi]:- Nombre del modulo en SIFI
- [NombreCubo]:------- Nombre descriptivo del cubo creado

Ejemplo:
Apps/4001_ProgramacionPagos_InstrucionesPagoCube.Db/target/deploy
