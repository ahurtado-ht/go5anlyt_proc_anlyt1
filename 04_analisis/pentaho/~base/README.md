================================================================================================================================================
# PROJECT SOURCE-CODE
================================================================================================================================================
	associated project: 
	-> 0003_Fcen_PropuestaDwProspectos	
	
	local home at: 
	-> C:\.apps\p.empresa_ownk\0003_Fcen_PropuestaDwProspectos

================================================================================================================================================
#	PLUMBING-INSTALLATION
================================================================================================================================================

>> conventions: 

   * InstallationHome (~/) = C:\.apps\p.a0003.inmob.Work


# Database (postgresql) [INSTALLATION] -------------------------------------------------------

1. download postgresql (windows: postgresql-9.4.1-1-windows-x64.exe)
2. install at C:\Program Files\PostgreSQL\9.4
3. install parameters: 
	- root-user= postgres/pgadmin
	- db-port  = 5432

# JVM [INSTALLATION] -------------------------------------------------------

1. download jdk 1.7 (jdk1.7.0_60)
2. install it
3. set environment variables
	JAVA_HOME
	PATH


# PENTAHO BI-SERVER [INSTALLATION] (CubeVisualization) ----------------------------------------------------------------------------------

1. download biserver-ce-5.2.0.0-209
2. uncompress at: C:\.apps\p.a0003.inmob.Work\biserver-ce-5.2.0.0-209
3. ports configuration: 

	> mantener la que existe. 
	> Si se choca algun puerto con una instalacion realizada, usar la siguiente tabla de JUEGO-DE-PUERTOS:

					default cambio
	+ db hsql		9001	10101		archivo: ~/pentaho/biserver-ce-5.1.0.0-752/tomcat/webapps/pentaho/WEB-INF/web.xml   		<context-param><param-name>hsqldb-port</param-name><param-value>10101</param-value></context-param>
										archivo: ~/pentaho/biserver-ce-5.1.0.0-752/tomcat/webapps/pentaho/META-INF/context.xml 		url="jdbc:hsqldb:hsql://localhost:10101/hibernate"
										archivo: ~/pentaho/biserver-ce-5.1.0.0-752/tomcat/webapps/pentaho/META-INF/context.xml 		url="jdbc:hsqldb:hsql://localhost:10101/quartz"
										archivo: ~/pentaho/biserver-ce-5.1.0.0-752/tomcat/conf/Catalina/localhost/pentaho.xml 		url="jdbc:hsqldb:hsql://localhost:10101/hibernate"
										archivo: ~/pentaho/biserver-ce-5.1.0.0-752/tomcat/conf/Catalina/localhost/pentaho.xml 		url="jdbc:hsqldb:hsql://localhost:10101/quartz"
										archivo: ~/pentaho/pentaho-solutions/system/hibernate/hsql.hibernate.cfg.xml				<property name="connection.url">jdbc:hsqldb:hsql://localhost:10101/hibernate</property>
										archivo: ~/pentaho/pentaho-solutions/system/simple-jndi/jdbc.properties						SampleData/url=jdbc:hsqldb:hsql://localhost:10101/sampledata
										archivo: ~/pentaho/pentaho-solutions/system/simple-jndi/jdbc.properties						Hibernate/url=jdbc:hsqldb:hsql://localhost:10101/hibernate
										archivo: ~/pentaho/pentaho-solutions/system/simple-jndi/jdbc.properties						Quartz/url=jdbc:hsqldb:hsql://localhost:10101/quartz
										archivo: ~/pentaho/pentaho-solutions/system/simple-jndi/jdbc.properties						SampleDataAdmin/url=jdbc:hsqldb:hsql://localhost:10101/sampledata
										archivo: ~/pentaho/data/stop_hypersonic.bat													...
	+ tomcat-server	8005	10105		archivo: ~/pentaho/biserver-ce-5.1.0.0-752/tomcat/conf/server.xml
	+ tomcat-ajp	8009	10109		archivo: ~/pentaho/biserver-ce-5.1.0.0-752/tomcat/conf/server.xml
	+ tomcat-http	8080	10108		archivo: ~/pentaho/biserver-ce-5.1.0.0-752/tomcat/conf/server.xml
										archivo: ~/pentaho/biserver-ce-5.1.0.0-752/tomcat/webapps/pentaho/WEB-INF/web.xml cambiar fully-qualified-server-url

	REFERENCES: http://jira.pentaho.com/browse/BISERVER-7700)
	NOTA: en linux, para buscar algun archivo del listado o con nobre similar, use: grep -ri "xxxxxxxx" *
										
	
4. configure the jdbc driver for bi-server
	@see: PROCEDURE > JDBC-DRIVER-CONFIGURATION
	
