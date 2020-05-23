CREATE TABLE WineId(
wine_id NUMERIC PRIMARY KEY);

CREATE TABLE Country(
country VARCHAR2(50) UNIQUE,
wine_id NUMERIC,
province VARCHAR(50) UNIQUE,
CONSTRAINT wine_id_c_fk FOREIGN KEY (wine_id) REFERENCES WineId(wine_id));

CREATE TABLE Province(
province VARCHAR2(50),
winery VARCHAR2(100) UNIQUE,
CONSTRAINT province_fk FOREIGN KEY (province) REFERENCES Country(province));

CREATE TABLE Company(
winery VARCHAR2(100),
wine_id NUMERIC,
CONSTRAINT winery_fk FOREIGN KEY (winery) REFERENCES Province(winery));

CREATE TABLE WineType(
wine_id NUMERIC,
wine_type VARCHAR(50),
CONSTRAINT wine_id_fk FOREIGN KEY (wine_id) REFERENCES WineId(wine_id));

CREATE TABLE Score(
wine_id NUMERIC,
score FLOAT,
CONSTRAINT wine_id_s_fk FOREIGN KEY (wine_id) REFERENCES WineId(wine_id));
                                                                
CREATE VIEW CompanyScore AS
SELECT Company.winery, Score.score
FROM Company
JOIN Score
ON Company.wine_id = Score.wine_id;     
                                                                
                                                                #POPULATE
                                                               insert into WineId(wine_id)
values (1);
insert into WineId(wine_id)
values (2);
insert into WineId(wine_id)
values (3);
insert into WineId(wine_id)
values (4);
insert into WineId(wine_id)
values (5);

insert into WineType(wine_id, wine_type)
values (1, 'White Blend');
insert into WineType(wine_id, wine_type)
values (2, 'Portuguese Red');
insert into WineType(wine_id, wine_type)
values (3, 'Pinot Gris');
insert into WineType(wine_id, wine_type)
values (4, 'Riesling');
insert into WineType(wine_id, wine_type)
values (5, 'Pinot Noir');

insert into Score(wine_id, score)
values(1, 87);
insert into Score(wine_id, score)
values(2, 85);
insert into Score(wine_id, score)
values(3, 84);
insert into Score(wine_id, score)
values(4, 89);
insert into Score(wine_id, score)
values(5, 95);

insert into Country(country, province, wine_id)
values('Italy', 'Sicily and Sardinia', 1);
insert into Country(country, province, wine_id)
values('Portugal', 'Douro', 2);
insert into Country(country, province, wine_id)
values('US', 'Oregon', 3);
insert into Country(country, province, wine_id)
values('Spain', 'Northern Spain', 4);
insert into Country(country, province, wine_id)
values('France', 'Alsace', 5);

insert into Province(province, winery)
values('Sicily and Sardinia', 'Nicosia');
insert into Province(province, winery)
values('Douro', 'Quinta dos Avidagos');
insert into Province(province, winery)
values('Oregon', 'Rainstorm');
insert into Province(province, winery)
values('Northern Spain', 'St. Julian');
insert into Province(province, winery)
values('Alsace', 'Sweet Cheeks');

insert into Company(winery, wine_id)
values ('Nicosia', 1);
insert into Company(winery, wine_id)
values ('Quinta dos Avidagos', 2);
insert into Company(winery, wine_id)
values ('Rainstorm', 3);
insert into Company(winery, wine_id)
values ('St. Julian', 4);
insert into Company(winery, wine_id)
values ('Sweet Cheeks', 5);
