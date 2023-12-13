-- Write a SQL script that creates a stored procedure ComputeAverageScoreForUser that computes and store the average score for a student. Note: An average score can be a decimal
-- To create a function in sql we used a PROCEDURE
-- DELIMITER //: This changes the statement delimiter from the default semicolon (;) to a double slash (//).

DROP PROCEDURE IF EXISTS ComputeAverageScoreForUser;

DELIMITER @

CREATE PROCEDURE `ComputeAverageScoreForUser` (
IN user_id INT
)

BEGIN
    -- DECLARE A VARIABLE
    DECLARE user_avg INT;
    
    -- SET VARIABLE VALUE
    SET user_avg = (SELECT AVG(score) FROM corrections AS C WHERE C.user_id=user_id);

    UPDATE users SET average_score = user_avg WHERE users.id=user_id;
END @

DELIMITER ;
