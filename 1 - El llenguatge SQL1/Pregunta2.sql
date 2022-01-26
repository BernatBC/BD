select d.nom_dpt , p.nom_proj
from empleats e natural inner join departaments d natural inner join projectes p
where e.num_empl = 2
