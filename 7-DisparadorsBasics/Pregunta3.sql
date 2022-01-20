create function insert_import() returns trigger as $$
declare
s_import int;
begin
	select preu into s_import from productes where new.idProducte = productes.idProducte;
	s_import = s_import*new.quantitat;
	update comandes set import = s_import + import where comandes.numComanda = new.numComanda;
	return null;
end;
$$ language plpgsql;

create trigger act_import after insert on liniesComandes for each row execute procedure insert_import();
