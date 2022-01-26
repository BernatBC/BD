create or replace function disp_procediment() returns trigger as $$
declare 
	missatge varchar(100);
begin 
	if (old.nempl = 123) then raise exception '';
	end if;
	if (TG_OP = 'UPDATE') then return new;
	else return old;
	end if;
exception
	when raise_exception then SELECT texte INTO missatge FROM missatgesExcepcions WHERE num=1;
	RAISE EXCEPTION '%',missatge;
end;
$$ language plpgsql;


create trigger update_empleat before update of nempl on empleats for each row execute procedure disp_procediment();
create trigger delete_empleat before delete on empleats for each row execute procedure disp_procediment();
