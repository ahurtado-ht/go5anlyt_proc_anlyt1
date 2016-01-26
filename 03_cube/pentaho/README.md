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
	
