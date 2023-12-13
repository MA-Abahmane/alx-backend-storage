-- Write a SQL script that creates a table users following these requirements
-- We can group a database by an attribute and sum all its corresponding values

SELECT origin AS origin, SUM(fans) AS nb_fans
FROM metal_bands
GROUP BY origin
ORDER BY nb_fans DESC;
