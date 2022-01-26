INSERT INTO cost_ciutat
SELECT DISTINCT d.ciutat_dpt, 0
FROM departaments d
WHERE NOT EXISTS (SELECT *
				      FROM empleats e, departaments d1
				      WHERE e.num_dpt = d1.num_dpt AND d.ciutat_dpt = d1.ciutat_dpt)
