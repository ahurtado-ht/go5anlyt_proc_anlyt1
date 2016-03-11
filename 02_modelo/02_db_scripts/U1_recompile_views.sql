set serveroutput on size 9999
declare
  sqltext varchar2(500);
begin
  for c1 in (
    select 'alter view '||object_name||' compile' sqltext, object_name
      from user_objects
     where object_type = 'VIEW'
       and status = 'INVALID' 
  ) loop
  begin
    execute immediate c1.sqltext;
    dbms_output.put_line('Compiled '||c1.object_name);
  exception
    when others then
      dbms_output.put_line('Unable to compile '||c1.object_name);
    end;
  end loop;
end;
/