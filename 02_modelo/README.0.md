===========================
CONVENCIONES
===========================

|-------|----------------------------------------------------------------------------------------------------|
|OP_    | modelo inicial de cubo para pruebas de renderizado (tablas)                                        |
|V_OP_  | modelo inicial de cubo para pruebas de renderizado (vistas)                                        |
|VX_    | Permite ir a otros origenes de datos para ensamblar el cubo (emula area de stage para dimensiones) |
|VXD_   | Compone objetos para ser usados como dimensiones (dimensions) en el cubo                           |
|VXF_   | Compone objetos para ser usados como hechos (facts) en el cubo                                     |
|-------|----------------------------------------------------------------------------------------------------|



luego de realizar un export, y posteriormente el import respectivo.

===========================
Validaciones Posteriores
===========================

1. INVALID OBJECTS
validar que no existan objetos invalidos ni descompilados (especificamente las vistas)
[ver] (https://oracle-base.com/articles/misc/recompiling-invalid-schema-objects)
para ello ejecutar el script U1_recompile_views.sql

2. SEQUENCES
si existen datos exportados, adelantar las secuencias para que no se presenten errores de FK

select max(id_eventoraw)
  from op_evento_raw
  
  


```
```





