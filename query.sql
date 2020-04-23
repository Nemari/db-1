SELECT variety, AVG(grade) FROM rate GROUP BY variety;

select count(province)/(select count(province)from manufacture)*100 as Procent, province from manufacture group by province 

SELECT winery, grade FROM wine
JOIN rate ON wine.wine_id=rate.wine_id;
