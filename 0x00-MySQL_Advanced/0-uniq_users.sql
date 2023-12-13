-- Write a SQL script that creates a table users following these requirements
-- A `Unique` attribute can be obtained by only one party

CREATE TABLE IF NOT EXISTS `users` (
    `Id` INT AUTO_INCREMENT PRIMARY KEY,
    `email` VARCHAR(255) NOT NULL UNIQUE,
    `name` VARCHAR(20)
)
