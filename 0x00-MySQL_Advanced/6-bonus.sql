-- Write a SQL script that creates a trigger that resets the attribute valid_email only when the email has been changed.
-- To create a function in sql we used a PROCEDURE
-- DELIMITER //: This changes the statement delimiter from the default semicolon (;) to a double slash (//).

DROP PROCEDURE IF EXISTS AddBonus;

DELIMITER @

CREATE PROCEDURE `AddBonus` (
IN user_id INT,
IN project_name VARCHAR(255),
IN score FLOAT 
)

BEGIN
    -- DECLARE A VARIABLE
    DECLARE project_id INT;

    -- SET A CONDITION
    IF (SELECT COUNT(*) FROM projects WHERE name = project_name) = 0 THEN
        INSERT INTO projects (name) VALUES (project_name);
    END IF;

    SET project_id = (SELECT id FROM projects WHERE name = project_name LIMIT 1);
    INSERT INTO corrections (user_id, project_id, score) VALUES(user_id, project_id, score);
END @

DELIMITER ;
