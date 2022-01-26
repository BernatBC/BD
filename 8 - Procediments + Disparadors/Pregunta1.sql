create function city() returns trigger as $$
begin 
	if (exists(select e2.ciutat2 from empleats2 e2 where old.ciutat2 = e2.ciutat2)) then return null;
	end if;
	delete from empleats1 e1 where e1.ciutat1 = old.ciutat2;
	return null;
end;
$$ language plpgsql;

create trigger check_city after delete or update of ciutat2 on empleats2 for each row execute procedure city();
