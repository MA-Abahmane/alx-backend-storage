-- Write a SQL script that creates a trigger that decreases the quantity of an item after adding a new order
-- To set control on Insertion we cerate a TRIGGER
-- DELIMITER //: This changes the statement delimiter from the default semicolon (;) to a double slash (//).

DELIMITER #

CREATE TRIGGER `decreas_quantity_after_order`
AFTER INSERT ON orders
FOR EACH ROW

BEGIN
    UPDATE items
    SET quantity = quantity - NEW.number
    WHERE name = NEW.item_name;
END #

DELIMITER ;
