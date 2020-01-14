DROP DATABASE IF EXISTS db1;
create database db1;
use db1;
create table Customer(
   C_Id INT NOT NULL,
   C_Name VARCHAR(100),
   Credit_Limit INT,
   Income_Level CHAR(1),
   Gender CHAR(1),
   PRIMARY KEY ( C_Id )
);

INSERT INTO Customer(C_Id,C_Name,Credit_Limit,Income_Level,Gender) VALUES(1, 'Jamas'   , 1000, 'L', 'F');
INSERT INTO Customer(C_Id,C_Name,Credit_Limit,Income_Level,Gender) VALUES(2, 'Christan', 2000, 'M', 'M');
INSERT INTO Customer(C_Id,C_Name,Credit_Limit,Income_Level,Gender) VALUES(3, 'Saywer'  , 5000, 'H', 'F');
INSERT INTO Customer(C_Id,C_Name,Credit_Limit,Income_Level,Gender) VALUES(4, 'Kropy'   , 5000, 'H', 'M');
INSERT INTO Customer(C_Id,C_Name,Credit_Limit,Income_Level,Gender) VALUES(5, 'Lock'    , 2000, 'M', 'M');
INSERT INTO Customer(C_Id,C_Name,Credit_Limit,Income_Level,Gender) VALUES(6, 'Mando'   , 1000, 'L', 'F');

select 'Print out all data in table Customer' AS '';
SELECT * FROM Customer;


create table WareHouses(
   Warehouse_Id INT NOT NULL ,
   Location VARCHAR(100),
   PRIMARY KEY (Warehouse_Id)
);

INSERT INTO WareHouses(Warehouse_Id,Location) VALUES(1, 'Los Angles');
INSERT INTO WareHouses(Warehouse_Id,Location) VALUES(2, 'Chicago'   );
INSERT INTO WareHouses(Warehouse_Id,Location) VALUES(3, 'New York'  );

select 'Print out all data in table WareHouses' AS '';
SELECT * FROM WareHouses;


create table Inventories(
   Product_Id INT NOT NULL,
   Warehouse_Id INT NOT NULL,
   Quantity_On_Hand INT,
   FOREIGN KEY ( Warehouse_Id ) REFERENCES WareHouses(Warehouse_Id),
   PRIMARY KEY ( Product_Id )
);

INSERT INTO Inventories(Product_Id, Warehouse_Id, Quantity_On_Hand) VALUES(1, 1, 14);
INSERT INTO Inventories(Product_Id, Warehouse_Id, Quantity_On_Hand) VALUES(2, 1, 25);
INSERT INTO Inventories(Product_Id, Warehouse_Id, Quantity_On_Hand) VALUES(3, 3,  9);
INSERT INTO Inventories(Product_Id, Warehouse_Id, Quantity_On_Hand) VALUES(4, 2, 67);
INSERT INTO Inventories(Product_Id, Warehouse_Id, Quantity_On_Hand) VALUES(5, 2, 50);
INSERT INTO Inventories(Product_Id, Warehouse_Id, Quantity_On_Hand) VALUES(6, 1,  9);
INSERT INTO Inventories(Product_Id, Warehouse_Id, Quantity_On_Hand) VALUES(7, 3, 90);
INSERT INTO Inventories(Product_Id, Warehouse_Id, Quantity_On_Hand) VALUES(8, 3, 20);
INSERT INTO Inventories(Product_Id, Warehouse_Id, Quantity_On_Hand) VALUES(9, 3, 35);

select 'Print out all data in table Inventories' AS '';
SELECT * FROM Inventories;


create table Orders(
   Order_Id INT NOT NULL ,
   Order_Data DATE,
   C_Id INT NOT NULL,
   Order_Status VARCHAR(100),
   FOREIGN KEY ( C_Id ) REFERENCES Customer(C_Id),
   PRIMARY KEY ( Order_Id )
);

