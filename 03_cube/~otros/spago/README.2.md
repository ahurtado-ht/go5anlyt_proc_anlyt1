---------------------------------------------
SPAGO-META
---------------------------------------------
crear nuevo proyecto.


crear datasource

datasource
url=jdbc:oracle:thin:@localhost:1521:xe
user=anlyt
pass=anlyt
driver=oracle.jdbc.OracleDriver


en resurces, incluir una conexion al servidor de spago
url: localhost:8080/SpagoBI
usuario: biadmin
password: biadmin
nombre: LocalSpagoBI




crear el modelo en spago bi
luego exportarlo como un mondrian template
> editarlo dado que genera un error (hasAll="true" debe ser dejado)
> o bien exportar el mismo modelo realizado con saiku


despues dar click derecho en el xml de mondrian y decirle deploy olap template

entrar a spagobi (usuario biadmin/biadmin)
entrar al icono folder
	seleccionar la subcarpeta biadmin
	dar click en las propiedades
		cambiar el engine de OlapEngine a WhatIfEngine (nuevo olap)




-------------------------------------------
all-in-one-spagobi
-------------------------------------------

driver=colcoar en spago_dist/lib


self service BI
- crear datasource
- creat dataset (select * from op_evento_raw)

-------------------
-geoserver
---------------------------
usuario admin/geoserver
puerto: 8090


configuracion/serversettings/configurationmanagement
	

	
-----------------------------------------
instalar plugin en qgis
- table manager
- openlayers plugin
- osm downloader
- osm route
luego ir a web/openlayers plugin / openstreetmap / openstreetmap





-----------------------------------------
desargar mapa de division administrativa colombia: 
- http://www.gadm.org/country (seleccionar colombia/shapefile)
	se va a usar este por defecto
	-> el mapa 3 que tiene la division de ciudades
	
- o de http://gis.stackexchange.com/questions/167247/where-can-i-find-colombia-municipality-geometries
- o del agusti codazzi (igac, sistema sigot, buscar mapa de cobertura de la tierra: SIGOT_Cobertura de la Tierra_IGAC_(2008): muy lento)
	-> dar click en visualizar
	-> (limite departamental de colombia)
	-> exportar en formato shapefile
- csv de municioios y departamentos con ubicacion:
		http://blog.jorgeivanmeza.com/2008/09/departamentos-y-municipios-de-colombia-actualizacion-20080915/
		
-----------------------------------------


geoserver

-> crear workspace: bonos_ws / namespace: http://bonos.htsoft.co
-> crear store: con shapefile de departamentos
	(nombre:ColombiaMapQgis1_Ds)
	(archivo col_adm1)
-> layers: 
	seleccionar crear un nuevo recurso
	native-srs: EPSG:23032
	declared-srs:  EPSG:4326
	srs-handling: reproject-native-to-declared
	bounding-box: compute
-> irse a layer preview y seleccionar el layer

		
-> nuevo dataset
	con la consulta siguiente: DS_ANLYT_ColombiaMapQgis1
	(desc: DS_ANLYT_ColombiaMapQgis1)
	dataset type: Query
	datasource: ht_0_1_Anlyt__anlyt
	scope: public
	source: 
		-- ejemplo bonos redimidos por ciudad/comercio/caja

		select sum( op_evento.bono_valor ) valor_redencion ,
			   count(op_evento.bono_serial) numero_bonos_redimidos,
			   --op_evento.evento_cod,
			   --op_redencion_caja.id_caja,
			   op_sucursal.RAZON_SOCIAL sucursal_razon_social,
			   op_sucursal.LATITUD latitude,
			   op_sucursal.LONGITUD longitude,
			   op_ciudad.MUNICIPIO_NOMBRE,
			   op_ciudad.DEPARTAMENTO_NOMBRE,
			   op_ciudad.DEPARTAMENTO_GEO_CODE,
			   op_ciudad.PAIS_NOMBRE,
			   op_ciudad.LATITUD ciud_latitude,
			   op_ciudad.LONGITUD ciud_longitude       
		  from op_evento
		left join op_redencion_caja on  op_evento.id_caja = op_redencion_caja.id_caja
		left join op_sucursal on op_redencion_caja.ID_SUCURSAL = op_sucursal.ID_SUCURSAL
		left join op_ciudad on op_sucursal.ID_CIUDAD = op_ciudad.ID_CIUDAD
		group by 
			   --op_redencion_caja.id_caja,
			   op_sucursal.RAZON_SOCIAL,
			   op_sucursal.LATITUD,
			   op_sucursal.LONGITUD,
			   op_ciudad.MUNICIPIO_NOMBRE,
			   op_ciudad.DEPARTAMENTO_NOMBRE,
			   op_ciudad.DEPARTAMENTO_GEO_CODE,
			   op_ciudad.PAIS_NOMBRE,
			   op_ciudad.LATITUD,
			   op_ciudad.LONGITUD    	

-> ir al folder	> subfolder Root/Analytical documents / maps
		crear documento tipo generic document
		label/name: ANLYT_ColMapQgis1
		type: locationIntelligence
		engine: gis engine
		datasource: ht_0_1_Anlyt__anlyt
		dataset: DS_ANLYT_ColombiaMapQgis1
		state:development
		visible: true
		template: ColombiaMapQgis1_Template.json  (colocar en C:\.work\All-In-One-SpagoBI-5.1.0_21012015\resources\georeport)
		
	
	
	
	
	












REFERENCIAS
- ejemplos preguntas
	http://www.math.unipd.it/~ruffatti/docs/Laboratorio_SpagoBI.pdf
- relacion con el negocio
	http://publik.tuwien.ac.at/files/PubDat_141377.pdf
- spago con gis
	http://learn-spagobi.com/books/SpagoBIandGIS.pdf
	
- google fusion tables
	