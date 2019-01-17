

1. SELECT * FROM Customers;

2. /* Some important commands:*/

	SELECT
	UPDATE
	DELETE 
	INSERT INTO 
	CREATE DATABASE ？
	ALTER DATABASE 
	CREATE TABLE
	ALTER TABLE
	DROP TABLE
	CREATE INDEX
	DROP INDEX

3. 	SELECT column1, column2, ... 
   	FROM table_name;


4. 	SELECT DISTINCT column1, column2,...
	FROM table_name;

5. 	SELECT COUNT(DISTINCT Country) 
	FROM Customers;

6. 	SELECT Count(*) AS DistinctCountries
	FROM (SELECT DISTINCT Country FROM Customers);

7. 	SELECT column1, column2, ...
	FROM table_name
	WHERE condition; 

	SELECT * FROM Customers
	WHERE Country='Mexico';

8.  Operator	Description
			=	Equal
			<>	Not equal. Note: In some versions of SQL this operator may be written as !=
			>	Greater than
			<	Less than
			>=	Greater than or equal
			<=	Less than or equal
			BETWEEN	Between a certain range
			LIKE	Search for a pattern
			IN	To specify multiple possible values for a column


9.  SELECT column1, column2
	FROM table_name
	WHERE condition1 AND condition2 AND condition3....;

	OR, 
	WHERE NOT condition

	SELECT * FROM Customers
	WHERE Country='Germany' AND City='Berlin';


10. SELECT column1,column2,
	FROM table_name
	ORDER BY column1, column2, ... ASC|DESC; 
	# 默认ASC 如果不特别备注


11. # insert values
	!!!!!!!!!!!
	INSERT INTO Customers (CustomerName, 
	ContactName, Address, City, PostalCode, Country)
	VALUES ('Cardinal', 'Tom B. Erichsen', 
		'Skagen 21', 'Stavanger', '4006', 'Norway');
    # which equals add one row at the botton of the table with the above values 
    # in each column. 

12. # The IS NOT NULL Operator

	SELECT CustomerName, ContactName, Address
	FROM Customers
	WHERE Address IS NOT NULL;

	SELECT CustomerName FROM Customers
	WHERE Address IS NULL;


13. UPDATE table_name
	SET column1 = value1, column2 = value2, ...
	WHERE condition;

	UPDATE Customers
	SET ContactName = 'Alfred Schmidt', City = 'Frankfurt'
	WHERE CustomerID = 1;

	# UPDATE Customers
	#SET ContactName='Juan'
	#WHERE Country='Mexico'

14. DELETE FROM Customers 
	WHERE CustomerName='Alfreds Futterkiste';
	!!! FROM very important!!!!


15. SELECT column_name(s)
	FROM table_name
	WHERE condition
	LIMIT number;

	!!!!!!
	!!!
	!!
	SELECT TOP 50 PERCENT * 
	FROM CustomerName;

16. SELECT MIN(column_name)
	FROM table_name
	WHERE condition; 

	MAX()

	SELECT MIN(Price) AS SmallestPrice
	FROM Products;


17. SELECT COUNT(column_name)
	FROM table_name
	WHERE condition;

	AVG() 
	SUM()
	SELECT (*)
	FROM Products
 	Price = 18;

18. LIKE Operator	Description
	WHERE CustomerName LIKE 'a%'	Finds any values that start with "a"
	WHERE CustomerName LIKE '%a'	Finds any values that end with "a"
	WHERE CustomerName LIKE '%or%'	Finds any values that have "or" in any position
	WHERE CustomerName LIKE '_r%'	Finds any values that have "r" in the second position
	WHERE CustomerName LIKE 'a_%_%'	Finds any values that start with "a" and are at least 3 characters in length
	WHERE ContactName LIKE 'a%o'	Finds any values that start with "a" and ends with "o"
 
	！！！！！！！！
	SELECT * FROM Customers
	WHERE City LIKE '[a-c]%';

	SELECT * FROM Customers
	WHERE City LIKE '[!bsp]%';


19. SELECT column_name(s)
	FROM table_name
	WHERE column_name IN (SELECT STATEMENT);
	#Use the IN operator to select all the records where Country is either "Norway" or "France".
	#SELECT * FROM Customers 'France';

20. SELECT column_name(s) 
	FROM table_name 
	WHERE column_name BETWEEN value1 AND value2
	ORDER BY ;


21. !!!!!
	SELECT column_name AS alias_name
	FROM table_name; 

	SELECT CustomerID AS ID, CustomerName AS Customer
	FROM Customers;

	SELECT CustomerName, Address + ', ' + PostalCode + ' ' + City + ', ' + Country AS Address
	

