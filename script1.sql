
-- ----------------------------------------------------------
-- Author Gustavo Molina <gusmol37@gmail.com>
-- Version: 0.0.0 2022-29-06
-- ----------------------------------------------------------


-- -----------------------------------------------
--        Base de datos store
-- -----------------------------------------------

CREATE SCHEMA IF NOT EXISTS store DEFAULT CHARACTER SET utf8 ;
USE store;
-- -----------------------------------------------
-- Tabla productos
-- -----------------------------------------------
CREATE TABLE IF NOT EXISTS product (
  pro_id INT NOT NULL AUTO_INCREMENT,
  pro_name VARCHAR(60) NOT NULL,
  supplier VARCHAR(45) NOT NULL,
  pro_sale_quantity INT NULL,
  update_at DATETIME NOT NULL,
  delete_at DATETIME NULL,
  PRIMARY KEY (pro_id))
ENGINE = InnoDB;

-- -----------------------------------------------
-- Tabla ventas
-- -----------------------------------------------

CREATE TABLE IF NOT EXISTS sale (
  sale_id INT NOT NULL AUTO_INCREMENT,
  product_pro_id INT NOT NULL,
  pro_quantity INT NOT NULL,
  cus_type_id VARCHAR(7) NOT NULL,
  cus_id VARCHAR(15) NOT NULL,
  update_at DATETIME NOT NULL,
  delete_at DATETIME NULL,
  PRIMARY KEY (sale_id),
  INDEX fk_sale_product1_idx (product_pro_id ASC) VISIBLE,
  CONSTRAINT fk_sale_product1
    FOREIGN KEY (product_pro_id)
    REFERENCES product (pro_id)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;

-- -----------------------------------------------
-- Tabla productos
-- -----------------------------------------------
INSERT INTO product(pro_name,supplier,update_at)
VALUES ('Pasta','La Productora', NOW());

INSERT INTO product(pro_name,supplier,update_at)
VALUES ('Maiz tierno','El Arco', NOW());

INSERT INTO product(pro_name,supplier,update_at)
VALUES ('Galletas Oreo 12 unidades','Nabisco', NOW());

INSERT INTO product(pro_name,supplier,update_at)
VALUES ('Leche','Doña Leche', NOW());

INSERT INTO product(pro_name,supplier,update_at)
VALUES ('Aceite','El Girasol', NOW());

INSERT INTO product(pro_name,supplier,update_at)
VALUES ('Gaseosa Coca-Cola 1.5 lt','Coca-Cola', NOW());

INSERT INTO product(pro_name,supplier,update_at)
VALUES ('Harina de trigo 1 Kg','Distrimolinos', NOW());

INSERT INTO product(pro_name,supplier,update_at)
VALUES ('Arepas de maiz blanco','La Siembra', NOW());

INSERT INTO product(pro_name,supplier,update_at)
VALUES ('Azucar 1 Kg','Rio Paila', NOW());

INSERT INTO product(pro_name,supplier,update_at)
VALUES ('Frutiño','La Ceiba', NOW());

-- ----------------------------------
-- Llenar tabla ventas
-- ----------------------------------

INSERT INTO sale(product_pro_id, pro_quantity, cus_type_id, cus_id, update_at)
VALUES (3,2,'CC','53478951',NOW());

INSERT INTO sale(product_pro_id, pro_quantity, cus_type_id, cus_id, update_at)
VALUES (1,2,'CC','1002862743',NOW());

INSERT INTO sale(product_pro_id, pro_quantity, cus_type_id, cus_id, update_at)
VALUES (9,4,'CC','1005563852',NOW());

INSERT INTO sale(product_pro_id, pro_quantity, cus_type_id, cus_id, update_at)
VALUES (8,1,'CC','34859746',NOW());

INSERT INTO sale(product_pro_id, pro_quantity, cus_type_id, cus_id, update_at)
VALUES (6,5,'CC','1000749851',NOW());

INSERT INTO sale(product_pro_id, pro_quantity, cus_type_id, cus_id, update_at)
VALUES (7,4,'CC','52749813',NOW());

SELECT pro_id, pro_name,supplier
FROM product
WHERE pro_id = 3 OR pro_id =9 OR pro_id = 6;

-- ----------------------------
-- Actualizar productos
-- ----------------------------

UPDATE product
SET pro_name = 'Pan Tajado Integral', supplier = 'El Molino'
WHERE pro_id = 1;

UPDATE product
SET pro_name = 'Pasta Doria 1 Kg', supplier = 'Doria'
WHERE pro_id = 6;

UPDATE product
SET pro_name = 'Cafe', supplier = 'Aguila Roja'
WHERE pro_id = 8;

-- -----------------------------
-- Borrado lógico
-- -----------------------------

UPDATE sale
SET delete_at = NOW()
WHERE sale_id= 2;

UPDATE sale
SET delete_at = NOW()
WHERE sale_id= 7;

-- -----------------------
-- Borrado físico
-- -----------------------

DELETE FROM sale
WHERE sale_id = 3 OR sale_id = 4;

DELETE FROM sale
WHERE sale_id = 5;