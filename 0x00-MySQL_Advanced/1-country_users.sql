-- Write a SQL script that creates a table users following these requirements
-- To create an enumeration of countries in MySQL, we will use an ENUM

CREATE TABLE IF NOT EXISTS `users` (
    `Id` INT AUTO_INCREMENT PRIMARY KEY,
    `email` VARCHAR(255)NOT NULL UNIQUE,
    `name` VARCHAR(20),
    `country` ENUM('US', 'CO', 'TN') DEFAULT 'US' NOT NULL
)
