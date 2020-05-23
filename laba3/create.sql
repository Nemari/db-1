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
