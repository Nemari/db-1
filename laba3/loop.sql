DECLARE
    CURSOR c1 is
        SELECT winery, wine_id from Company;
        winery_fk VARCHAR2(50);
        wine_id NUMBER;
        BEGIN
        OPEN c1;
   FOR i IN 1..5 LOOP
        FETCH c1 INTO winery_fk, wine_id;
        EXIT WHEN c1%NOTFOUND;
        INSERT INTO WINE1 VALUES (winery_fk, wine_id);
        COMMIT;
   END LOOP;
   CLOSE c1;
END;
