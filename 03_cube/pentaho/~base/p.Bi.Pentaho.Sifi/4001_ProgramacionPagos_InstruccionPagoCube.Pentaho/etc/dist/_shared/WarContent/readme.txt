4001_ProgramacionPagos_InstruccionPagoCube.Pentaho

----------------------------------------------------------------------------
 Introducci�n
----------------------------------------------------------------------------

Este proyecto posee la definicion del cubo de informaci�n relacionado con 
las instrucciones de pago creadas a traves del m�dulo de programaci�n 
y pagos en SIFI. 

----------------------------------------------------------------------------
 Procedimiento de Instalaci�n
----------------------------------------------------------------------------
Para realizar la instalaci�n del cubo es necesario ubicarse en la siguiente 
ruta del servidor Pentaho:

$PENTAHO/server/biserver-ce/pentaho-solutions/$SIFI_ROOT

Siendo
$SIFI_ROOT: Nombre de carpeta de trabajo en el servidor

Y copiar el achivo con extensi�n .xml que se encuentra en el archivo .zip 
alojado en la siguiente ruta:

Apps/400[X]_[NombreModuloSifi]_[NombreCubo]Cube.Pentaho/ target/deploy

Siendo:
- 400[X]:------------- Modulos sifi
- [X]:---------------- Identificador �nico del modulo
- [NombreModuloSifi]:- Nombre del modulo en SIFI
- [NombreCubo]:------- Nombre descriptivo del cubo creado

Ejemplo:
Apps/4001_ProgramacionPagos_InstrucionesPagoCube.Pentaho/ target/deploy