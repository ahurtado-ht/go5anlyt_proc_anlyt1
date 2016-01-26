-- # create user in CDB
create user BVRD1_OLAP identified by BVRD1_OLAP default tablespace users temporary tablespace temp;
grant connect, resource to BVRD1_OLAP;
GRANT UNLIMITED TABLESPACE TO BVRD1_OLAP;
grant create any view to BVRD1_OLAP;