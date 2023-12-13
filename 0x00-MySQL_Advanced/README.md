# MySQL Cheat Sheet

## Table of Contents

1. [Connecting to MySQL](#connecting-to-mysql)
2. [Database Operations](#database-operations)
3. [Table Operations](#table-operations)
4. [Data Querying](#data-querying)
5. [Data Manipulation](#data-manipulation)
6. [Data Definition](#data-definition)
7. [User Management](#user-management)

## Connecting to MySQL

### Connect to MySQL Server
``` bash
mysql -u username -p
```

### Exit MySQL
``` sql
EXIT;
```

## Database Operations

### Create a Database
``` sql
CREATE DATABASE database_name;
```

### Delete a Database
```sql
DROP DATABASE database_name;
```

### Select a Database
``` sql
USE database_name;
```

### Show Databases
``` sql
SHOW DATABASES;
```

## Table Operations

### Create a Table
``` sql
CREATE TABLE table_name (
    column1 datatype,
    column2 datatype,
    ...
);
```

### Delete a Table
``` sql
DROP TABLE table_name;
```

### Show Tables
``` sql
SHOW TABLES;
```

### Describe Table
``` sql
DESCRIBE table_name;
```

## Data Querying

### SELECT Statement
``` sql
SELECT column1, column2 FROM table_name WHERE condition;
```

### DISTINCT Values
``` sql
SELECT DISTINCT column FROM table_name;
```

### ORDER BY
``` sql
SELECT * FROM table_name ORDER BY column ASC|DESC;
```

### LIMIT
``` sql
SELECT * FROM table_name LIMIT 10;
```

## Data Manipulation

### INSERT Data
``` sql
INSERT INTO table_name (column1, column2) VALUES (value1, value2);
```

### UPDATE Data
``` sql
UPDATE table_name SET column1 = value1 WHERE condition;
```

### DELETE Data
``` sql
DELETE FROM table_name WHERE condition;
```

## Data Definition

### ALTER TABLE
``` sql
ALTER TABLE table_name ADD COLUMN new_column datatype;
```

### Rename Table
``` sql
RENAME TABLE old_table TO new_table;
```

## User Management

### Create User
``` sql
CREATE USER 'username'@'localhost' IDENTIFIED BY 'password';
```

### Grant Permissions
``` sql
GRANT permission1, permission2 ON database_name.table_name TO 'username'@'localhost';
```

### Revoke Permissions
``` sql
REVOKE permission1, permission2 ON database_name.table_name FROM 'username'@'localhost';
```

### Change Password
``` sql
SET PASSWORD FOR 'username'@'localhost' = PASSWORD('new_password');
```

### Remove User
``` sql
DROP USER 'username'@'localhost';
```


[Full Cheatsheet](https://devhints.io/mysql)
