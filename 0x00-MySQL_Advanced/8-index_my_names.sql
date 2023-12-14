-- Write a SQL script that creates an index idx_name_first on the table names and the first letter of name.
-- To get the first letter of name we do `name(1)`

CREATE INDEX idx_name_first_score ON `names` (name(1));
