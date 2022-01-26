 
create type llista as (
dni char(8),
nom char(30),
sou_base real,
plus real,
matricula char(10)
);

create function llistat_treb(dniIni char(8), dniFi char(8)) returns setof llista as $$
declare
		dades llista;
		dnis char(8);
		dni_c char(8);
		matricules char(10);
		missatge varchar(50);
begin
	select t.dni into dni_c from treballadors t where t.dni >= dniIni and t.dni <= dniFi;
	if not found then raise exception '';
	end if;
	for dnis in select t.dni from treballadors t where t.dni >= dniIni and t.dni <= dniFi
	loop
		if (select count(*) from lloguers_actius l where l.dni = dnis) >= 5 then 
			for matricules in select l.matricula from lloguers_actius l where l.dni = dnis
			loop
				select t2.dni, t2.nom, t2.sou_base, t2.plus, matricules into dades from treballadors t2 where t2.dni = dnis;
				return next dades;
			end loop;
		else select t3.dni, t3.nom, t3.sou_base, t3.plus, null into dades from treballadors t3 where t3.dni = dnis;
			return next dades;
		end if;
	end loop;

	exception
		when raise_exception then SELECT texte INTO missatge FROM missatgesExcepcions WHERE num=1;
		RAISE EXCEPTION '%',missatge;
		when others then SELECT texte INTO missatge FROM missatgesExcepcions WHERE num=2;
		RAISE EXCEPTION '%',missatge;
end;
$$language plpgsql;
