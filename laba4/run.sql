
EXEC UPDATE_ORDER('Mafia', 'Tempranillo-Merlot', 1); --valid input parameters in procedure
EXEC UPDATE_ORDER('Mafia', 'Pinoft Gris', 5); --invalid input parameters in procedure

UPDATE ORDERS
SET amount = 5; --invalid value in trigger
UPDATE ORDERS
SET amount = 101; --valid value in trigger

SELECT * FROM TABLE(GET_SCORE('Rainstorm', 10));--test for function
