------------------------------------------------------------------
-- Asignacion de permisos. Grant/Revoke role privileges al usuario
-- pentaho_sfi sobre los objetos de vu_sfi
------------------------------------------------------------------
grant select on vu_sfi.fd_tfide		to	PENTAHO_SFI	; 
grant select on vu_sfi.sb_tsubt		to	PENTAHO_SFI	; 
grant select on vu_sfi.cp_tinpg		to	PENTAHO_SFI	; 
grant select on vu_sfi.ge_tfpago	to	PENTAHO_SFI	; 
grant select on vu_sfi.ge_tauxil	to	PENTAHO_SFI	; 
grant select on vu_sfi.cp_torpa		to	PENTAHO_SFI	; 
grant select on vu_sfi.te_tmvte		to  PENTAHO_SFI	; 
grant select on vu_sfi.ge_tciud		to  PENTAHO_SFI	;
grant select on vu_sfi.sb_ttipo		to  PENTAHO_SFI	;
grant select on vu_sfi.fd_tinpg		to  PENTAHO_SFI	;
