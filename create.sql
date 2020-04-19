CREATE TABLE wine(
wine_id NUMBER PRIMARY KEY,
country_fk VARCHAR2(50)
);
CREATE TABLE manufacture(
country VARCHAR2(50) PRIMARY KEY,
province VARCHAR2(50),
winery VARCHAR2(120)
);
CREATE TABLE rate(
wine_id NUMBER PRIMARY KEY,
winery VARCHAR2(120),
variety VARCHAR2(120),
grade FLOAT
);
ALTER TABLE wine
ADD FOREIGN KEY (country_fk) REFERENCES manufacture(country); 

ALTER TABLE wine
ADD FOREIGN KEY (wine_id) REFERENCES rate(wine_id); 
