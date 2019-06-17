CREATE TABLE Orders(OrderId int not null primary key,
                   OrderName nvarchar(50) not null,
				   OrderCity nvarchar(50))
Create table Customers(CustomerId int not null,
                       CustomerName nvarchar(50) not null,
					   OrderId int foreign key references Orders(OrderId))
INSERT Into Orders values(1,'shoe','mum')
INSERT Into Orders values(2,'dress','hyd')
INSERT Into Orders values(3,'ring','ong')
INSERT Into Orders values(4,'chain','ban')
select * from Orders
INSERT Into Customers values(602,'gayu',1)
INSERT Into Customers values(701,'nag',2)
INSERT Into Customers values(325,'med',3)
INSERT Into Customers values(445,'sujji',4)
select * from Customers

--Joins
select Customers.CustomerName,Customers.CustomerId,Orders.OrderName,Orders.OrderCity FROM Orders
full Join Customers on Customers.OrderId=Orders.OrderId      
                                                              
															  
select Customers.CustomerName,Orders.OrderCity FROM Orders
Inner Join Customers on Customers.OrderId=Orders.OrderId  	

select Customers.CustomerName,Customers.CustomerId,Orders.OrderCity FROM Orders
Left Join Customers on Customers.OrderId=Orders.OrderId  	

select Customers.CustomerName,Orders.OrderCity,Orders.OrderName FROM Orders
Right Join Customers on Customers.OrderId=Orders.OrderId  

CREATE PROCEDURE StoredProcedure3
        @OrderId int ,
        @OrderName nvarchar(50) ,
	     @OrderCity nvarchar(50)
		 as
		 begin
		 Insert Into Orders VALUES(@OrderId,@OrderName,@OrderCity)
		 End
		 go
EXEC StoredProcedure3 @OrderId=5,@OrderCity='GUN',@OrderName='DIAMOND';

--Views

CREATE VIEW Customer--new view name
 AS
SELECT CustomerName,CustomerId,OrderId
FROM Customers
WHERE OrderId = 1;

select * from Customer

--Index

CREATE UNIQUE INDEX OrderIndex
ON Orders (OrderId, OrderName,OrderCity);
--Clustered Index
--which we take as primary key in table that automatically creates the cluster index
EXECUTE sp_helpindex Orders--it will show indexs for every column in that table

CREATE CLUSTERED INDEX clustername
ON table_name(column_name ASC)--example

--NonClustered
CREATE NONCLUSTERED INDEX IX_tblStudent_Name
ON Orders(OrderName ASC)

												                                                                                                                                                                       