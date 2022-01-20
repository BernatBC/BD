select distinct e.ciutat_empl 
from empleats e 
where e.ciutat_empl not in (select d.ciutat_dpt 
							from departaments d)
