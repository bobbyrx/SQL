/* Find the number of PC, Laptops and Smartphones each client has ordered or paid */
SELECT DISTINCT payment.client_email as Email, SUM(Product.ser_num) as Sum_it_tech
FROM  
(SELECT DISTINCT included_in.pay_code , COUNT(included_in.count_items)as ser_num
FROM
(SELECT *
FROM tech
WHERE tech.type_tech='PC' or tech.type_tech='Laptop' or tech.type_tech='Smartphone')as Tech
JOIN included_in ON included_in.ser_num=Tech.ser_num
Group by included_in.pay_code) as Product
RIGHT JOIN payment ON payment.code=Product.pay_code
GROUP by payment.client_email


/* Find those clients who have purchased more than once and print their names and e-mails */
SELECT client.names as Name, client.email as Email
FROM
(SELECT payment.client_email
FROM payment 
GROUP BY payment.client_email
HAVING COUNT(payment.code)>1)as Counter
JOIN client ON Counter.client_email=client.email

/* Find those clients who have purchased the most products at once and print their e-mails and the number of products */
SELECT DISTINCT payment.client_email as Email, Beginer.counter as MAX_items
FROM 
(SELECT Code.pay_code, Code.counter
FROM 
(SELECT MAX(Product.counter) as MAX_items
FROM (SELECT included_in.pay_code , Count(included_in.count_items) as counter
FROM included_in
GROUP BY included_in.pay_code) as Product)as Max_counter,
(SELECT included_in.pay_code , Count(included_in.count_items) as counter
FROM included_in
GROUP BY included_in.pay_code) as Code
WHERE Code.counter=Max_counter.MAX_items)as Beginer
JOIN payment ON payment.code=Beginer.pay_code

/* Find the client who has purchased the most expensive purchase and print their e-mail and the cost of the purchase */
SELECT payment.client_email as Email, Purchase.money as Money
FROM
(SELECT Number.pay_code, Max_money.money
FROM
(SELECT MAX(SUM_money.Money) as money
FROM (SELECT included_in.pay_code, SUM(tech.price)as Money
FROM tech, included_in
WHERE tech.ser_num=included_in.ser_num
GROUP BY included_in.pay_code) as SUM_money)as Max_money,
(SELECT included_in.pay_code, SUM(tech.price)as Money
FROM tech, included_in
WHERE tech.ser_num=included_in.ser_num
GROUP BY included_in.pay_code)as Number
WHERE Number.Money=Max_money.money)as Purchase
JOIN payment ON payment.code=Purchase.pay_code

/* Find the average price of every type of tech prduct and print the type and the average cost */
SELECT tech.type_tech as Type_product, AVG(tech.price) as AVG_price
FROM tech
GROUP BY tech.type_tech
ORDER BY (AVG_price)
