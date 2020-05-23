CREATE VIEW CompanyScore AS
SELECT Company.winery, Score.score
FROM Company
JOIN Score
ON Company.wine_id = Score.wine_id;
