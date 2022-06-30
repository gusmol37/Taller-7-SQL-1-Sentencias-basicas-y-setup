-- ----------------------------------------------------------
-- Author Gustavo Molina <gusmol37@gmail.com>
-- Version: 0.0.0 2022-29-06
-- ----------------------------------------------------------

-- ---------------------------------------------------------
-- Consulta de productos vendidos según número de documento
-- ---------------------------------------------------------

SELECT pro_id, pro_name,supplier
FROM product
INNER JOIN sale ON product.pro_id = sale.product_pro_id
WHERE cus_type_id = 'CC' AND cus_id ='1005563852';

-- ---------------------------------------
-- Consulta de productos por proveedor
-- ---------------------------------------

SELECT pro_name,supplier
FROM product
WHERE pro_name = 'Cafe';