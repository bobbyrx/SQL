SELECT DISTINCT Code.names as Name
FROM(SELECT *
FROM(SELECT *                                                                -- Find the names of the clients who have payed 
FROM client JOIN payment ON client.email=payment.client_email                -- for white tech products.
WHERE payment.pay_status='payed') as Name                                
JOIN included_in ON Name.code=included_in.pay_code) as Code 
JOIN it_tech ON Code.ser_num=it_tech.ser_num

SELECT DISTINCT shop.num, shop.shop_add, shop.phone
FROM(SELECT stored_in.shop_add as address
FROM audio_tech                                                              -- Find the shops which have audio products and print the 
JOIN stored_in ON stored_in.ser_num=audio_tech.ser_num) as Address           -- whole information avaliable for the shops.
JOIN shop ON (shop.shop_add=Address.address)

SELECT *
FROM(SELECT *
FROM tech 
WHERE brand='APPLE' or brand='HUAWEI') as Brand                              -- Find products with brand named eighter APPLE or HUAWEI.
JOIN                                                                         -- They must have eighter 6 or 4 GB ram. Print the whole inormation.
(SELECT *
FROM it_tech
WHERE ram='6 GB' or ram='4 GB') as RAM
ON (RAM.ser_num=Brand.ser_num)

SELECT DISTINCT Clients.shop_add, payment.client_email
FROM(SELECT Address.ser_num, Address.shop_add, included_in.pay_code
FROM 
(SELECT DISTINCT stored_in.shop_add, Product.ser_num                         -- Find the clients' emails who have ordered or payed for white tech 
FROM                                                                         -- which have 0 W. Find also the addresses of the stores from which 
(SELECT ser_num                                                              -- the products were taken. 
FROM white_tech
WHERE power_watts='0 W')as Product
JOIN stored_in ON stored_in.ser_num=Product.ser_num) as Address
JOIN included_in ON Address.ser_num=included_in.ser_num) as Clients
JOIN payment ON Clients.pay_code=payment.code

SELECT *
FROM(SELECT Address.num, Address.phone, Address.shop_add, purchased_from.client_email
FROM
(SELECT *                                                                     -- Find the whole information of the clients and the shops in Sofia
FROM shop                                                                     -- from which they have purchased.
WHERE shop.shop_add='Sofia, Alabin 35' 
or shop.shop_add='Sofia, Pancho Vladigerov 75')as Address
JOIN purchased_from ON Address.shop_add=purchased_from.shop_add)as Email
JOIN client ON Email.client_email=client.email