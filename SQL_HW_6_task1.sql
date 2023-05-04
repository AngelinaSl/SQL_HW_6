CREATE DATABASE IF NOT EXISTS `HW_6_task1`;
USE HW_6_task1;

-- Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов.
-- Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '

DROP PROCEDURE IF EXISTS format_date;
DELIMITER //
CREATE PROCEDURE format_date
(
	IN sec INT,
    OUT date_text VARCHAR(100)
)

BEGIN
	DECLARE days INT DEFAULT 0;
    DECLARE hours INT DEFAULT 0;
    DECLARE minutes INT DEFAULT 0;
    DECLARE seconds INT DEFAULT 0;
		
    SET date_text = "";     
    
    IF sec > 0 THEN
    
    SET days =  sec / (24 * 3600) ;
	SET Hours = FLOOR(sec % (24 * 3600)) / 3600 ;
	SET Minutes =  FLOOR(((sec % (24 * 3600)) % 3600) / 60);
	SET Seconds =  FLOOR(((sec % (24 * 3600))% 3600) - 60 * Minutes);
    CASE 
    
	WHEN sec >= 86400 THEN
        SET date_text = concat(date_text, concat(days, " days"), " ");
        SET date_text = concat(date_text, concat(hours, " hours"), " ");
        SET date_text = concat(date_text, concat(minutes, " minutes"), " ");
        SET date_text = concat(date_text, concat(seconds, " seconds"), " ");
        
    WHEN sec < 86400 AND sec >=3600 THEN
		SET date_text = concat(date_text, concat(hours, " hours"), " ");
        SET date_text = concat(date_text, concat(minutes, " minutes"), " ");
        SET date_text = concat(date_text, concat(seconds, " seconds"), " ");
	
    WHEN sec >= 60 AND sec < 3600 THEN
		SET date_text = concat(date_text, concat(minutes, " minutes"), " ");
        SET date_text = concat(date_text, concat(seconds, " seconds"), " ");
    ELSE 
        SET date_text = concat(sec, " seconds");
	END CASE;
    
 END IF;   
    
END//
DELIMITER ;

CALL format_date(123456, @result);
SELECT @result;

