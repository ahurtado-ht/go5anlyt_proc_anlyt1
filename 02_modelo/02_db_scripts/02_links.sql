create database link dblink_mispesos
connect to mispesos identified by mispesos
  using
  '(DESCRIPTION=
    (ADDRESS=
     (PROTOCOL=TCP)
    (HOST=192.168.1.236)
     (PORT=1521))
     (CONNECT_DATA=
      (SID=PERSONAL)))'