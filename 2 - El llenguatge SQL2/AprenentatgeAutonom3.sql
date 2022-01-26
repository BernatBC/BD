update projectes 
set pressupost = pressupost + 500000
where exists (select *
		from empleats e, departaments d 
		where projectes.num_proj = e.num_proj and e.num_dpt = d.num_dpt and d.ciutat_dpt = 'BARCELONA')
