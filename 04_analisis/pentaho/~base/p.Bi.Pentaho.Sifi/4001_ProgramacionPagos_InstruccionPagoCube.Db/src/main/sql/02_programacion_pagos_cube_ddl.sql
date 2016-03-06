spool x_pentaho_ddl.log

-------------------------------------------------
-- Creacion de sinomimos a las tablas de vu_sfi
-------------------------------------------------
prompt
prompt Creating synonym fd_tfide
prompt ===============================
prompt

create or replace synonym fd_tfide
for vu_sfi.fd_tfide		

prompt
prompt Creating synonym fd_tfide
prompt ===============================
prompt
   
create or replace synonym sb_tsubt
for vu_sfi.sb_tsubt		

prompt
prompt Creating synonym fd_tfide
prompt ===============================
prompt

create or replace synonym cp_tinpg
for vu_sfi.cp_tinpg		

prompt
prompt Creating synonym fd_tfide
prompt ===============================
prompt

create or replace synonym ge_tfpago
for vu_sfi.ge_tfpago	

prompt
prompt Creating synonym fd_tfide
prompt ===============================
prompt

create or replace synonym ge_tauxil
for vu_sfi.ge_tauxil	

prompt
prompt Creating synonym fd_tfide
prompt ===============================
prompt

create or replace synonym cp_torpa
for vu_sfi.cp_torpa		
 

-------------------------------------------------
-- Creacion de vistas propias de pentaho_sfi
-------------------------------------------------
prompt
prompt Creating view INSTRUCCION_ORDEN_PAGO
prompt ==========================================
prompt
 
create or replace force view INSTRUCCION_ORDEN_PAGO 
(
id_orden_pago,
id_instruccion,
negocio,
vigencia,
numero_orden,
nombre_beneficiario,
id_beneficiario,
tipo_id_beneficiario,
tipo_retencion,
fuente_pago,
id_fuente_pago,
tipo_instruccion,
estado_instruccion,
anho_pago,
mes_pago,
dia_pago,
ciudad_pago,
valor_neto_instruccion,
valor_bruto_factura,
valor_descuento_factura,
valor_neto_factura,
clase_negocio,
clase_contrato,
tipo_negocio,
subtipo_negocio
 )
AS  
select cp.inpg_cias||'-'||cp.inpg_vigorpa||'-'||cp.inpg_orpa  id_orden_pago, 
cp.inpg_cias||'-'||cp.inpg_vigorpa||'-'||cp.inpg_orpa||'-'||cp.inpg_inpg  id_instruccion,
cp.inpg_cias negocio, 
cp.inpg_vigorpa vigencia, 
cp.inpg_orpa numero_orden, 
auxi_nombre1||''||auxi_nombre2||' '||auxi_apell1||' '||auxi_apell2 nombre_beneficiario, 
auxi_nit id_beneficiario, 
auxi_clase tipo_id_beneficiario,
decode (auxi_tpret, 'AN', 'Autoretenedor', 
					'ES', 'Entidad Estatal', 
					'GA', 'Gran contribuyente autoretenedor', 
					'GC', 'Gran contribuyente no autoretenedor', 
					'GE', 'No autoretenedor ni gran contribuyente', 
					'RC', 'Regimen comun', 
					'RS', 'Regimen simplificado', 
					'Otro'  )tipo_retencion, 
decode(cp.INPG_FTE_REC, 'C', 'Cuenta', 'P', 'Encargo') fuente_pago,
decode (cp.INPG_FTE_REC, 'C', cp.inpg_enti_auxi, 'P', cp.inpg_sf_plan) id_fuente_pago, 
decode (nvl(cp.INPG_CLASE, 'N'), 'I', 'Impuesto', 'N', 'Beneficiario') tipo_instruccion, 
decode (fd.INPG_STAT, 	'AU', 'Autorizada',
						'PG', 'Pagada' ,
						'PP', 'Pagada-Parcialmente', 
						'PA', 'Pago-Anulado',
						'AN', 'Anulada',
						'NC','No-Confirmada',
						'CF','Confirmada',
						'DU','Devuelta en Autorización',
						'RU','Rechazada en Autorización',
						'CM','Complementada',
						'DC','Devuelta en Complementación',
						'DM','Devuelta en Cumplimiento',
						fd.INPG_STAT ) estado_instruccion,
