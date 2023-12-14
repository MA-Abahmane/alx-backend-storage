
-- Write a SQL script that creates a stored procedure ComputeAverageWeightedScoreForUser that computes and store the average weighted score for a student.

DELIMITER //

CREATE PROCEDURE ComputeAverageWeightedScoreForUser(IN p_user_id INT)
BEGIN
    DECLARE total_score FLOAT;
    DECLARE total_weight INT;

    -- Initialize variables
    SET total_score = 0;
    SET total_weight = 0;

    -- Calculate weighted average score for the user
    SELECT SUM(c.score * p.weight) INTO total_score, SUM(p.weight) INTO total_weight
    FROM corrections c
    JOIN projects p ON c.project_id = p.id
    WHERE c.user_id = p_user_id;

    -- Update average_score for the user
    IF total_weight > 0 THEN
        UPDATE users SET average_score = total_score / total_weight WHERE id = p_user_id;
    END IF;
END //

DELIMITER ;