create or replace function assignar_individual(nomSoci char(10),nomClub char(10)) returns void as $$
declare
homes int;
dones int;
sexe_ char(1);
missatge varchar(50);

begin
	if (not exists (select * from clubs c where nomClub = c.nclub)) then 
	select m.texte into missatge from missatgesExcepcions m where m.num = 4;
	raise exception'';
	end if;
	if (not exists (select * from socis s where nomSoci = s.nsoci)) then
	select m.texte into missatge from missatgesExcepcions m where m.num = 4;
	raise exception'';
	end if;
	if ((select count(*) from socisclubs sc where nomClub = sc.nclub) >= 10) then
	select m.texte into missatge from missatgesExcepcions m where m.num = 1;
	raise exception'';
	end if;
	select count(*) into homes from socis s natural inner join socisclubs sc where sc.nclub = nomClub and s.sexe = 'M';
	select count(*) into dones from socis s natural inner join socisclubs sc where sc.nclub = nomClub and s.sexe = 'F';
	select s.sexe into sexe_ from socis s where s.nsoci = nomSoci;
	if (sexe_ = 'M' and homes = dones) then
	select m.texte into missatge from missatgesExcepcions m where m.num = 2;
	raise exception'';
	end if;
	if (exists(select * from socisclubs sc where nomSoci = sc.nsoci and nomClub = sc.nclub)) then
	select m.texte into missatge from missatgesExcepcions m where m.num = 3;
	raise exception'';
	end if;

	insert into socisclubs values (nomSoci, nomClub);

	if ((select count(*) from socisclubs sc where nomClub = sc.nclub) = 6) then
	insert into clubs_amb_mes_de_5_socis values(nomClub);
	end if;

exception
	when raise_exception then raise exception '%', missatge;
	when others then select m.texte into missatge from missatgesExcepcions m where m.num = 5;
	raise exception '%', missatge;
end;
$$ language plpgsql;
