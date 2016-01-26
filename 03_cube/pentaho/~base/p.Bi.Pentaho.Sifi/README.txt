===================================================================================================
 Proyecto p.Bi.Pentaho.Sifi
===================================================================================================

 Contiene los cubos de informacion que se han creado para cada uno de los modulos de sifi. 
 Cada cubo presenta la definicion de cubo sobre pentaho (.xml) y la definicion del modelo
 estrella sobre el datawarehouse (scripts bd)

   
* Convenciones para los nombres de los cubos por modulo
-------------------------------------------------------
  1.Se deben crear 2(dos) carpetas con la siguiente estructura
  
	  400[X]_[NombreModuloSifi]_[NombreCubo]Cube.Db
	  400[X]_[NombreModuloSifi]_[NombreCubo]Cube.Pentaho
	  
	  Siendo:
	  - 400[X]:............... Modulos sifi
	  - [X]:.................. Identificador unico del modulo
	  - [NombreModuloSifi]:... Nombre del modulo en SIFI  	 
	  - [NombreCubo]:......... Nombre descriptivo del cubo creado
	  
	  Ejemplo:
	  4001_ProgramacionPagos_InstrucionesPagoCube.Db
	  4001_ProgramacionPagos_InstrucionesPagoCube.Pentaho
	  
  2. En la carpeta .Db se deben colocar el script _dcl.sql necesariop 
  para establecer todos los permisos sobre la base de datos SIFI.
  
  3. En la carpeta .Pentaho se debe colocar el archivo .xml con la
  definicion del cubo creado  
  
  