CREATE OR REPLACE PROCEDURE SET_SEQ_TO(p_name IN VARCHAR2, p_val IN NUMBER)
AS
   l_num   NUMBER;
BEGIN
   EXECUTE IMMEDIATE 'select ' || p_name || '.nextval from dual' INTO l_num;

   -- Added check for 0 to avoid "ORA-04002: INCREMENT must be a non-zero integer"
   IF (p_val - l_num - 1) != 0
   THEN
      EXECUTE IMMEDIATE 'alter sequence ' || p_name || ' increment by ' || (p_val - l_num - 1) || ' minvalue 0';
   END IF;

   EXECUTE IMMEDIATE 'select ' || p_name || '.nextval from dual' INTO l_num;

   EXECUTE IMMEDIATE 'alter sequence ' || p_name || ' increment by 1 ';

   DBMS_OUTPUT.put_line('Sequence ' || p_name || ' is now at ' || p_val);
END;
/

CREATE OR REPLACE PROCEDURE SET_SEQ_TO_DATA(seq_name IN VARCHAR2, table_name IN VARCHAR2, col_name IN VARCHAR2)
AS
   nextnum   NUMBER;
BEGIN
   EXECUTE IMMEDIATE 'SELECT MAX(' || col_name || ') + 1 AS n FROM ' || table_name INTO nextnum;

   SET_SEQ_TO(seq_name, nextnum);
END;
/

begin
  SET_SEQ_TO_DATA(seq_name => 'SEQ_ID_OPEVENTORAW', table_name=>'op_evento_raw', col_name => 'id_eventoraw'  );
end;
/
