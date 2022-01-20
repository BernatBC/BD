select d.num_dpt, d.nom_dpt
from departaments d inner join empleats e on d.num_dpt = e.num_dpt 
group by d.num_dpt 
having 2 <= count(distinct e.ciutat_empl)
