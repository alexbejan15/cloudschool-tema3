-- Add 5 customers
INSERT INTO `tema3`.`customers` 
(`username`,`last_name`,`first_name`,`phone`,`address`,`city`,`postal_code`,`country`)
VALUES
("alexbejan15", "Bejan", "Alexandru", "0721099288", "Strazii", "Galati", "123456", "Romania"),
("mrpopescu", "Popescu", "Andrei", "0754152624", "Soarelui", "Bucuresti", "451684", "Romania"),
("ionescui", "Ionescu", "Ion", "0751386956", "Succesului", "Cluj-Napoca", "445132", "Romania"),
("vali123", "Radulescu", "Valentin", "0744152632", "Ploii", "Brasov", "111222", "Romania"),
("JonJon", "Snow", "Jon", "4564812601", "Watchers", "London", "445645", "UK");

-- Add 10 products
INSERT INTO `tema3`.`products` 
(`code`,`name`,`description`,`stock`,`price`)
VALUES
("01", "Phone", "Iphone 13 Pro 512Gb", "100", "6000"),
("02", "TV", "Samsung Smart TV", "10", "6000"),
("03", "Fridge", "Arctic Super Fridge", "25", "6000"),
("04", "Camera", "Canon DSLR 100D", "4", "6000"),
("05", "Console", "Playstation 5 512Gb", "45", "6000"),
("06", "Controller", "XBox One Controller", "14", "6000"),
("07", "Bike", "Mountain Bike 13'", "100", "7"),
("08", "PC", "Alienware Aurora R", "100", "60"),
("09", "Laptop", "MacBook Pro 16'", "100", "120"),
("10", "Monitor", "BenQ GW2470", "100", "68");

-- Add 5 orders
INSERT INTO `tema3`.`orders` 
(`order_date`, `status`, `customer_id`)
VALUES
("2022-01-01", "Processed", "1"),
("2022-02-14", "In deposit", "2"),
("2022-07-30", "Delivering", "3"),
("2022-02-12", "Delivering", "1"),
("2022-05-15", "In deposit", "1");

-- Add 3 payments
INSERT INTO `tema3`.`payments` 
(`customer_id`, `payment_date`, `amount`)
VALUES
("1", "2022-01-01", "10000"),
("2", "2022-02-12", "2000"),
("3", "2022-05-15", "3000");

-- Update the status of one order
UPDATE orders
SET status = "Shipped",
shipped_date = "2022-05-20"
WHERE id = "5";

-- Add comments to one order
UPDATE orders
SET comments = "Order delivered without problems."
WHERE id = "5";

-- View all customers
SELECT * FROM customers;

-- View all orders for the third customer
SELECT * FROM orders
WHERE customer_id = "3";

-- When placing an order update the stock for the products
INSERT INTO `tema3`.`orderdetails` 
(`order_id`, `product_code`, `quantity`, `priceEach`)
VALUES
("1", "01", "2", "6000");

UPDATE products
SET stock = stock - (SELECT quantity FROM orderdetails WHERE order_id = "1")
WHERE code = "01";
