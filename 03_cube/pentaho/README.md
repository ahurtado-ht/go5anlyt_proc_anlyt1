============================
MODELAMIENTO
============================
se puede hacer con pentaho schema workbench
se descarga; 
se coloca driver en fodler drivers
se inicia (workbench.bat)

se crea conexion (Options > Connection)
nombre: ht_0_1_Anlyt__anlyt




============================
-> ejecucion
============================

saiku
-> corre sobre tomcat-7 (necesita jdk)

-> subir cubo
	Admin console [A]:
	Opcion: Administration > DataSoruce management> Schema > AddSchema
	subir el archivo
		-> schema name: BONOS-ANLYT-Eventos

-> crear datasource
  copiar driver a saiku-server/tomcat/webapps/saiku/WEB-INF/lib/ (o a tomcat/lib)
  
  -> subir app
  -> luego ir a: Admin console [A]:
	Opcion: Administration > DataSoruce management > DataSources > AddDatasource  (tipo advanced)
		
	copiar la siguiente declaracion:
	
# declaration of datasource	
type=OLAP
name=ht_0_1_Anlyt__anlyt
driver=mondrian.olap4j.MondrianOlap4jDriver
location=jdbc:mondrian:Jdbc=jdbc:oracle:thin:@localhost:1521:xe;Catalog=mondrian:///datasources/BONOS-ANLYT-Eventos.xml;JdbcDrivers=oracle.jdbc.OracleDriver
username=anlyt
password=anlyt	

	-> reiniciar

-> subir saiku	
	start-saiku.bat (sube por el peurto 8080)
-> subir xml 
	
	
-> cambiar puerto de applciationexpress oracle: 
	sqlplus /nolog
	connect / as sysdba
	sql> exec dbms_xdb.sethttpport('8082');
	sql> exit
============================	
REFERNCIAS
============================
pivot4j> reemplazo de jpivot
http://webpivottable.com/ > 	
apache drill: para tratr los origenes como sif ueran sql
dimensiones lentamente cambianteS (1): http://www.businessintelligence.info/serie-dwh/dimensiones-lentamente-cambiantes-scd.html
dimensiones lentamente cambianteS (2): http://www.businessintelligence.info/serie-dwh/claves-subrogadas.html
modelos de ejemplo pentaho/saiku
-> ejemplso con una base de datos h2: cliente: squirrel






