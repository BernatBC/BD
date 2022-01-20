 select p.nomprof
select p.dni, p.nomprof, max(a.instantfi) as Darrer_instant
from professors p natural inner join assignacions a natural inner join despatxos d
where a.instantfi is not null and d.superficie > 15 and p.sou <= (select avg(p2.sou)
from professors p2)
group by p.dni, p.nomprof
