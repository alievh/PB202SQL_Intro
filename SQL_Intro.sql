--CREATE DATABASE ECommerce
--USE ECommerce

--CREATE TABLE Products(
--	Id INT PRIMARY KEY IDENTITY,
--	[Name] NVARCHAR(255) UNIQUE,
--	Price DECIMAL(18,2) CHECK (Price > 0),
--	StockQuantity INT CHECK (StockQuantity >= 0)
--)

--CREATE TABLE Orders(
--	Id INT PRIMARY KEY IDENTITY,
--	CustomerName NVARCHAR(255) CHECK(LEN(CustomerName) >= 3),
--	OrderDate DATE CHECK(YEAR(OrderDate) >= YEAR(GETDATE()) AND MONTH(OrderDate) >= MONTH(GETDATE()))
--)

--CREATE TABLE OrderDetails(
--	Id INT PRIMARY KEY IDENTITY,
--	ProductId INT FOREIGN KEY REFERENCES Products(Id),
--	OrderId INT FOREIGN KEY REFERENCES Orders(Id),
--	Quantity INT CHECK(Quantity > 0)
--)

--INSERT INTO Products VALUES
--('Laptop', 1500, 50),
--('Phone', 800, 100),
--('Headphones', 50, 200)

--SELECT * FROM Products

--INSERT INTO Orders VALUES
--('Ali', '2024-11-01'),
--('Meryem', '2024-11-03')

--INSERT INTO OrderDetails VALUES
--(1,1,2),
--(3,1,5),
--(2,2,1),
--(3,2,10)

--SELECT p.Id, p.[Name], p.Price, (p.Price * od.Quantity) AS TotalPrice FROM Products p
--JOIN OrderDetails od ON p.Id = od.ProductId

--UPDATE Products
--SET StockQuantity = StockQuantity - od.Quantity
--FROM Products p
--JOIN OrderDetails od ON p.Id = od.ProductId


--SELECT * FROM Products p
--JOIN OrderDetails od ON p.Id = od.ProductId
--WHERE p.StockQuantity < od.Quantity

CREATE DATABASE CodeCompany
USE CodeCompany

CREATE TABLE Employees(
	Id INT PRIMARY KEY IDENTITY,
	[Name] NVARCHAR(255) NOT NULL,
	Position NVARCHAR(255) UNIQUE,
	Salary DECIMAL(18,2) CHECK(Salary >= 800)
)

CREATE TABLE Projects(
	Id INT PRIMARY KEY IDENTITY,
	[Name] NVARCHAR(255) NOT NULL CHECK(LEN([Name]) > 5),
	Deadline DATE CHECK(Deadline > GETDATE())
)

CREATE TABLE EmployeeProjects(
	Id INT PRIMARY KEY IDENTITY,
	EmployeeId INT FOREIGN KEY REFERENCES Employees(Id),
	ProjectId INT FOREIGN KEY REFERENCES Projects(Id),
	HoursWorked INT CHECK (HoursWorked >= 40)
)

INSERT INTO Employees VALUES
('John Smith', 'Manager', 3000),
('Jane Doe', 'Developer', 2500),
('Sarah Lee', 'Designer', 2200)

INSERT INTO Projects VALUES
('Website Redesign','2024-12-01'),
('Mobile App','2024-11-30')

INSERT INTO EmployeeProjects VALUES
(1,1,100),
(2,2,150),
(3,1,80)

SELECT e.[Name], p.[Name], ep.HoursWorked FROM Employees e
JOIN EmployeeProjects ep ON e.Id = ep.EmployeeId
JOIN Projects p ON ep.ProjectId = p.Id


SELECT p.[Name], AVG(ep.HoursWorked) FROM Projects p
JOIN EmployeeProjects ep ON ep.ProjectId = p.Id
GROUP BY p.[Name]

SELECT TOP 1 e.[Name], ep.HoursWorked FROM Employees e
JOIN EmployeeProjects ep ON e.Id = ep.EmployeeId
ORDER BY ep.HoursWorked DESC