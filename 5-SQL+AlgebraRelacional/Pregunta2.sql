select d.num_dpt, d.nom_dpt, d.ciutat_dpt
from departaments d natural inner join empleats e1
where not exists(select *
		from empleats e2 
		where e2.num_dpt = e1.num_dpt and e1.num_proj != e2.num_proj)
group by d.num_dpt
