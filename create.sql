CREATE TABLE wine(
wine_id NUMBER NOT NULL PRIMARY KEY,
winery_fk VARCHAR2(50) UNIQUE NOT NULL
);
CREATE TABLE manufacture(
winery VARCHAR2(120) PRIMARY KEY,
province VARCHAR2(50),
country VARCHAR2(50)

);
CREATE TABLE rate(
wine_id NUMBER PRIMARY KEY,
winery VARCHAR2(120),
variety VARCHAR2(120),
grade FLOAT
);

ALTER TABLE rate ADD CONSTRAINT wineID FOREIGN KEY (wine_id) REFERENCES wine(wine_id);
ALTER TABLE manufacture ADD CONSTRAINT wineryFK FOREIGN KEY (winery) REFERENCES wine(winery_fk);
