select d.num_dpt , d.nom_dpt 
from departaments d 
where not exists (select *
					from empleats e
					where e.ciutat_empl = 'MADRID' and e.num_dpt = d.num_dpt)
