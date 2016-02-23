============================================
SAIKU 
============================================

--------------------------
MODELAMIENTO
--------------------------

se puede hacer con pentaho schema workbench
se descarga; 
se coloca driver en fodler drivers
se inicia (workbench.bat)

se crea conexion (Options > Connection)
nombre: ht_0_1_Anlyt__anlyt


--------------------------
SAIKU:SERVER-INSTALACION
--------------------------
instalar jdk
sudo dnf install java-1.8.0
sudo dnf install java-1.8.0-openjdk-devel

instalar unzip
sudo dnf install unzip

descargar 
	cd /.tools
	sudo wget http://meteorite.bi/downloads/saiku-latest.zip

descomprimir en /.work

	cd /.work
	cp /.tools/saiku-latest.zip .
	unzip saiku-latest.zip  (crea el directorio saiku-server)

descaragar driver de
http://www.oracle.com/technetwork/database/enterprise-edition/jdbc-112010-090769.html

-> copiar driver a saiku-server/tomcat/webapps/saiku/WEB-INF/lib/ (o a tomcat/lib)

 cp /.tools/ojdbc6_g.jar /.work/saiku-server/tomcat/webapps/saiku/WEB-INF/lib/

-> corre sobre tomcat-7 (necesita jdk)


--------------------------
SAIKU:PLUGINS y EMBED-CLIENT
--------------------------
ver subproyecto: go5app_portal_meanjs (READMe.2: para inatalar plugins y embed client)

--------------------------
SAIKU:SERVER-CONFIGURACION
--------------------------

# descargar proyecto
cd /.apps
git clone https://github.com/ahurtado-ht/go5anlyt_proc_anlyt1.git


# CONFIGURAR SAIKU (DATASET Y CUBO)

-> subir cubo
	Admin console [A]:
	Opcion: Administration > DataSource management> Schema > AddSchema
	subir el archivo
		-> schema name: BONOS-ANLYT-Eventos
		-> archivo: go5anlyt_proc_anlyt1\03_cube\pentaho

		
	(NOTA: si hay que refrescar el cubo, subirlo y reiniciar, dado que el datasource se encuentra enlazado)	
		
-> crear datasource
  
  -> subir app
  -> luego ir a: Admin console [A]:
	Opcion: Administration > DataSoruce management > DataSources > AddDatasource  (tipo advanced)
		
	copiar la siguiente declaracion:
	
# declaration of datasource	dev-environment
type=OLAP
name=ht_0_1_Anlyt__anlyt
driver=mondrian.olap4j.MondrianOlap4jDriver
location=jdbc:mondrian:Jdbc=jdbc:oracle:thin:@localhost:1521:xe;Catalog=mondrian:///datasources/BONOS-ANLYT-Eventos.xml;JdbcDrivers=oracle.jdbc.OracleDriver
username=anlyt
password=anlyt	

# declaration of datasource	tst-environment
type=OLAP
name=ht_0_1_Anlyt__anlyt
driver=mondrian.olap4j.MondrianOlap4jDriver
location=jdbc:mondrian:Jdbc=jdbc:oracle:thin:@bovedadb.cidux5fkd2mh.us-east-1.rds.amazonaws.com:1521:bovedadb;Catalog=mondrian:///datasources/BONOS-ANLYT-Eventos.xml;JdbcDrivers=oracle.jdbc.OracleDriver
username=anlyt
password=anlyt	


	-> reiniciar
	
# CONFIGURAR SAIKU (FOLDER)
	
  /ROOT/MISPESOS
	

--------------------------
SAIKU:SERVER-ADMINISTRACION
--------------------------
	entrar a maquina pruebas: 10.25.1.236 (sesion ssh)
	usuario martin/Meconio3 [acorde al excel compartido]

	
	subir 
		cd /.work/saiku-server
		./start-saiku.sh
		(windows: start-saiku.bat )
	bajar
		./stop-saiku.sh
	
	metodo alternativo
		finalmetne es un tomcat, asi que sirven los scritps
		normales para subirlo, bajarlo o ver logs:
		
		cd /.work/saiku-server/tomcat/bin
		-> ./startup.sh
		-> ./shutdowun.sh
		-> tailf logs/catalina.out
	(sube por el puerto 8080 por defecto)
	
	
-> subir saiku	
	start-saiku.sh
-> subir xml 
	
	
-> cambiar puerto de applciationexpress oracle: 
	sqlplus /nolog
	connect / as sysdba
	sql> exec dbms_xdb.sethttpport('8082');
	sql> exit


--------------------------
SAIKU:SERVER-USUARIO
--------------------------

	entrar a url-pruebas: http://10.25.1.236:8080/
	usuario admin/admin

ejemplo pregunta Q002 (bonos redimidos y en dónde): 
	ir al boton new query
	seleccionar el cubo "BONOS-ANLYT-Eventos > Redenciones"
	al cuadro medidas, arrastrar: "valor bono y cantidad_bonos"
	al cuadro columns arrastrar: anho
	al cuadro rows arrastrar: empresa, sucursal, caja
	
	> probar las diferentes visualizaciones
	
ejemplo pregunta Q004 (bonos redimidos por perfil-edad)
	ir al boton new query
	seleccionar el cubo "BONOS-ANLYT-Eventos > Redenciones"
	al cuadro medidas, arrastrar: "valor bono y cantidad_bonos"
	al cuadro columns arrastrar: anho, mes
	al cuadro rows arrastrar: rango-edad (del perfil del usuario)
	
	
============================	
REFERNCIAS
============================
# pivots
	pivot4j> reemplazo de jpivot
	http://webpivottable.com/ > 	
	apache drill: para tratr los origenes como sif ueran sql
	dimensiones lentamente cambianteS (1): http://www.businessintelligence.info/serie-dwh/dimensiones-lentamente-cambiantes-scd.html
	dimensiones lentamente cambianteS (2): http://www.businessintelligence.info/serie-dwh/claves-subrogadas.html
	modelos de ejemplo pentaho/saiku
	-> ejemplso con una base de datos h2: cliente: squirrel
	documentacion xml de mondrian (base para el modelamiento de cubos)
	  http://mondrian.pentaho.com/head/documentation/schema.php
  
# saiku con mapas
	- http://www.redopenbi.com/group/saiku/forum/topics/tutorial-01-saiku-chart-plus-geomap-y-geochart
	- http://www.sigte.udg.edu/jornadassiglibre2013/uploads/articulos_13/a26.pdf
	- http://www.sigte.udg.edu/jornadassiglibre2013/uploads/presentaciones_13/p26.pdf

# saiku trucos
	- http://localhost:8080/?plugin=true
	- http://demo.analytical-labs.com/embed/embed.html

# saiku bolierplate para eld esarrollo de plugins
	- https://github.com/brenopolanski/saiku-plugin-boilerplate
  
