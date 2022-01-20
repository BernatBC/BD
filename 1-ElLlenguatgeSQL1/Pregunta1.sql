select distinct d.num_dpt, d.nom_dpt
from departaments d, empleats e
where e.sou >= 200000 and d.ciutat_dpt in ('MADRID') and e.num_dpt = d.num_dpt
