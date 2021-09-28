USE master
GO

IF EXISTS (SELECT NAME FROM SYS.sysdatabases WHERE NAME='eMedicineShopDB')
DROP DATABASE eMedicineShopDB
GO

CREATE DATABASE eMedicineShopDB
GO

USE eMedicineShopDB
GO




CREATE TABLE Categories
(
	CategoryId INT  PRIMARY KEY IDENTITY(1,1) NOT NULL,
	CategoryName NVARCHAR(30) NOT NULL
)
GO


CREATE TABLE Customers
(
	CustomerId INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	UserId NVARCHAR(120) NOT NULL,
	CustomerName NVARCHAR(60) NOT NULL,
	Address NVARCHAR(100) NULL,
	CreditCardNumber NVARCHAR(20) NULL,
	CreditCardExpireDate DATE NULL
)
GO

CREATE TABLE Medicines
(
	MedicineId INT PRIMARY KEY IDENTITY(51,1) NOT NULL,
	MedicineName NVARCHAR(50) NOT NULL,
	UnitDescription NVARCHAR(40) NOT NULL,
	GenericGroup NVARCHAR(50) NOT NULL,
	BrandName NVARCHAR(50) NOT NULL,
	MedicineType NVARCHAR(50) NOT NULL,
	UnitPrice MONEY NOT NULL,
	PackSize INT NOT NULL,
	PictureFile NVARCHAR(150) NULL,
	CategoryId INT NOT NULL REFERENCES Categories(CategoryId) ON DELETE CASCADE
) 
GO

CREATE TABLE Stocks
(
	StockID	INT PRIMARY KEY IDENTITY(50001,1),
	MedicineId INT REFERENCES Medicines(MedicineId) ON DELETE CASCADE,
	Quantity INT CHECK(quantity>0),
	QuantityUnit NVARCHAR(20)
)
GO

CREATE PROC sp_InsertMedicineWithStock
							@MedicineName NVARCHAR(50),
							@UnitDescription NVARCHAR(40),
							@GenericGroup NVARCHAR(50),
							@BrandName NVARCHAR(50),
							@MedicineType NVARCHAR(50),
							@UnitPrice MONEY,
							@PackSize INT,
							@PictureFile NVARCHAR(150),
							@CategoryId INT,
							@InitialStock INT,
							@QuantityUnit NVARCHAR(20)
							

AS
BEGIN
	INSERT INTO Medicines VALUES
		(@MedicineName,@UnitDescription,@GenericGroup,@BrandName,@MedicineType,@UnitPrice,@PackSize,@PictureFile,@CategoryId)
	DECLARE @ID INT;
	SET @ID=@@IDENTITY
	INSERT INTO Stocks VALUES(@@IDENTITY,@InitialStock,@QuantityUnit)
END
GO
 --EXEC sp_InsertMedicineWithStock @MedicineName,@UnitDescription,@GenericGroup,@BrandName,@MedicineType,@UnitPrice,@PackSize,@PictureFile,@CategoryId,@InitialStock,@QuantityUnit

 
select * from Medicines
select * from Stocks

CREATE TABLE Orders
(
	OrderId INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	OrderDate DATETIME NOT NULL,
	ShippingDate DATE NULL,
	CustomerId INT NOT NULL REFERENCES Customers(CustomerId) ON DELETE CASCADE
) 
GO

CREATE TABLE OrderItems
(
	OrderId INT  NOT NULL REFERENCES Orders(OrderId),
	MedicineId INT NOT NULL REFERENCES Medicines(MedicineId),
	Quantity INT NOT NULL
	PRIMARY KEY (OrderId, MedicineId)
) 
GO

CREATE TABLE CartItems
(
	CartItemId INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	MedicineId INT NOT NULL REFERENCES Medicines(MedicineId),
	CustomerId INT NOT NULL REFERENCES Customers(CustomerId),
	Quantity INT NOT NULL
) 
GO

INSERT INTO Categories (CategoryName) VALUES (N'COVID 19')	--CategoryId= 1
INSERT INTO Categories (CategoryName) VALUES (N'Diabetes Care')	--CategoryId= 2
INSERT INTO Categories (CategoryName) VALUES (N'Health Care')	--CategoryId= 3
INSERT INTO Categories (CategoryName) VALUES (N'Skin Care')	--CategoryId= 4
INSERT INTO Categories (CategoryName) VALUES (N'Hair Care')	--CategoryId= 5
INSERT INTO Categories (CategoryName) VALUES (N'Eye & Ear Care') --CategoryId= 6
INSERT INTO Categories (CategoryName) VALUES (N'Baby Care') --CategoryId= 7
INSERT INTO Categories (CategoryName) VALUES (N'Herbal') --CategoryId= 8
INSERT INTO Categories (CategoryName) VALUES (N'Health Care Accessories') --CategoryId= 9
INSERT INTO Categories (CategoryName) VALUES (N'Surgical Accessories') --CategoryId= 10
GO


