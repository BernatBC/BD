select d.num_dpt , d.nom_dpt , AVG(e.sou) as SOU
from empleats e natural inner join departaments d
where d.ciutat_dpt  = 'MADRID'
group by d.num_dpt , d.nom_dpt
