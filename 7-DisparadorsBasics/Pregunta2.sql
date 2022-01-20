create function check_dia() returns trigger as $$
declare
	missatge varchar(100);
	d char(10);
begin
	select * into d from dia;
	if (d = 'dijous') then raise exception '';
	else return old;
	end if;
exception
	when raise_exception then SELECT texte INTO missatge FROM missatgesExcepcions WHERE num=1;
	RAISE EXCEPTION '%',missatge;
end;
$$ language plpgsql;

create trigger delete_empleat before delete on empleats for each statement execute procedure check_dia();