INSERT INTO Orders(Order_Id, Order_Data, C_Id, Order_Status) VALUES(1, '2019-09-01', 1, 'Processing');
INSERT INTO Orders(Order_Id, Order_Data, C_Id, Order_Status) VALUES(2, '2019-08-27', 2, 'Complete'  );
INSERT INTO Orders(Order_Id, Order_Data, C_Id, Order_Status) VALUES(3, '2019-06-20', 3, 'Complete'  );
INSERT INTO Orders(Order_Id, Order_Data, C_Id, Order_Status) VALUES(4, '2019-08-01', 4, 'Complete'  );
INSERT INTO Orders(Order_Id, Order_Data, C_Id, Order_Status) VALUES(5, '2019-08-31', 1, 'Processing');
INSERT INTO Orders(Order_Id, Order_Data, C_Id, Order_Status) VALUES(6, '2019-09-01', 4, 'Processing');
INSERT INTO Orders(Order_Id, Order_Data, C_Id, Order_Status) VALUES(7, '2019-08-20', 6, 'Complete'  );
INSERT INTO Orders(Order_Id, Order_Data, C_Id, Order_Status) VALUES(8, '2019-08-11', 2, 'Complete'  );

select 'Print out all data in table Orders' AS '';
SELECT * FROM Orders;


create table OrderItems(
   Order_Id INT,
   Product_Id INT,
   Unit_Price INT,
   Quantity INT
);

INSERT INTO OrderItems(Order_Id, Product_Id, Unit_Price, Quantity) VALUES(1, 1,  80,  1);
INSERT INTO OrderItems(Order_Id, Product_Id, Unit_Price, Quantity) VALUES(1, 2,  90,  1);
INSERT INTO OrderItems(Order_Id, Product_Id, Unit_Price, Quantity) VALUES(2, 1,  70,  1);
INSERT INTO OrderItems(Order_Id, Product_Id, Unit_Price, Quantity) VALUES(3, 4,  20,  2);
INSERT INTO OrderItems(Order_Id, Product_Id, Unit_Price, Quantity) VALUES(3, 2, 100,  3);
INSERT INTO OrderItems(Order_Id, Product_Id, Unit_Price, Quantity) VALUES(3, 8, 160,  1);
INSERT INTO OrderItems(Order_Id, Product_Id, Unit_Price, Quantity) VALUES(4, 4,  20, 12);
INSERT INTO OrderItems(Order_Id, Product_Id, Unit_Price, Quantity) VALUES(5, 2, 100,  2);
INSERT INTO OrderItems(Order_Id, Product_Id, Unit_Price, Quantity) VALUES(5, 8, 250,  1);
INSERT INTO OrderItems(Order_Id, Product_Id, Unit_Price, Quantity) VALUES(6, 9, 160, 10);
INSERT INTO OrderItems(Order_Id, Product_Id, Unit_Price, Quantity) VALUES(7, 5, 100,  3);
INSERT INTO OrderItems(Order_Id, Product_Id, Unit_Price, Quantity) VALUES(7, 7, 250,  1);
INSERT INTO OrderItems(Order_Id, Product_Id, Unit_Price, Quantity) VALUES(8, 4,  35,  2);

select 'Print out all data in table OrderItems' AS '';
SELECT * FROM OrderItems;


create table ProductInformation(
   Product_Id INT,
   Warranty_Period INT,
   Purchased_Price INT,
   PRIMARY KEY ( Product_Id )
);

INSERT INTO ProductInformation(Product_Id, Warranty_Period, Purchased_Price) VALUES(1,  90,  60);
INSERT INTO ProductInformation(Product_Id, Warranty_Period, Purchased_Price) VALUES(2, 120,  80);
INSERT INTO ProductInformation(Product_Id, Warranty_Period, Purchased_Price) VALUES(3, 365, 100);
INSERT INTO ProductInformation(Product_Id, Warranty_Period, Purchased_Price) VALUES(4,  30,  15);
INSERT INTO ProductInformation(Product_Id, Warranty_Period, Purchased_Price) VALUES(5, 365,  70);
INSERT INTO ProductInformation(Product_Id, Warranty_Period, Purchased_Price) VALUES(6,  90, 300);
INSERT INTO ProductInformation(Product_Id, Warranty_Period, Purchased_Price) VALUES(7,  60, 200);
INSERT INTO ProductInformation(Product_Id, Warranty_Period, Purchased_Price) VALUES(8,  90, 150);
INSERT INTO ProductInformation(Product_Id, Warranty_Period, Purchased_Price) VALUES(9, 120, 100);

select 'Print out all data in table ProductInformation' AS '';
SELECT * FROM ProductInformation;



