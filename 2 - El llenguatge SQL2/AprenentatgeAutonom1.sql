select p.num_proj, p.nom_proj
from empleats e, projectes p 
where e.num_proj = p.num_proj
group by p.num_proj
having count(p.num_proj = e.num_proj) >= 2
order by p.num_proj desc
