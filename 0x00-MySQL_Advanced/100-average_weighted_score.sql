
-- Write a SQL script that creates a stored procedure ComputeAverageWeightedScoreForUser that computes and store the average weighted score for a student.
-- Compute average weighted score

DROP PROCEDURE IF EXISTS ComputeAverageWeightedScoreForUser;
DELIMITER //

CREATE PROCEDURE ComputeAverageWeightedScoreForUser(
    p_user_id INT
)
BEGIN
    DECLARE w_avg_score FLOAT;

    -- Calculate weighted average score
    SELECT SUM(C.score * P.weight) / SUM(P.weight)
    INTO w_avg_score
    FROM corrections AS C
    JOIN projects AS P ON C.project_id = P.id
    WHERE C.user_id = p_user_id;

    -- Update average_score for the user
    UPDATE users SET average_score = w_avg_score WHERE id = p_user_id;
END //

DELIMITER ;