/* Part 2 */
/* 1)  Return the names of customers whose income level are marked as Median(M), and return the average credit limit for these customers.*/
SELECT C_Name FROM Customer WHERE Income_Level = 'M';
SELECT AVG(Credit_Limit) FROM Customer WHERE Income_Level = 'M';


/*2)  Return the name of the customer who has placed more orders than other customers; return the name of the customer who has bought more items than any other customer. (Include all processing and complete orders)*/
SELECT C_Name, COUNT(*) AS OrderNum
FROM Customer, Orders
WHERE Customer.C_Id= Orders.C_id
GROUP BY Customer.C_Id
ORDER BY OrderNum DESC
LIMIT 1;

SELECT C_Name,  SUM(Quantity) AS ProductNum
FROM Customer, Orders, OrderItems 
WHERE Customer.C_Id= Orders.C_id AND Orders.Order_Id = OrderItems.Order_Id 
GROUP BY Customer.C_Id
ORDER BY ProductNum DESC
LIMIT 1;


/*3)  Return the Location of the warehouse, which now has the largest number of products in stock.*/
SELECT Location, SUM(Quantity_On_Hand) AS ProductNum
FROM WareHouses, Inventories
WHERE WareHouses.Warehouse_Id = Inventories.Warehouse_Id 
GROUP BY Inventories.Warehouse_Id 
ORDER by ProductNum DESC
LIMIT 1;


/*4)  Return the name of the female customer, who has ever placed an order (orders) containing at least 3 items.*/
SELECT C_Name,  COUNT(*) AS ProductNum
FROM Customer, Orders, OrderItems 
WHERE Customer.gender ='F' AND Customer.C_Id= Orders.C_id AND Orders.Order_Id = OrderItems.Order_Id 
GROUP BY Customer.C_Id
HAVING ProductNum >=3 ;


/*5)  Return the sale revenue of all complete orders; return the profit for all complete orders. ** sale revenue is defined as the amount of the price of all sold items; profit is defined as the sale revenue minus the amount of purchasing_price of all sold items.*/
SELECT SUM(Unit_Price*Quantity)
FROM Orders, OrderItems
WHERE Orders.Order_Id = OrderItems.Order_Id AND Orders.Order_Status='Complete'; 

SELECT SUM((Unit_Price-Purchased_Price)*Quantity)
FROM Orders, OrderItems, ProductInformation
WHERE Orders.Order_Id = OrderItems.Order_Id AND Orders.Order_Status='Complete' AND OrderItems.Product_Id=ProductInformation.Product_Id; 


/*6)  Return the name of the customer who has ever placed orders valued more than half of its credit limit.*/
SELECT C_Name,Credit_Limit AS credit, SUM(Product_Id*Unit_Price) AS sum
FROM Customer C, Orders o, OrderItems oi
WHERE c.C_Id = o.C_Id AND o.Order_Id = oi.Order_Id
GROUP BY c.C_id
HAVING SUM > Credit_Limit/2;



/*7)  List the <order_id, c_id, order_data, warranty_period> for all the sold products in completed orders, whose warranties are already expired.*/
SELECT Orders.Order_Id, C_Id, Order_Data, Warranty_Period
FROM Orders, OrderItems, ProductInformation
WHERE Orders.Order_Id = OrderItems.Order_Id AND Orders.Order_Status='Complete' AND OrderItems.Product_Id = ProductInformation.Product_Id AND  
	DATEDIFF(CURDATE(), Order_Data) > Warranty_Period ;



/*8)  Return the name of the customers, who have placed at least 2 orders in August, 2019. (Including all processing and completed orders)*/
SELECT C_Name, COUNT(Orders.Order_Id) AS OrderNum
from Customer, Orders
WHERE Customer.C_Id=Orders.C_Id AND Order_Data >='2019-08-01' AND Order_Data <='2019-08-31' 
GROUP BY Customer.C_Id
HAVING OrderNum>=2;



/*9)  List the names of the customers, who have placed at least one order including items from at least 2 different warehouses.*/
SELECT C_Name, COUNT(DISTINCT Warehouse_Id) AS wNum
FROM Customer, Orders, OrderItems, Inventories
WHERE Customer.C_Id=Orders.C_Id AND Orders.Order_Id = OrderItems.Order_Id AND OrderItems.Product_Id = Inventories.Product_Id 
GROUP BY Orders.Order_Id
HAVING wNum >=2; 