5. start bi-server
	
	~/biserver-ce-5.2.0.0-209/start-pentaho-debug.bat
	
	tailf ~/biserver-ce-5.2.0.0-209/tomcat/logs/catalina.out
	# for windows use an utilitary program as: tailforwin, baretail o mtail
	
6. log in with the follwing credentials
	- admin/password 
	- joe/password
	
	site: http://127.0.0.1:8080/pentaho	
		
7. add plugins from the marketplace (link marketplace en h1-mayuscula en la parte izquierda)
	(ojo: saiku tiene version enterprise y community)

		-> saiku analytics						[version 3.0.9.9 STABLE: OJO: entrar al plugin y seleccinar la version]
		-> saiku chart plus
		-> community dashboard framework		[version estable]
		-> community data access				[version estable]
		-> community dashboard editor			[version estable]
		-> communty graphics generator			[version estable]
		-> d3 component library					[version estable]
		-> community chart components 2			[opcional][no-existe]
		-> community data browser				[opcional][no-instalado]
		-> open-i								[opcional]
	
		
8. solo si se ha cambiado el juego de puertos de este compoonente, 
	cambiar datos JDBC para los ejemplos 	
		
		- ir a file/ManageDataSources
		- seleccionar SampleData [JDBC] y dar click en editar
		- cambiar el port number acorde a la tabla anterior de JUEGO-DE-PUERTOS
	
9. configuracion del smtp en : 
	~/biserver-ce-5.2.0.0-209/pentaho-solutions/system/smtp-email/email_config.xml

# DB-MODELER [INSTALLATION] (CubeVisualization) ----------------------------------------------------------------------------------
	
instalar modelador (oracle sql developer - with jdk)
1. descomprimir en C:\.work\sqldeveloper-4.0.3.16.84-x64
2. cambiar idioma en 
	sqldeveloper\sqldeveloper\bin\sqldeveloper.conf
	
	#language (adicionar debajo de #font performance)
	AddVMOption -Duser.language=en
	AddVMOption -Duser.country=US

4. copiar driver de pgsql 	a
	sqldeveloper/jdbc/lib

5. iniciar 

6. referenciar driver
	Tools / Preferences/ Database / Third Party JDBC Drivers

7. y probar conectividad	

	1. crear nueva conexion
		> connections/new connection
			connection name: inmob1_dw
			
		> temporalmente colocar	(para que cargue las dbs)
			user: postgres
			password: postgres

# usar sqldeveloper-datamodeler
view/datamodeler/browser
> crear nuevo diseño
			
instalar administrador (pdadmin3-1.20.0)
instalar en programfiles\pgadminIII (si no lo tiene incluido postgres)


# JASPERSOFT TALEND-OPENSTUDIO [INSTALLATION] ----------------------------------------------------------------------------------

isntalar talend-openstudio (data integration) ----------------------------

1. en directorio C:\.work\ (el insgtaller crea subdirectorio)
2. en archivo .ini referenciar jdk 1.6
	-vm
	<PATH>
3. en archivo .ini cambiar parametros de memoria (archivos con excel 2013 consumen mas memoria)
3. crear proyecto bi_inmob1
4. instalar plugins de eclipse si hacen falta
4. entrar a talend; 
	window/prewferences
		> cambir idioma a ingles
		
# PENTAHO SCHEMA WORKBENCH [INSTALLATION] ----------------------------------------------------------------------------------

instalacion
	- descargar
	- descimprimir en C:\.apps\p.a0003.inmob.Work\psw-ce-3.8.0.0-209
	- copiar driver en ~/psw-ce-3.8.0.0-209/drivers
	- iniciar psw (C:\.apps\p.a0003.inmob.Work\psw-ce-3.8.0.0-209\workbench.bat)

	

# NO_USADO: PENTAHO DATA INTEGRATION (KETTLE-ETL) [INSTALLATION] ----------------------------------------------------------------------------------

instalacion
	- descargar
	- descomprimir en C:\.apps\p.a0003.inmob.Work\pdi-ce-5.2.0.0-209
driver
	- copiar driver postgresql a lib (por defecto el de postgresql ya viene)
configuracion
	- iniciar: spoon.bat
	- cambiar idioma
		Tools\Options\Preferred Language to english
		tools/preferences/look&feel
	- reiniciar


================================================================================================================================================
#	PROJECT-CONFIGURATION
================================================================================================================================================

# Database --------------------------------------------------------------------------------------------------------------------
	
1. create database

	create database inmob1_dw with owner postgres;
	grant all privileges on database inmob1_dw to postgres;
	
