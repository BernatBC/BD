select a.modul, sum(a.instantfi - a.instantinici) 
from assignacions a
where a.instantfi is not null
group by a.modul
