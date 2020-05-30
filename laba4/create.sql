CREATE TABLE CUSTOMER(
customer_id NUMERIC,
customer_name VARCHAR2(50),
CONSTRAINT customer_id_pk PRIMARY KEY (customer_id));

CREATE TABLE ORDERS(
order_id NUMERIC,
wine_id NUMERIC,
customer_id NUMERIC,
amount NUMERIC,
CONSTRAINT order_id_pk PRIMARY KEY (order_id), 
CONSTRAINT wine_id_o_fk FOREIGN KEY (wine_id) REFERENCES WINEID(wine_id),
CONSTRAINT customer_id_fk FOREIGN KEY (customer_id) REFERENCES customer(customer_id));
