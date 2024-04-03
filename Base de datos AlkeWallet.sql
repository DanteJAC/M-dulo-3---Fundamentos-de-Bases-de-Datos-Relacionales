-- CREACION TABLAS E INGRESO DE BASE DE DATOS

	-- CREANDO TABLA USUARIO
    
CREATE TABLE Usuario (
	user_id INT PRIMARY KEY,
	nombre VARCHAR (60),
	correo_electronico VARCHAR (60),
	contrasena VARCHAR (100),
	saldo DECIMAL (10, 2)
);

-- CREANDO TABLA TRANSACCION
    
CREATE TABLE Transaccion (
	transaction_id INT PRIMARY KEY,
    importe DECIMAL (10, 2),
    transaction_date DATE
    );
    
    -- CREANDO TABLA MONEDA
    
CREATE TABLE Moneda (
	currency_id INT PRIMARY KEY,
    currency_name VARCHAR (60),
	currency_symbol VARCHAR (60)
    );
    
    -- ALTERNADO COLUMNAS DE CLAVES FORANEAS DE "VARCHAR" A "INT" "NOT NULL" PARA ENLAZAR A  TABLA USUARIO
    
ALTER TABLE `alkewallet`.`transaccion` 
CHANGE COLUMN `sender_user_id` `sender_user_id` INT(11) NOT NULL ,
CHANGE COLUMN `receiver_usar_id` `receiver_usar_id` INT(11) NOT NULL ;

 -- MODIFICANDO COLUMNAS A "NOT NULL" EN TABLA MONEDA
    ALTER TABLE `alkewallet`.`moneda`
CHANGE COLUMN `currency_name` `currency_name` VARCHAR(60) NOT NULL ,
CHANGE COLUMN `currency_symbol` `currency_symbol` VARCHAR(60) NOT NULL;

	-- INGRESANDO CLAVE FORANEA ENZALANDO TABLAS USUARIO CON TABLA MONEDA
    
ALTER TABLE usuario
ADD currency_id INT,
ADD foreign key (currency_id) REFERENCES moneda(currency_id);
	
    -- INGRESANDO CLAVES FORANEAS ENLAZANDO TABLA TRANSACCION CON TABLA USUARIO
    
ALTER TABLE Transaccion 
ADD sender_user_id INT NOT NULL,
ADD foreign key (sender_user_id) REFERENCES usuario(user_id),
ADD receiver_user_id INT NOT NULL,
ADD FOREIGN KEY (receiver_user_id) REFERENCES usuario(user_id);


	-- INGRESANDO DATOS 
    
INSERT INTO `alkewallet`.`usuario` (`nombre`, `correo_electronico`, `contrasena`, `saldo`) 
VALUES ('Dante', 'dante.escalona@gmail.com', 'password', '999999');
INSERT INTO `alkewallet`.`usuario` (`nombre`, `correo_electronico`, `contrasena`, `saldo`) 
VALUES ('Rene', 'Rene.amigol@gmail.com', 'password', "999999");
INSERT INTO `alkewallet`.`usuario` (`nombre`, `correo_electronico`, `contrasena`, `saldo`) 
VALUES ('Sudan', 'sudan.seoirs@gmail.com', 'password', "999999");


    -- INGRESANDO DATOS EN TABLA TRANSACCION
    
INSERT INTO `alkewallet`.`transaccion` (`importe`,`transaction_date`,`sender_user_id`, `receiver_user_id`)
VALUES ('100', '2020-01-27', '1', '2');
INSERT INTO `alkewallet`.`transaccion` (`importe`,`transaction_date`,`sender_user_id`, `receiver_user_id`)
VALUES ('100', '2020-05-27', '2', '3');
INSERT INTO `alkewallet`.`transaccion` (`importe`,`transaction_date`,`sender_user_id`, `receiver_user_id`)
VALUES ('100', '2020-08-27', '3', '1');
INSERT INTO `alkewallet`.`transaccion` (`importe`, `transaction_date`, `sender_user_id`, `receiver_user_id`) 
VALUES ('100', '2021-05-15', '2', '1');
INSERT INTO `alkewallet`.`transaccion` (`importe`, `transaction_date`, `sender_user_id`, `receiver_user_id`) 
VALUES ('100', '2021-12-20', '1', '3');
INSERT INTO `alkewallet`.`transaccion` (`importe`, `transaction_date`, `sender_user_id`, `receiver_user_id`) 
VALUES ('100', '2022-04-05', '3', '2');

	-- ACTUALIZANDO BASE DE DATOS DE FECHA EN TABLA TRANSACCION
    
UPDATE `alkewallet`.`transaccion` SET `transaction_date` = '2020-01-20' WHERE (`transaction_id` = '1');
UPDATE `alkewallet`.`transaccion` SET `transaction_date` = '2020-05-05' WHERE (`transaction_id` = '2');
UPDATE `alkewallet`.`transaccion` SET `transaction_date` = '2021-03-27' WHERE (`transaction_id` = '3');

	-- INGRESANDO DATOS A TABLA MONEDA
    
INSERT INTO `alkewallet`.`moneda` (`currency_name`, `currency_symbol`) VALUES ('Peso Chileno', 'CLP');
INSERT INTO `alkewallet`.`moneda` (`currency_name`, `currency_symbol`) VALUES ('Dolar', 'USD');
INSERT INTO `alkewallet`.`moneda` (`currency_name`, `currency_symbol`) VALUES ('Euro', 'EUR');

    -- ENLAZANDO UNA DIVISA DE LA TABLA MONEDA A CADA USUARIO EN TABLA USUARIO PARA LAS TRANSACCIONES
    
UPDATE `alkewallet`.`usuario` SET `currency_id` = '2' WHERE (`user_id` = '1');
UPDATE `alkewallet`.`usuario` SET `currency_id` = '3' WHERE (`user_id` = '2');
UPDATE `alkewallet`.`usuario` SET `currency_id` = '1' WHERE (`user_id` = '3');
   


 -- "FIN DE LA CREACION DE TABLAS E INGRESO DE BASE DE DATOS"   
    
