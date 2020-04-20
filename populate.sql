INSERT INTO wine(wine_id, winery_fk)
VALUES (1, 'Heitz');
INSERT INTO wine(wine_id, winery_fk)
VALUES (2, 'Bodega Carmen Rodríguez');
INSERT INTO wine(wine_id, winery_fk)
VALUES (3, 'Macauley');
INSERT INTO wine(wine_id, winery_fk)
VALUES (4, 'Ponzi');
INSERT INTO wine(wine_id, winery_fk)
VALUES (5, 'Domaine de la Bégude');
INSERT INTO wine(wine_id, winery_fk)
VALUES (6, 'Bergströme');
INSERT INTO wine(wine_id, winery_fk)
VALUES (7, 'Numanthia');
INSERT INTO wine(wine_id, winery_fk)
VALUES (8, 'Maurodos');
INSERT INTO wine(wine_id, winery_fk)
VALUES (9, 'Borgo del Tiglio');
INSERT INTO wine(wine_id, winery_fk)
VALUES (10, 'Hall');

INSERT INTO rate (wine_id, winery, variety, grade)
VALUES(1, 'Heitz', 'Cabernet Sauvignon', 96);
INSERT INTO rate (wine_id, winery, variety, grade)
VALUES(2, 'Bodega Carmen Rodríguez', 'Tinta de Toro', 96);
INSERT INTO rate (wine_id, winery, variety, grade)
VALUES(3, 'Macauley', 'Sauvignon Blanc', 96);
INSERT INTO rate (wine_id, winery, variety, grade)
VALUES(4, 'Ponzi', 'Pinot Noir', 96);
INSERT INTO rate (wine_id, winery, variety, grade)
VALUES(5, 'Domaine de la Bégude', 'Provence red blend', 95);
INSERT INTO rate (wine_id, winery, variety, grade)
VALUES(6, 'Bergströme', 'Pinot Noir', 95);
INSERT INTO rate (wine_id, winery, variety, grade)
VALUES(7, 'Numanthia', 'Tinta de Toro', 95);
INSERT INTO rate (wine_id, winery, variety, grade)
VALUES(8, 'Maurodos', 'Tinta de Toro', 95);
INSERT INTO rate (wine_id, winery, variety, grade)
VALUES(9, 'Borgo del Tiglio', 'Friulano', 95);
INSERT INTO rate (wine_id, winery, variety, grade)
VALUES(10, 'Hall', 'Cabernet Sauvignon', 95);

INSERT INTO manufacture (winery, province, country)
VALUES ('Heitz', 'California', 'US');
INSERT INTO manufacture (winery, province, country)
VALUES ('Bodega Carmen Rodríguez', 'Northern Spain', 'Spain');
INSERT INTO manufacture (winery, province, country)
VALUES ('Macauley', 'California', 'US');
INSERT INTO manufacture (winery, province, country)
VALUES ('Ponzi', 'Oregon', 'US');
INSERT INTO manufacture (winery, province, country)
VALUES ('Domaine de la Bégude', 'Provence', 'France');
INSERT INTO manufacture (winery, province, country)
VALUES ('Bergströme', 'Oregon', 'US');
INSERT INTO manufacture (winery, province, country)
VALUES ('Numanthia', 'Northern Spain', 'Spain');
INSERT INTO manufacture (winery, province, country)
VALUES ('Maurodos', 'Northern Spain', 'Spain');
INSERT INTO manufacture (winery, province, country)
VALUES ('Borgo del Tiglio', 'Northeastern Italy', 'Italy');
INSERT INTO manufacture (winery, province, country)
VALUES ('Hall', 'California', 'US');
