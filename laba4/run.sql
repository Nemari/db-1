CREATE PROCEDURE UPDATE_ORDER(
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
EXEC UPDATE_ORDER('Mafia', 'Tempranillo-Merlot', 1); --valid input parameters
EXEC UPDATE_ORDER('Mafia', 'Pinoft Gris', 5); --invalid input parameters