to_char(inpg_fecpag, 'YYYY') anho_pago,
to_char(inpg_fecpag, 'MM') mes_pago, 
to_char(inpg_fecpag, 'DD') dia_pago,
orpa_ciud ciudad_pago,
fd.inpg_vneto valor_neto_instruccion,
orpa_valbruto valor_bruto_factura, 
orpa_valdesc valor_descuento_factura,
orpa_valneto valor_neto_factura,
decode(fide_clasi, 'PU', 'Publico', 'PR', 'Privado') clase_negocio, 
decode( fide_clco, 'EF', 'Encargo fiduciario', 'FM', 'Fiducia mercantil') clase_contrato,
tipo_descri tipo_negocio,
subt_descri subtipo_negocio
from cp_tinpg cp ,ge_tauxil, cp_torpa, fd_tfide, sb_tsubt, sb_ttipo, fd_tinpg fd
where inpg_cias = fide_fide
and FIDE_TIPO_NEG = subt_tipo
and FIDE_SUBT_NEG = subt_subt
and tipo_tipo = subt_tipo
and cp.inpg_cias = orpa_cias
and cp.inpg_vigorpa = orpa_vigorpa
and cp.inpg_orpa = orpa_orpa
and orpa_auxi = auxi_auxi(+)
and cp.inpg_inpg = fd.inpg_inpg
and fd.inpg_oper = orpa_fd_oper
and cp.inpg_cias = fd.inpg_fide;

prompt
prompt Creating view ORDEN_PAGO
prompt ===========================================
prompt
 
create or replace force view ORDEN_PAGO 
(
id_orden_pago,
negocio,
vigencia,
numero_orden,
valor_bruto,
valor_descuento,
fecha_movimiento,
valor_neto,
estado_orden_pago,
oficina,
orden_operacion
 )
AS  
select orpa_cias||'-'||orpa_vigorpa||'-'||orpa_orpa id_orden_pago,
orpa_cias negocio, 
orpa_vigorpa vigencia, 
orpa_orpa numero_orden,
orpa_valbruto valor_bruto, 
orpa_valdesc valor_descuento,
orpa_fecmov fecha_movimiento, 
orpa_valneto valor_neto,
ORPA_STATUS estado_orden_pago,
ORPA_OFIC oficina, 
orpa_fd_oper orden_operacion
from cp_torpa, fd_tfide
where orpa_cias = fide_fide
and ORPA_CAUSACION = 'S' 
and nvl(ORPA_AUTORIZADO, 'N') = 'S';

prompt
prompt Creating view NEGOCIO
prompt ===========================================
prompt

create or replace force view NEGOCIO 
(
negocio,
tipo_negocio,
subtipo_negocio,
clase_negocio,
clase_contrato
 )
AS  
select fide_fide negocio, tipo_descri tipo_negocio, subt_descri subtipo_negocio, 
decode(fide_clasi, 'PU', 'Publico', 'PR', 'Privado') clase_negocio, 
decode( fide_clco, 'EF', 'Encargo fiduciario', 'FM', 'Fiducia mercantil') clase_contrato 
from fd_tfide, sb_tsubt, sb_ttipo
where FIDE_TIPO_NEG = subt_tipo
and tipo_tipo = subt_tipo
and FIDE_SUBT_NEG = subt_subt;
  
prompt
prompt Creating view CIUDAD_PAGO
prompt ===========================================
prompt
create or replace force view CIUDAD_PAGO 
(
ciudad_pago,
descripcion
 )
AS 
select ciud_dane ciudad_pago, ciud_descri descripcion
from ge_tciud;

  
spool off
