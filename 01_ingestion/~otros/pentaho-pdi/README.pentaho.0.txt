================
Ingestion
================
para la ingestion se usa pentaho data integration; 

(1) descargar e instalar en C:\.work\pdi-ce-6.0.1.0-386
	ejecutar Spoon par ahacer le modelo

(2) instalar kafka consumer: 
	para ello 
	compilar el conector; 
	git clone https://github.com/RuckusWirelessIL/pentaho-kafka-consumer.git
	cd pentaho-kafka-consumer
	mvn clean package
	copiar de target/pentaho-kafka-consumer-TRUNK-SNAPSHOT.zip
	a C:\.work\pdi-ce-6.0.1.0-386\plugins\steps\pentaho-kafka-consumer

	modificar el nombre de la libreria lib\log4j por log4j.old

	#incluir los datos de conexion
	topic-name=my-topic-test

	zookeeper.connect=fedora23_ht:2181
	group.id=group-2

	dentro de kafka se debe cambiar la siguietne configuracion
	para que coja la ip u no el nombre de la maquina:

	updating config/server.properties advertised.host.name to the public IP address of the VM.
	esto es, adicionar lo siguiente:
	advertised.host.name=192.168.0.13

	posteriormente reiniciar zookeper y kafka:
	nohup ./bin/zookeeper-server-start.sh config/zookeeper.properties &
	nohup ./bin/kafka-server-start.sh config/server.properties &

	#cambiar nombre de la maquiona
	hostnamectl set-hostname fedora23_ht
	# agregatr a /etc/hosts
	192.168.0.13 fedora23_ht

(3) instalar driver de la abse de datos usada
	
	- copiar driver a lib (oracle driver no incluido)
	
(4) configuracion
	- iniciar: spoon.bat
	- cambiar idioma
		Tools\Options\Preferred Language to english
		tools/preferences/look&feel
	- reiniciar
	
	

================
REFERENCIAS
================
- consumer de kafka, como usar
	http://wiki.pentaho.com/display/EAI/Apache+Kafka+Consumer
- consumer de kafka - pentaho, compilar	
	http://www.willgorman.com/?p=61