22. SQL JOINS !!!!!

	Here are the different types of the JOINs in SQL:

	(INNER) JOIN: Returns records that have matching values in both tables
	LEFT (OUTER) JOIN: Return all records from the left table, and the matched records from the right table
	RIGHT (OUTER) JOIN: Return all records from the right table, and the matched records from the left table
	FULL (OUTER) JOIN: Return all records when there is a match in either left or right table

	LEFT JOIN 就是左边的都在的
	right join 就是右边的都在的 OUTER

	full outer join 就是都存在所有的并集交际都放在一起

	SELECT *
	FROM Orders
	LEFT JOIN Customers
	ON orders.CustomerID = Customers.CustomerID;

!!!!!之后继续复习join

23. SELECT column_name(s)
	FROM table1
	INNER JOIN table2 
	ON table1.column_name = table2.column_name;


24. SELECT A.CustomerName AS CustomerName1, B.CustomerName AS CustomerName2, A.City
	FROM Customers A, Customers B
	WHERE A.CustomerID <> B.CustomerID
	AND A.City = B.City 
	ORDER BY A.City;


	！！！！ . 很重要 A. SS


25. SELECT column_name(s) FROM table1
	UNION
	SELECT column_name(s) FROM table2;

	UNION ALL  # all duplicates values.

	SELECT City, Country FROM Customers
	WHERE Country='Germany'
	UNION ALL
	SELECT City, Country FROM Suppliers
	WHERE Country='Germany'
	ORDER BY City;


	``` Number of Records: 14
	City	Country
	Aachen	Germany
	Berlin	Germany
	Berlin	Germany
	Brandenburg	Germany
	Cunewalde	Germany
	Cuxhaven	Germany
	Frankfurt	Germany
	Frankfurt a.M.	Germany
	```

26. # group by 

	SELECT column_name(s)
	FROM table_name
	WHERE condition
	GROUP BY column_name(s)
	ORDER BY column_name(s);

	SELECT Shippers.ShipperName, COUNT(Orders.OrderID) AS NumberOfOrders FROM Orders
	LEFT JOIN Shippers 	
	ON Orders.ShipperID = Shippers.ShipperID
	GROUP BY ShipperName;

	SELECT COUNT(CustomerID), Country
	FROM Customers
	GROUP BY Country
	HAVING COUNT(CustomerID) > 5
	ORDER BY COUNT(CustomerID) DESC;

27. SELECT column_name(s)
	FROM table_name
	WHERE condition
	GROUP BY column_name(s)
	HAVING condition
	ORDER BY column_name(s);

28. # count function 一定要用括号里给 范围

29. !!!!!
	SELECT column_name(s)
	FROM table_name
	WHERE EXISTS 
	(SELECT ProductName FROM ProductName FROM Products WHERE 
		SuppliersID = Suppliers.SuppliersID AND Price < 20)



30. !! ```The ANY and ALL operators are used with a WHERE or HAVING clause.

	The ANY operator returns true if any of the subquery values meet the condition.

	The ALL operator returns true if all of the subquery values meet the condition.

	```


	SELECT column_name(s)
	FROM table_name
	WHERE column_name operator ANY/ALL
	(SELECT column_name FROM table_name WHERE condition);
	# return 还是table 只是 会根据这个条件return table

31. The following SQL statement creates a backup copy of Customers:

	SELECT * INTO CustomersBackup2017
	FROM Customers;


32. !!!!
	INSERT INTO table2
	SELECT * FROM table1
	WHERE condition;


33. !!! # case 

	CASE
    	WHEN condition1 THEN result1
    	WHEN condition2 THEN result2
    	WHEN conditionN THEN resultN
    	ELSE result
	END;

	SELECT OrderID, Quantity,
	CASE
	    WHEN Quantity > 30 THEN "The quantity is greater than 30"
	    WHEN Quantity = 30 THEN "The quantity is 30"
	    ELSE "The quantity is under 30"
	END AS QuantityText
	FROM OrderDetails;

	!!!!!!!!
	SELECT CustomerName, City, Country
	FROM Customers
	ORDER BY
	(CASE
    	WHEN City IS NULL THEN Country
    	ELSE City
	END);

	SELECT CustomerName, City, Country 
	FROM Customers
	ORDER BY 
	(CASE 
		WHEN CITY IS NULL THEN Country
		ELSE CustomerName
	END);

34. 
	SELECT ProductName, UnitPrice * (UnitsInStock + IFNULL(UnitsOnOrder, 0))
	FROM Products

	SELECT ProductName, UnitPrice * (UnitsInStock + COALESCE(UnitsOnOrder, 0))
	FROM Products

	SELECT ProductName, UnitPrice * (UnitsInStock + ISNULL(UnitsOnOrder, 0))
	FROM Products


	```The following SQL statement creates a stored procedure that selects Customers from a particular City from the "Customers" table:
	CREATE PROCEDURE SelectAllCustomers @City nvarchar(30)			```
	AS
	SELECT * FROM Customers WHERE City = @City
	GO;




35. DATABASE

CREATE DATABASE 
DROP DATABASE










































