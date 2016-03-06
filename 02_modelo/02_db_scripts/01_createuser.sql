-- connect / as sysdba
-- create schema
create user anlyt identified by anlyt 
default tablespace users temporary tablespace temp;

grant connect, resource to anlyt;
grant create view to anlyt;
grant create database link to anlyt;
grant create synonym to anlyt;