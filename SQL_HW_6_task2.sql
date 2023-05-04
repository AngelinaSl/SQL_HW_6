CREATE DATABASE IF NOT EXISTS `HW_6_task2`;
USE HW_6_task2;

-- Выведите только четные числа от 1 до 10.
-- Пример: 2,4,6,8,10

DROP PROCEDURE IF EXISTS even_numbers;
DELIMITER //
CREATE PROCEDURE even_numbers
(
	IN inp_number INT
)
BEGIN
	DECLARE n INT; 
    DECLARE result VARCHAR(45) DEFAULT "";
    SET n = inp_number;
    
    WHILE n < 10 DO
    SET result = CONCAT(result, n, ",");
    SET n = n + 2;
    
    END WHILE;
    SET result = CONCAT(result, n);
    SELECT result;
END //
DELIMITER ;

CALL even_numbers(2);