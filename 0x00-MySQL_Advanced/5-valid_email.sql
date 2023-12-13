-- Write a SQL script that creates a trigger that resets the attribute valid_email only when the email has been changed.
-- To set control on Insertion we cerate a TRIGGER
-- DELIMITER //: This changes the statement delimiter from the default semicolon (;) to a double slash (//).

DELIMITER $

CREATE TRIGGER set_valid_email
BEFORE UPDATE ON users
FOR EACH ROW

BEGIN
    IF NEW.email <> OLD.email THEN
        SET NEW.valid_email = 0;
    END IF;
END $

DELIMITER ;