/*10)  Return the name of the customers whose orders never have any item in the warehouse located at “New York”.*/
SELECT C_Name 
FROM Customer c1
WHERE NOT EXISTS (SELECT OrderItems.Product_Id 
	         FROM  Orders, OrderItems, Inventories
		 WHERE c1.C_Id = Orders.C_Id AND Orders.Order_Id = OrderItems.Order_Id AND OrderItems.Product_Id = Inventories.Product_Id 
		 AND  OrderItems.Product_Id  IN 
		 ( SELECT Product_Id  FROM  Inventories I , WareHouses W WHERE I.Warehouse_Id = W.Warehouse_Id AND W.Location="New York") ); 



/*11)  Which item has the largest sale quantity for the customers of each income level?*/
CREATE TABLE tempProducts AS
SELECT Customer.Income_Level AS Income_Level , OrderItems.Product_Id AS Product_Id, SUM(OrderItems.Quantity) AS Quantity
FROM  OrderItems, Orders, Customer
WHERE OrderItems.Order_Id=Orders.Order_Id AND Orders.C_Id = Customer.C_Id
GROUP BY Customer.Income_Level, OrderItems.Product_Id;

SELECT Income_Level, MAX(Quantity)
FROM tempProducts
GROUP BY Income_Level;

DROP TABLE tempProducts;


/*12)  Which item does the largest number of customers buy? Return the name of the item.*/
CREATE TABLE temp AS
SELECT Product_Id, COUNT(DISTINCT C_Id) AS customerNum
FROM Orders, OrderItems
WHERE Orders.Order_Id = OrderItems.Order_Id
GROUP BY Product_Id;

SELECT Product_Id
FROM temp
WHERE customerNum = (SELECT MAX(customerNum) FROM temp);

DROP TABLE temp;


/* Part 3 */
/*Do the following updates using SQL :*/

/*1)  Decrease the credit limit of all female customers by 50%.*/
UPDATE Customer
SET Credit_Limit = Credit_Limit/2
WHERE Gender ='F'; 


/*2)  Now if there exists any “processing” order that exceed the customer’s credit limit, delete such orders.*/
CREATE TABLE temp AS
SELECT Orders.Order_Id, Customer.Credit_Limit, SUM(Product_Id*Unit_Price) AS orderSum
FROM Orders, Customer, OrderItems
WHERE Orders.C_Id = Customer.C_Id AND Orders.Order_Id=OrderItems.Order_Id
GROUP BY Orders.C_Id
HAVING orderSum > Customer.Credit_Limit ;

SELECT * FROM temp;

SELECT * FROM Orders;
DELETE 
FROM Orders 
WHERE Order_Id IN ( SELECT Order_Id FROM temp);

DROP TABLE temp;


/*3)  Change the status of all “processing” orders to “Complete”, update the inventories table.*/
UPDATE Inventories, Orders, OrderItems
SET Quantity_On_Hand = Quantity_On_Hand - Quantity
WHERE Inventories.Product_Id = OrderItems.Product_Id AND Orders.Order_Id = OrderItems.Order_Id AND Orders.Order_Status = 'Processing'; 

UPDATE Orders
SET Order_Status = 'Complete'
WHERE Order_Status = 'Processing';


/*4)  We decide not selling product with product_id = 3 anymore, please delete all the related information of this product in all these tables.*/
DELETE
FROM Inventories
WHERE Product_Id = 3;

DELETE
FROM ProductInformation
WHERE Product_Id = 3;

DELETE
FROM OrderItems
WHERE Product_Id = 3;



/*5)  Increase the warranty period by 30days for all the products stored in warehouse “Chicago”.*/
UPDATE ProductInformation, WareHouses, Inventories
SET Warranty_Period = Warranty_Period +30
WHERE Inventories.Product_Id = ProductInformation.Product_Id AND Inventories.Warehouse_Id = WareHouses.Warehouse_Id AND WareHouses.Location = 'Chicago'; 


SELECT * FROM Customer;
SELECT * FROM Orders;
SELECT * FROM OrderItems;
SELECT * FROM Inventories;
SELECT * FROM ProductInformation;
SELECT * FROM WareHouses;

DROP TABLE Customer; 
DROP TABLE Orders;
DROP TABLE OrderItems;
DROP TABLE Inventories;
DROP TABLE ProductInformation;
DROP TABLE WareHouses;