2. import database

	use the following procedure to import the database
		IMPORT/EXPORT PROCEDURE
	the dump files are located at 
		C:\.apps\p.empresa_ownk\0003_Fcen_PropuestaDwProspectos\02_construccion\p.a0003.inmob1.c10_Db\src\main\dmp
		
	NOTE(1): (*.dump   for commandline utility)
	NOTE(2): (*.backup for pgadmin graphic utility)
		
#8 iniciar psql en linea de comandos
#
#	set PSQL_HOME=C:\Program Files\PostgreSQL\9.4
#	set PATH=%PSQL_HOME%\bin;%PATH%;
#	
#	set PROJECT_FILES=C:\.apps\p.empresa_ownk\0003_Fcen_PropuestaDwProspectos\02_construccion\inmob1
#	cd %PROJECT_FILES%
#	
# create login roles
# create user inmob1_u password 'inmob1_u';
# create user inmob1_adm password 'inmob1_adm';
# drop user if exists inmob1_u;
# drop user if exists inmob1_adm;
# CREATE USER inmob1_olap PASSWORD 'inmob1_olap';
# psql -U postgres -h localhost -W		
# psql -U postgres < "pg_01_createdb.sql"


# Bi-Server Database Connection -----------------------------------------------------------------------------------------------------

	use the following procedure to create the connection in bi-server
		DW :: CUBE CONNECTION

# Bi-Server Cube publishing -----------------------------------------------------------------------------------------------------

	use the following procedure to load the cube to the console
		CUBE PUBLISHING PROCEDURE
	the cube files are located at 
		C:\.apps\p.empresa_ownk\0003_Fcen_PropuestaDwProspectos\02_construccion\p.a0003.inmob1.c12_Cube\cube_mdx

# Bi-Server Perspective organization -----------------------------------------------------------------------------------------------------

	create the strcuture according the 
		DW :: PERSPECTIVES CREATION PROCEDURE
		

		
================================================================================================================================================
	PROCEDIMIENTOS-PLUMBING
================================================================================================================================================

# DW :: JDBC-DRIVER-CONFIGURATION (pentaho) ---------------------------------------------------------------------------

1. download the jdbc driver 
	from: https://jdbc.postgresql.org/download.html
	file-to-download: postgresql-9.4-1200.jdbc4.jar
	or use maven.
		
