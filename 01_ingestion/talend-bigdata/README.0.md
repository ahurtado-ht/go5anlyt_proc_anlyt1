========================
INGESTION-TALEND
========================
 se realiza a traves de talend OpenStudio for BigData
 
 
 
========================
MODELAMIENTO
========================
 
- dscargar talend openstudio for big data
- ejecutar el scaffold del proyecto

- datos de conexion (desarrollo local)
	topic-name=my-topic-test

	zookeeper.connect=fedora23_ht:2181
	group.id=group-2

	-> para bases de datos: con autocommit


REFERRNCIAs
- http://www.slideshare.net/vishaltx/a2c-boston-big-data-meetup-20131114 (modelamiento)
- https://www.youtube.com/watch?v=jZ2qKh6eIT8 (spago bi)
- http://ojphi.org/ojs/index.php/ojphi/article/view/3856/4759 (modelo de refeerencia con cache)
- http://www.slideshare.net/martinloetzsch/how-to-build-a-data-warehouse-codetalks-2014 (otros aspectos)
NOTAS
tKafkaInput: no disponible en ETL sino con suscripcion a BigData
Help/additional componsnts > instalr additional components

==================================
EXPORTAR
==================================
 [referenciia] (https://help.talend.com/display/KB/Exporting+a+Job+script+and+executing+it+outside+of+Talend+Studio)
 click derecho en el job
 darle build-job
 en el panel de exportacion darle "autonmous job"
 configurar las opciones para el contexto a ejecutar.
 seleccionar la ruta de exportacion (
	path: C:\.apps\e.Hitech\01_ProyectoBonos\03_construccion\go5anlyt_proc_anlyt1\01_ingestion\talend-bigdata
	archivo: Ingest04_Job02_bin.zip
 )
 
==================================
EJECUTAR
==================================
 
 para ejecutarlo: 
 copiar el zip a otra maquina
 descomprimir
 ejecutar el archivo <job>_run.bat
 
 cd /.apps 
 git clone git clone https://github.com/ahurtado-ht/go5anlyt_proc_anlyt1
 cd /.apps/go5anlyt_proc_anlyt1/01_ingestion/talend-bigdata
 
 unzip Ingest04_Job02_bin.zip -d Ingest04_Job02_bin
 cd Ingest04_Job02_bin/Job02
 
 modificar el script *.sh para cambiar el contexto
 ```
 --context=ht_dev
 ```
 
 luego ejecutar 
 ./Job02_run.sh
 
 

 
 

