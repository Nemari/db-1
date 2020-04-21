SELECT variety, AVG(grade) FROM rate GROUP BY variety;

SELECT DISTINCT (select count(province) from manufacture
where province='California')/(select count(province) from manufacture)*100 as per_cent FROM manufacture; 

SELECT winery, grade FROM wine
JOIN rate ON wine.wine_id=rate.wine_id;
