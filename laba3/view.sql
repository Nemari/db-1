CREATE VIEW CompanyType AS
SELECT Company.wine_id, Company.winery, WineType.wine_type
FROM Company
JOIN WineType
ON WineType.wine_id=Company.wine_id; 