2. add the driver according the tool to be used
	test if the driver already exists in this location

	for bi-server  		at server-pc: 		~/biserver-ce-5.2.0.0-209/tomcat/lib
	for admin-console 	at server-pc:  		~/biserver-ce-3.9.0-RC1\administration-console\jdbc (this component was deprecated)
	for pdi 			at developer-pc:    ~/pdi-ce-5.2.0.0-209/lib
	for psw				at developer-pc:    ~/psw-ce-3.8.0.0-209/drivers  (take care of the version of jdk)
	for prd 			at developer-pc:	~/prd-ce-3.8.1-RC1\report-designer\lib\jdbc
	
	REFERENCES	
	
	- (http://stackoverflow.com/questions/7592519/oracle-sql-developer-and-postgresql)
	- (ver documento 5.1/documentation/config_ba_server.pdf)
			
	
# DW :: CUBE-DESIGN (psw) ---------------------------------------------------------------------------

	diseño cubos ODS-INMOB1 -----------------------------------

	- definicion conexion 1 (ahora no es necesario para publicar)
	
			connection-name: inmob1Dw_conn
			connection-db-type: postgresql
			connection-host: 127.0.0.1
			connection-db-name:	inmob1_dw
			connection-port: 5432
			connection-username: postgres
			connection-password: pgadmin
			connection-type: native
			
# DW :: PERSPECTIVES CREATION (pentaho-biserver) ---------------------------------------------------------------------------

	create the following structure at Bi-server to save the queries

	- home/ROOT/Inmob1

# DW :: CUBE CONNECTION (pentaho-biserver) ---------------------------------------------------------------------------
		
	-> File/ManageDatasources
		
			luego pulsar el gear; dar opcion "new connection"
			
	-> Agregar una nueva conexion con "JDBC"
			Connection: [NEw] 
				connection-name: 		inmob1Dw_conn
				connection-host: 		127.0.0.1
				connection-port: 		1521
				connection-db-name:	 	inmob1_dw
				connection-username: 	pentaho
				connection-password: 	pgadmin
				connection-type: native
	
	
# DW :: CUBE PUBLISHING (pentaho-biserver) ---------------------------------------------------------------------------
		
		-> File/ManageDatasources
		
			luego pulsar el gear; dar opcion "new connection"
			
	-> Agregar una nueva conexion con "JDBC"
			Connection: [NEw] 
				connection-name: 		inmob1Dw_conn
				connection-host: 		127.0.0.1
				connection-port: 		1521
				connection-db-name:	 	inmob1_dw
				connection-username: 	pentaho
				connection-password: 	pgadmin
				connection-type: native
				
	-> Agregar	nuevo "analysis" 
		entrar a file/manage datasources, y luego pulsar el gear; dar opcion "new a"
		
				mondrian-file(ds-cube): C:\.apps\p.empresa_ownk\0003_Fcen_PropuestaDwProspectos\02_construccion\p.a0003.inmob1.c12_Cube\cube_mdx\Inmob1_Cube.xml
				datasource-selection: 	select-from-available-ds
				datasource-conn-name: 	inmob1Dw_conn
				
				datasource-schema: 		FC-INMOB-Prospectos
				datasource-name: 		Inmobiliario_Revisiones_Cube
				datasource-for: 		ReportingAndAnalysis
				datasource-queries:		FC-INMOB-Prsp_Q_	(prefix)			
				
	-> flush/limpieza de mondrian schema-cache	
	
		tools/refresh/mondrian schema cache (para que se activen los cambios al publicar cubos)
		reiniciar bi-server
		
	NOTE (1) previouw versions of pentaho used other file for the password
				/pentaho-solutions/system/publisher_config.xml. 
			 Current version uses the usermane password
	
	NOTE (2) pentaho schema workbench uses an option in the menu for publishig purposes: 
			 Do not use this option becuase it has some reported errors. Use the bi-server to do that instead.
			* http://192.168.60.185:10108/pentaho/
		

# DW :: JNDI-CONFIGURATION (biserver) ---------------------------------------------------------------------------
	(solo ES NECESARIA si en la conexion se referencia un jndi-datasource)

	- biserver jndi connections: 
	cambiar en archivos 
		~/pentaho/biserver-ce-5.1.0.0-752/tomcat/webapps/pentaho/META-INF/context.xml
		~/pentaho/biserver-ce-5.1.0.0-752/tomcat/conf/Catalina/localhost/pentaho.xml
	
	plantilla para adicionar (postgresql):
	
		<!-- #region 01 add jndi datasource -->
		<Resource
		name="jdbc/inmob1Dw_conn"
		username="postgres"
		password="pgadmin"
		driverClassName="org.postgresql.Driver"
		url="jdbc:postgresql://127.0.0.1:5432/inmob1_dw"
		validationQuery="select 1"
		auth="Container"
		type="javax.sql.DataSource"
		maxActive="20"
		maxIdle="10"
		/> 
	
	plantilla para adicionar (oracle)
		<!-- #region 01 add jndi datasource -->
		<Resource
		name="jdbc/pentaho_sfi"
		username="pentaho_sfi"
		password="pentaho_sfi"
		driverClassName="oracle.jdbc.driver.OracleDriver"
		url="jdbc:oracle:thin:@192.168.60.146:1521:CLDXPROD"
		validationQuery="select dummy from dual"
		auth="Container"
		type="javax.sql.DataSource"
		factory="org.apache.commons.dbcp.BasicDataSourceFactory"
		maxActive="20"
		maxIdle="5"
		maxWait="10000"
		/>	
		
		
# DATABASE :: IMPORT/EXPORT PROCEDURE (postgresql) ---------------------------------------------------------------------------

  set DMP_DIR=C:\.apps\p.empresa_ownk\0003_Fcen_PropuestaDwProspectos\02_construccion\p.a0003.inmob1.c10_Db\src\main\dmp
  set DMP_NAME=20150221154100.dump
  set PG_HOME=C:\Program Files\PostgreSQL\9.4
  
  echo "setting work directory"
  cd %DMP_DIR%
  
  echo "exporting..."
  "%PG_HOME%\bin\"pg_dump    -h 127.0.0.1 -p 5432 -U postgres -Fc -d inmob1_dw > %DMP_NAME%
  
  echo "importing..."
  rem "%PG_HOME%\bin\"pg_restore -h 127.0.0.1 -p 5432 -U postgres -d inmob1_dw %DMP_NAME%
  
  REFERENCIAS: 
  - http://help.ninefold.com/getstarted/exporting_and_importing_postgresql_data/
  
  
# ETL-DESIGN :: IMPORT/EXPORT PROCEDURE (talend) ---------------------------------------------------------------------------
	
	export: 
		select the job
		right click
		optioon export
		select all
		save at: C:\.apps\p.empresa_ownk\0003_Fcen_PropuestaDwProspectos\02_construccion\p.a0003.inmob1.c11_Etl\etl_design\talend\<date>.zip
	import: 	
		open talend
		give the import option and select the file to restore
	
  