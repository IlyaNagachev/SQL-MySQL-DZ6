DELIMITER //

CREATE FUNCTION format_seconds(seconds_input INT)
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
    DECLARE days INT;
    DECLARE hours INT;
    DECLARE minutes INT;
    DECLARE seconds INT;
    DECLARE result VARCHAR(100);

    SET days = FLOOR(seconds_input / 86400);
    SET hours = FLOOR((seconds_input % 86400) / 3600);
    SET minutes = FLOOR((seconds_input % 3600) / 60);
    SET seconds = seconds_input % 60;

    SET result = CONCAT(days, ' days ', hours, ' hours ', minutes, ' minutes ', seconds, ' seconds');
    RETURN result;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE output_even_numbers()
BEGIN
    DECLARE num INT DEFAULT 2;
    
    WHILE num <= 10 DO
        SELECT num;
        SET num = num + 2;
    END WHILE;
END //

DELIMITER ;

SELECT format_seconds(123456) AS formatted_time;

CALL output_even_numbers();
