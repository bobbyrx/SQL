SELECT DISTINCT payment.client_email as Email
FROM payment,                                                  -- Find the emails of people who have ordered or payed for audio products.
(SELECT included_in.pay_code as code                           
FROM audio_tech, included_in                                    
WHERE audio_tech.ser_num=included_in.ser_num) as Audio
WHERE payment.code=Audio.code

SELECT stored_in.shop_add as Address
FROM stored_in,                                                -- Find the addresses of shops which store in them white tech products 
(SELECT ser_num                                                -- which have class A+.
FROM white_tech
WHERE class='A+') as Product
WHERE Product.ser_num=stored_in.ser_num

SELECT PC.brand as Brand, PC.model as Model, RAM.memory as Memory
FROM 
(SELECT *                                                      -- Find the brand, model and memory of PC product which have 8 GB DDR4 RAM and
FROM it_tech                                                   -- price below 1500.
WHERE ram='8 GB DDR4')as RAM,
(SELECT *
FROM tech
WHERE type_tech='PC' and price<1500) as PC
WHERE PC.ser_num=RAM.ser_num

SELECT SUM(Price_tag.price) as Money
FROM included_in,                                              -- Find how much money the web site has earned from all the purchases.
(SELECT ser_num as num , price 
FROM tech) as Price_tag
WHERE included_in.ser_num=Price_tag.num

SELECT tech.brand as Brand, tech.model as Model, tech.type_tech as Type, tech.price as Price
FROM tech,
(SELECT included_in.ser_num
FROM included_in,
(SELECT code                                                   -- Find all the products which have been ordered and print their brand, model, 
FROM payment                                                   -- type and price. Order the results by brand.
WHERE pay_status='ordered') as Ordered
WHERE included_in.pay_code=Ordered.code) as Product
WHERE Product.ser_num=tech.ser_num
ORDER BY Brand