INSERT INTO Medicines (MedicineName,UnitDescription,GenericGroup, BrandName, MedicineType, UnitPrice,PackSize,PictureFile,CategoryId) VALUES (N'Ivera',' 6 mg',N'Ivermectin BP',N'Beximco Pharmaceuticals Ltd.',N'Tablet', CAST(100.00 AS Decimal(18, 2)),10,N'Ivera-Tablet.jpg', 1)
INSERT INTO Medicines (MedicineName,UnitDescription,GenericGroup, BrandName, MedicineType, UnitPrice,PackSize,PictureFile,CategoryId) VALUES (N'Ivera',' 12 mg',N'Ivermectin BP',N'Beximco Pharmaceuticals Ltd.',N'Tablet', CAST(200.00 AS Decimal(18, 2)),10,N'Ivera-Tablet.jpg', 1)
INSERT INTO Medicines (MedicineName,UnitDescription,GenericGroup, BrandName, MedicineType, UnitPrice,PackSize,PictureFile,CategoryId) VALUES (N'Bemsivir',' 5 mg',N'Remdesivir',N'Beximco Pharmaceuticals Ltd.',N'Injection', CAST(5500.00 AS Decimal(18, 2)),1,N'Bemsivir_5mg.jpg', 1)
INSERT INTO Medicines (MedicineName,UnitDescription,GenericGroup, BrandName, MedicineType, UnitPrice,PackSize,PictureFile,CategoryId) VALUES (N'KN95 Mask',' 4 Layer',N'Mask',N'Delta Pharmaceuticals Ltd.',N'KN95 Mask', CAST(250.00 AS Decimal(18, 2)),1,N'KN95_Mask.jpeg', 1)
INSERT INTO Medicines (MedicineName,UnitDescription,GenericGroup, BrandName, MedicineType, UnitPrice,PackSize,PictureFile,CategoryId) VALUES (N'Jardimet',' 5 mg+500 mg ',N'Glipizide',N'Beximco Pharmaceuticals Ltd.',N'Tablet', CAST(200.00 AS Decimal(18, 2)),10,N'jardimet.jpg', 2)
INSERT INTO Medicines (MedicineName,UnitDescription,GenericGroup, BrandName, MedicineType, UnitPrice,PackSize,PictureFile,CategoryId) VALUES (N'Diactin',' 5 mg',N'Glipizide',N'Beximco Pharmaceuticals Ltd.',N'Tablet', CAST(20.00 AS Decimal(18, 2)),10,N'Diactin.jpg', 2)
INSERT INTO Medicines (MedicineName,UnitDescription,GenericGroup, BrandName, MedicineType, UnitPrice,PackSize,PictureFile,CategoryId) VALUES (N'Siglimet XR','10 mg',N'Sitagliptin + Metformin Hydrochloride',N'Square Pharmaceuticals Ltd.',N'Tablet', CAST(18.00 AS Decimal(18, 2)),1,N'Siglimet-50+500-30s_l.jpg', 2)

INSERT INTO Medicines (MedicineName,UnitDescription,GenericGroup, BrandName, MedicineType, UnitPrice,PackSize,PictureFile,CategoryId) VALUES (N'Atrizin',' 10 mg',N'Cetirizine Hydrochloride',N'Beximco Pharmaceuticals Ltd.',N'Tablet', CAST(50.00 AS Decimal(18, 2)),10,N'Atrizin.jpg', 3)
INSERT INTO Medicines (MedicineName,UnitDescription,GenericGroup, BrandName, MedicineType, UnitPrice,PackSize,PictureFile,CategoryId) VALUES (N'Alatrol',' 5 mg/5 ml',N'Cetirizine Hydrochloride',N'Square Pharmaceuticals Ltd.',N'Syrup', CAST(30.00 AS Decimal(18, 2)),1,N'Alatrol-Syrup-PRO_l.jpg', 3)
INSERT INTO Medicines (MedicineName,UnitDescription,GenericGroup, BrandName, MedicineType, UnitPrice,PackSize,PictureFile,CategoryId) VALUES (N'Pedeamin',' 10 mg/5 ml',N'Diphenhydramine Hydrochloride',N'Beximco Pharmaceuticals Ltd.',N'Syrup', CAST(50.00 AS Decimal(18, 2)),1,N'Pedeamin.jpg', 3)
INSERT INTO Medicines (MedicineName,UnitDescription,GenericGroup, BrandName, MedicineType, UnitPrice,PackSize,PictureFile,CategoryId) VALUES (N'Alatrol',' 2.5 mg/ml',N'Cetirizine Hydrochloride',N'Square Pharmaceuticals Ltd.',N'Pediatric Drops', CAST(30.00 AS Decimal(18, 2)),1,N'Alatrol-PD-PRO_l.jpg', 3)
INSERT INTO Medicines (MedicineName,UnitDescription,GenericGroup, BrandName, MedicineType, UnitPrice,PackSize,PictureFile,CategoryId) VALUES (N'Flexi®',' 200 mg',N'Aceclofenac',N'Square Pharmaceuticals Ltd.',N'Tablet (Sustained Release)', CAST(72.00 AS Decimal(18, 2)),10,N'Flexi-SR_l.jpg', 3)

