CREATE OR REPLACE PACKAGE BOTTLE AS
    PROCEDURE UPDATE_ORDER(p_customer_name IN VARCHAR2, p_wine_type IN VARCHAR2, p_amount IN NUMERIC);
    FUNCTION GET_SCORE(f_winery VARCHAR2, f_score FLOAT) RETURN ReturnObjectlist PIPELINED;
END BOTTLE;

CREATE OR REPLACE PACKAGE BODY BOTTLE AS
    PROCEDURE UPDATE_ORDER(
p_customer_name IN VARCHAR2,
p_wine_type IN VARCHAR2,
p_amount IN NUMERIC)
AS
BEGIN
    DECLARE 
        l_wine_id NUMERIC;
        l_customer_id NUMERIC;
        
    BEGIN
        SELECT wine_id INTO l_wine_id FROM WineType WHERE wine_type = p_wine_type;
        SELECT customer_id INTO l_customer_id FROM Customer WHERE customer_name = p_customer_name; 
        IF l_wine_id IS NULL
        THEN 
        raise_application_error(-20000, 'Wine type not found', TRUE); 
        END IF;
         IF l_customer_id IS NULL
        THEN 
        raise_application_error(-20001, 'Customer not found', TRUE); 
        END IF;
        UPDATE ORDERS
        SET amount = p_amount
        WHERE wine_id = l_wine_id AND customer_id = l_customer_id;
    END;
END;
    FUNCTION GET_SCORE(f_winery VARCHAR2, f_score FLOAT)
          RETURN ReturnObjectlist PIPELINED AS
BEGIN
FOR i IN (
      SELECT score, winery FROM CompanyScore WHERE winery = f_winery AND score > f_score)
    LOOP
        PIPE ROW (ReturnObject(i.winery, i.score));    
    END LOOP; 
RETURN;
END;
END BOTTLE;

EXEC BOTTLE.UPDATE_ORDER('Mafia', 'Tempranillo-Merlot', 1000);--valid execution from package
