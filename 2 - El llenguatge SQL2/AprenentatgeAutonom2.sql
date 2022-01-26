select distinct nom_empl 
from empleats e
where e.sou = (select max(e1.sou) from empleats e1)
group by e.num_empl
order by e.nom_empl desc