INSERT INTO Medicines (MedicineName,UnitDescription,GenericGroup, BrandName, MedicineType, UnitPrice,PackSize,PictureFile,CategoryId) VALUES (N'Gentosep',' 0.3%',N'Gentamicin Sulfate',N'Beximco Pharmaceuticals Ltd.',N'Cream', CAST(50.00 AS Decimal(18, 2)),1,N'Gentocep.jpg', 4)
INSERT INTO Medicines (MedicineName,UnitDescription,GenericGroup, BrandName, MedicineType, UnitPrice,PackSize,PictureFile,CategoryId) VALUES (N'Genacyn®',' 0.1% 10g',N'Gentamicin Sulfate',N'Square Pharmaceuticals Ltd.',N'Ointment', CAST(30.00 AS Decimal(18, 2)),1,N'Alatrol-Syrup-PRO_l.jpg', 4)
INSERT INTO Medicines (MedicineName,UnitDescription,GenericGroup, BrandName, MedicineType, UnitPrice,PackSize,PictureFile,CategoryId) VALUES (N'Gentin®',' 80 mg/2 ml',N'Gentamicin Sulfate',N'Opsonin Pharma Ltd.',N'Injection', CAST(350.00 AS Decimal(18, 2)),1,N'Gentin_Injection_1512544395.png', 4)
INSERT INTO Medicines (MedicineName,UnitDescription,GenericGroup, BrandName, MedicineType, UnitPrice,PackSize,PictureFile,CategoryId) VALUES (N'Q-Rash',' 40% 25 gm',N'Zinc Oxide',N'Beximco Pharmaceuticals Ltd.',N'POintment', CAST(50.00 AS Decimal(18, 2)),1,N'Q-Rash.jpg', 4)
INSERT INTO Medicines (MedicineName,UnitDescription,GenericGroup, BrandName, MedicineType, UnitPrice,PackSize,PictureFile,CategoryId) VALUES (N'Dermex®',' 0.05% 10 gm Tube',N'Clobetasol Propionate',N'Opsonin Pharma Ltd.',N'Ointment', CAST(48.00 AS Decimal(18, 2)),1,N'Dermex_1512541281.png', 4)

INSERT INTO Medicines (MedicineName,UnitDescription,GenericGroup, BrandName, MedicineType, UnitPrice,PackSize,PictureFile,CategoryId) VALUES (N'Tibilon',' 2.5 mg',N'Tibolone',N'Beximco Pharmaceuticals Ltd.',N'Tablet', CAST(22.00 AS Decimal(18, 2)),1,N'Tibilon.jpg', 5)
INSERT INTO Medicines (MedicineName,UnitDescription,GenericGroup, BrandName, MedicineType, UnitPrice,PackSize,PictureFile,CategoryId) VALUES (N'Splendora™',' 5% 60 ml Bottle',N'Minoxidil',N'Square Pharmaceuticals Ltd.',N'Scalp Lotion', CAST(602.00 AS Decimal(18, 2)),1,N'SPlendora_large.png', 5)
INSERT INTO Medicines (MedicineName,UnitDescription,GenericGroup, BrandName, MedicineType, UnitPrice,PackSize,PictureFile,CategoryId) VALUES (N'Xenogrow',' 5% 60 ml Bottle',N'Minoxidil',N'Incepta Pharmaceuticals Ltd.',N'Scalp Lotion', CAST(650.00 AS Decimal(18, 2)),1,N'Xenogrow_5.jpg', 5)
INSERT INTO Medicines (MedicineName,UnitDescription,GenericGroup, BrandName, MedicineType, UnitPrice,PackSize,PictureFile,CategoryId) VALUES (N'Xenogrow',' 2% 60 ml Bottle',N'Minoxidil',N'Incepta Pharmaceuticals Ltd.',N'Scalp Lotion', CAST(500.00 AS Decimal(18, 2)),1,N'Xenogrow_2.jpg', 5)
INSERT INTO Medicines (MedicineName,UnitDescription,GenericGroup, BrandName, MedicineType, UnitPrice,PackSize,PictureFile,CategoryId) VALUES (N'Trugain',' 2% 60 ml Bottle',N'Minoxidil',N'Ziska Pharmaceuticals Ltd.',N'Scalp Lotion', CAST(400.00 AS Decimal(18, 2)),1,N'Trugain7.png', 5)
GO

EXEC sp_InsertMedicineWithStock 'Flexi','10mg','Acefenak','Sharif Medicine Corner','Capsule',10,100,'sharif.jpg',3,1000,'Pcs'
GO

SELECT c.CategoryName,COUNT(m.MedicineId) FROM Categories c inner join Medicines m on c.CategoryId=m.CategoryId group by CategoryName
GO

SELECT * FROM Customers 
GO

SELECT * FROM Orders 
GO
SELECT * FROM OrderItems 
GO