-- Write a SQL script that creates a stored procedure ComputeAverageWeightedScoreForUser that computes and store the average weighted score for a student.
-- Average weighted score for all

DELIMITER $$

CREATE PROCEDURE `ComputeAverageWeightedScoreForUsers`()
BEGIN
    -- Update the average_score for all users
    UPDATE users U
    SET U.average_score = (
        -- Calculate the weighted average score for each user
        SELECT SUM(P.weight * C.score) / SUM(P.weight)
        FROM projects P
        INNER JOIN corrections C ON P.id = C.project_id
        WHERE C.user_id = U.id
    );
END $$

DELIMITER ;
