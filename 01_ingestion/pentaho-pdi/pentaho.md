================================================================================================================================================
PROYECTOS GIT 
================================================================================================================================================
proyectos asociados de BI hasta el momento
	i.Reports.Infra
	p.Bi.Pentaho.Sifi
	p.Bvrd.DataMart
	
descargarlos en C:\.apps\p.Bi.PentahoCE_SifiCubes.Apps con git	

================================================================================================================================================
	INSTALACION-PLUMBING
================================================================================================================================================

# INSTANT-CLiENT (oracle-client) [INSTALLATION] -------------------------------------------------------
	> para la ejecucion de scripts

	instalar 
		* instantclient 12_1: 		instantclient-basic-windows.x64-11.2.0.4.0.zip
		* instantclient 12_1 sqlplus: instantclient-sqlplus-windows.x64-12.1.0.2.0.zip
		descomprimir ambos en C:\.work\instantclient_12_1
	
# PENTAHO BI-SERVER [INSTALLATION] (CubeVisualization) ----------------------------------------------------------------------------------

instalacion
	- descargar
	- descomprimir en: ~/pentaho/biserver-ce-5.1.0.0-752 se descomprime
	
confguracion de puertos	
	(ver http://jira.pentaho.com/browse/BISERVER-7700); buscar archivos con grep -ri "xxxxxxxx" *

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

	- subir bi-server
	
		~/pentaho/biserver-ce-5.1.0.0-752/start-pentaho.sh
		tailf ~/pentaho/biserver-ce-5.1.0.0-752/tomcat/logs/catalina.out
	
	- autenticarse con admin/password o joe/password
	
		en: http://192.168.60.185:10108/pentaho	
		
	- instalar plugins desde el marketplace (link marketplace en mayuscula en la parte izquierda)
		-> saiku analytics
		-> saiku chart plus
		-> community dashboard framework		[version estable]
		-> community data access				[version estable]
		-> community dashboard editor			[version estable]
		-> communty graphics generator			[version estable]
		-> d3 component library					[version estable]
		-> community chart components 2			[opcional][no-existe]
		-> community data browser				[opcional][no-instalado]
		-> open-i								[opcional]
		
		
	- cambiar datos JDBC para los ejemplos	
		
		- ir a file/ManageDataSources
		- seleccionar SampleData [JDBC] y dar click en editar
		- cambiar el port number acorde a la tabla anterior de puertos
	
	- reiniciar
	
	- configuracion del smtp en : /pentaho-solutions/system/smtp-email/email_config.xml
	
	- biserver password de publicacion (no existe)
		(TODO: validar: /pentaho-solutions/system/publisher_config.xml)
	
limpieza de schema-cache
	tools/refresh/mondrian schema cache (para que se activen los cambios al publicar cubos)
	reiniciar bi-server

	
# PENTAHO SCHEMA WORKBENCH [INSTALLATION] ----------------------------------------------------------------------------------

instalacion
	- descargar
	- descimprimir en C:\.work\psw-ce-3.7.0.0-752\workbench.bat
	- iniciar psw (C:\.work\psw-ce-3.7.0.0-752\workbench.bat)

# PENTAHO DATA INTEGRATION (KETTLE-ETL) [INSTALLATION] ----------------------------------------------------------------------------------

instalacion
	- descargar
	- descomprimir en C:\.work\pdi-ce-5.1.0.0-752

instalacion
	- subir spoon
	- cambiar idioma
		Tools\Options\Preferred Language to english
	- reiniciar
	
================================================================================================================================================
	PROCEDIMIENTOS-PLUMBING
================================================================================================================================================
	
# GENERAL:: JDBC-CONFIGURACION DRIVERS ---------------------------------------------------------------------------
	(ver documento 5.1/documentation/config_ba_server.pdf)
	
	- se consigue drivers para la db  
	- en el host-server  / para biserver: 
	
			~/pentaho/biserver-ce-5.1.0.0-752/tomcat/lib 

		- para admin console (ya no existe)
			
			/biserver-ce-3.9.0-RC1\administration-console\jdbc
			
		
	- en el host cliente / para dataintegration
		
			C:\.work\pdi-ce-5.1.0.0-752\data-integration\lib

	- en el host cliente / para schemaworkbench
	
			C:\.work\psw-ce-3.7.0.0-752\drivers (al parecer la herramienta trabaja con definicion de drivers del jdk 1.5)

	- en el host cliente / 	para reportdesinger
	
			/prd-ce-3.8.1-RC1\report-designer\lib\jdbc
	
# GENERAL:: JDBC-CONFIGURACION JNDI ---------------------------------------------------------------------------

	- biserver jndi connections: 
	cambiar en archivos 
		~/pentaho/biserver-ce-5.1.0.0-752/tomcat/webapps/pentaho/META-INF/context.xml
		~/pentaho/biserver-ce-5.1.0.0-752/tomcat/conf/Catalina/localhost/pentaho.xml
	
	plantilla para adicionar:
	
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

================================================================================================================================================
	INSTALACION-ESQUEMAS OPERATIVOS
================================================================================================================================================
			
# INSTALACION ESQUEMAS OPERATIVOS = SIFI --------------------------------------------------------------------------------------
	instalar en 
		192.168.60.52:1521:sf439282
	
	correr _run_install_01_operative_sifi.cmd	
	
	> este script instala
		-> ODS CORREVAL_CUBE   	usuario: CONSULTAS_REPORTES/meconio3@sf439282
		-> ODS PROGPAGOS_CUBE	usuario: PENTAHO_SFI/PENTAHO_SFI@sf439282


# INSTALACION ESQUEMAS OPERATIVOS = BVRD --------------------------------------------------------------------------------------
	instalar en 
		192.168.60.52:1521:sf439282
	
	correr _run_install_02_analytic_bvrd.cmd	
	
	> este script instala
		-> ODS CORREVAL_CUBE   	usuario: CONSULTAS_REPORTES/meconio3@sf439282
		-> ODS PROGPAGOS_CUBE	usuario: PENTAHO_SFI/PENTAHO_SFI@sf439282

# CONFIGURACION PDI (KETTLE-ETL) [CONFIGURATION] ----------------------------------------------------------------------------------
diseño etl
	# pdi: design ETL 
		- definir datasource
			connection-name: BVRD-X-Conn1
			connection-host: 192.168.60.52
			connection-port: 1521
			connection-db:	 sf439282
			connection-username: BVRD1_OLAP
			connection-password: BVRD1_OLAP
			
		- definir proceso de integracion 1
			> configurar etl1: 
				kettle-archivo: C:\.apps\p.Bi.PentahoCE_SifiCubes.Apps\p.Bvrd.DataMart\2001_Poc\3201_DataMart_Etl\01_LoadOperationalData.ktr
				kettle-etl1-input: (xls): C:\.apps\p.Bi.PentahoCE_SifiCubes.Apps\p.Bvrd.DataMart\1200_Documentacion\info-tecnica\02_Poc\Data de prueba para Demo ITC.xlsx
				kettle-etl1-db: BVRD-X-Conn1
			> ejecutar etl1	
			
		- 	definir proceso de integracion 2
			> configurar etl2: 
				kettle-archivo: C:\.apps\p.Bi.PentahoCE_SifiCubes.Apps\p.Bvrd.DataMart\2001_Poc\3201_DataMart_Etl\02_LoadOlapData.ktr
				kettle-etl2-db: BVRD-X-Conn1
			> ejecutar etl2	
		
ejecucion etl
	# pdi: execute ETL


# CONFIGURACION PSW [CUBOS] ----------------------------------------------------------------------------------
	
diseño cubos ODS-SIFI -----------------------------------
	
	- definicion conexion 1 (ahora no es necesario para publicar)
			connection-name: sFIN-X-Conn1
			connection-host: 192.168.60.52
			connection-port: 1521
			connection-db:	sf439282
			connection-username: CONSULTAS_REPORTES
			connection-password: meconio3
			connection-type: native
			OPTIONS: (no probado):
				param: FILTER_SCHEMA_LIST: CONSULTAS_REPORTES
				
	
publicacion cubos ODS-SIFI -----------------------------------

	
	- para publicar NO usar schema workbench dado que hay un error reportado. usar la utilidad de importacion de la consola.
		* http://192.168.60.185:10108/pentaho/
		
		
		-> BrowseFiles
			
			- crear nuevo folder: 	public/s
				-> (para guardar los queries)
		
		-> File/ManageDatasources
		
		-> Agregar una nueva conexion con "JDBC"
			Connection: [NEw] 
				connection-name: 		sFIN-X-Conn1
				connection-host: 		192.168.60.52
				connection-port: 		1521
				connection-db:	 		sf439282
				connection-username: 	CONSULTAS_REPORTES
				connection-password: 	meconio3
				
		-> Agregar	nuevo "analysis" 
				mondrian-file(ds-cube): C:\.apps\p.Bi.PentahoCE_SifiCubes.Apps\i.Reports.Infra\0304_ObjsSifiIntegracion_.Db\src\main\mdx\cubes\Sifi_Pagos_04_Cube.xml
				datasource-selection: 	select-from-available-ds
				datasource-conn-name: 	sFIN-X-Conn1
				
				datasource-schema: 		sFIN-Pagos_Prog_OrdenOp
				datasource-name: 		ProgramacionPagos_OrdenOp_Cube
				datasource-for: 		ReportingAndAnalysis
				datasource-queries:		sFIN-Pagos_Prog_Q_	(prefix)
			
		-> Agregar	nuevo "analysis" 
				mondrian-file(ds-cube): C:\.apps\p.Bi.PentahoCE_SifiCubes.Apps\i.Reports.Infra\0304_ObjsSifiIntegracion_.Db\src\main\mdx\cubes\Sifi_Presupuesto_04_Cube.xml
				datasource-selection: 	select-from-avalibale-ds
				datasource-conn-name: 	sFIN-X-Conn1
				
				datasource-schema: 		sFIN-Pagos_Pres
				datasource-name: 		ProgramacionPagos_Presupuesto_Cube
				datasource-for: 		ReportingAndAnalysis
				datasource-queries:		sFIN-Pagos_Pres_Q_	(prefix)
			
			
		-> Agregar una nueva conexion con "JDBC"
			Connection: [NEw] 
				connection-name: 		sFIN-X-Conn2
				connection-host: 		192.168.60.52
				connection-port: 		1521
				connection-db:	 		sf439282
				connection-username: 	PENTAHO_SFI
				connection-password: 	PENTAHO_SFI
			
		-> Agregar	nuevo "analysis" 
				mondrian-file(ds-cube): C:\.apps\p.Bi.PentahoCE_SifiCubes.Apps\p.Bi.Pentaho.Sifi\4001_ProgramacionPagos_InstruccionPagoCube.Pentaho\src\main\mdx\ProgramacionPagosSIFI_InstruccionesPagoCube.xml
				datasource-selection: 	select-from-avalibale-ds
				datasource-conn-name: 	sFIN-X-Conn2
				
				datasource-schema: 		sFIN-Pagos_Prog_Instruc
				datasource-name: 		InstruccionesPago_Cube
				datasource-for: 		ReportingAndAnalysis
				datasource-queries:		sFIN-Pagos_Prog_Instruc_Q_	(prefix)		


diseño cubos ODS-BVRD -----------------------------------
	
	- definicion conexion 1 (ahora no es necesario para publicar)
			connection-name: BVRD-X-Conn1
			connection-host: 192.168.60.52
			connection-port: 1521
			connection-db:	 sf439282
			connection-username: BVRD1_OLAP
			connection-password: BVRD1_OLAP
			connection-type: native
			OPTIONS: (no probado):
				param: FILTER_SCHEMA_LIST: BVRD1_OLAP


publicacion cubos ODS-BVRD -----------------------------------

		-> BrowseFiles
			
			- crear nuevo folder: 	public/s
				-> (para guardar los queries)
		
		-> File/ManageDatasources


		-> Agregar una nueva conexion con "JDBC"
			Connection: [NEw] 
				connection-name: 		BVRD-X-Conn1
				connection-host: 		192.168.60.52
				connection-port: 		1521
				connection-db:	 		sf439282
				connection-username: 	BVRD1_OLAP
				connection-password: 	BVRD1_OLAP
				
		-> Agregar	nuevo "analysis" 
				mondrian-file(ds-cube): C:\.apps\p.Bi.PentahoCE_SifiCubes.Apps\p.Bvrd.DataMart\2001_Poc\3203_DataMart_Cube\OperacionesCube01.xml
				datasource-selection: 	select-from-available-ds
				datasource-conn-name: 	BVRD-X-Conn1
				
				datasource-schema: 		BVRD-INV-RentaFija
				datasource-name: 		RentaFija_Operaciones_Cube
				datasource-for: 		ReportingAndAnalysis
				datasource-queries:		sFIN-Pagos_Prog_Q_	(prefix)
				
	-> incluir archivos anteriores; 
		ver ubicacion del repositorio : /biserver-ce-5.1.0.0-752/pentaho-solutions/system/jackrabbit/repository.xml
		
		

================================================================================================================================================
	HALLAZGOS
================================================================================================================================================

	- al publicar, debe eliminarse el cache del bi-server
	- 2 jerarquias de la misma dimension no se dejan cambiar de eje (al parecer error de saiku)
	- todo atributo debe pertenecer a una jerarquia
	
	-> TODO: no esta funcionando la medida [OperacionFact].[VrTran] del cubo de BVRD (ajustado: faltaban elementos en la tabla de fact)
	