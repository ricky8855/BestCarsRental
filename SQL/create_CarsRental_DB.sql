USE [master]
GO
/****** Object:  Database [BestCarsRental]    Script Date: 14/04/2018 22:18:55 ******/
CREATE DATABASE [BestCarsRental]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BestCarsRental', FILENAME = N'C:\ricky\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\BestCarsRental.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BestCarsRental_log', FILENAME = N'C:\ricky\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\BestCarsRental_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BestCarsRental] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BestCarsRental].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BestCarsRental] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BestCarsRental] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BestCarsRental] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BestCarsRental] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BestCarsRental] SET ARITHABORT OFF 
GO
ALTER DATABASE [BestCarsRental] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [BestCarsRental] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BestCarsRental] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BestCarsRental] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BestCarsRental] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BestCarsRental] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BestCarsRental] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BestCarsRental] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BestCarsRental] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BestCarsRental] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BestCarsRental] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BestCarsRental] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BestCarsRental] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BestCarsRental] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BestCarsRental] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BestCarsRental] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BestCarsRental] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BestCarsRental] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BestCarsRental] SET  MULTI_USER 
GO
ALTER DATABASE [BestCarsRental] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BestCarsRental] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BestCarsRental] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BestCarsRental] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [BestCarsRental] SET DELAYED_DURABILITY = DISABLED 
GO
USE [BestCarsRental]
GO
/****** Object:  Table [dbo].[Branches]    Script Date: 14/04/2018 22:18:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Branches](
	[BranchID] [int] IDENTITY(1,1) NOT NULL,
	[Latitude] [decimal](10, 8) NOT NULL,
	[Longitude] [decimal](11, 8) NOT NULL,
	[BranchName] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Branches] PRIMARY KEY CLUSTERED 
(
	[BranchID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Cars]    Script Date: 14/04/2018 22:18:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cars](
	[CarID] [int] IDENTITY(1,1) NOT NULL,
	[CarTypeID] [int] NOT NULL,
	[Mileage] [int] NOT NULL,
	[Image] [nvarchar](50) NOT NULL,
	[BestCondition] [int] NOT NULL,
	[CarNumber] [nvarchar](12) NOT NULL,
	[BranchID] [int] NOT NULL,
 CONSTRAINT [PK_Cars] PRIMARY KEY CLUSTERED 
(
	[CarID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CarTypes]    Script Date: 14/04/2018 22:18:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarTypes](
	[CarTypeID] [int] IDENTITY(1,1) NOT NULL,
	[Manufacturer] [nvarchar](20) NOT NULL,
	[Model] [nvarchar](20) NOT NULL,
	[PricePerDay] [decimal](18, 0) NOT NULL,
	[PricePerLateDay] [decimal](18, 0) NOT NULL,
	[ProductionYear] [nvarchar](4) NOT NULL,
	[GearboxType] [int] NOT NULL,
 CONSTRAINT [PK_CarTypes] PRIMARY KEY CLUSTERED 
(
	[CarTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customers]    Script Date: 14/04/2018 22:18:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[IDNumber] [nvarchar](10) NOT NULL,
	[UserName] [nvarchar](10) NOT NULL,
	[BirthDate] [datetime] NOT NULL,
	[Gender] [int] NOT NULL,
	[EMail] [nvarchar](50) NULL,
	[Password] [nvarchar](256) NOT NULL,
	[Photo] [nvarchar](50) NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employees]    Script Date: 14/04/2018 22:18:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](10) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 14/04/2018 22:18:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[ExpectedReturnDate] [datetime] NOT NULL,
	[ActualReturnDate] [datetime] NULL,
	[CustomerID] [int] NOT NULL,
	[CarID] [int] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Branches] ON 

INSERT [dbo].[Branches] ([BranchID], [Latitude], [Longitude], [BranchName], [Address]) VALUES (1, CAST(32.08530000 AS Decimal(10, 8)), CAST(34.78180000 AS Decimal(11, 8)), N'TelAviv', N'17 Good St. Tel Aviv')
INSERT [dbo].[Branches] ([BranchID], [Latitude], [Longitude], [BranchName], [Address]) VALUES (2, CAST(31.76830000 AS Decimal(10, 8)), CAST(35.21370000 AS Decimal(11, 8)), N'Jerusalem', N'17 Good St. Jerusalem')
INSERT [dbo].[Branches] ([BranchID], [Latitude], [Longitude], [BranchName], [Address]) VALUES (3, CAST(48.85660000 AS Decimal(10, 8)), CAST(2.35220000 AS Decimal(11, 8)), N'Paris', N'17 Good St. Paris')
INSERT [dbo].[Branches] ([BranchID], [Latitude], [Longitude], [BranchName], [Address]) VALUES (4, CAST(51.50740000 AS Decimal(10, 8)), CAST(0.12780000 AS Decimal(11, 8)), N'London', N'17 Good St. London')
INSERT [dbo].[Branches] ([BranchID], [Latitude], [Longitude], [BranchName], [Address]) VALUES (5, CAST(41.90280000 AS Decimal(10, 8)), CAST(12.49640000 AS Decimal(11, 8)), N'Rome', N'17 Good St. Rome')
INSERT [dbo].[Branches] ([BranchID], [Latitude], [Longitude], [BranchName], [Address]) VALUES (6, CAST(40.71280000 AS Decimal(10, 8)), CAST(74.00600000 AS Decimal(11, 8)), N'NewYork', N'17 Good St. New York')
SET IDENTITY_INSERT [dbo].[Branches] OFF
SET IDENTITY_INSERT [dbo].[Cars] ON 

INSERT [dbo].[Cars] ([CarID], [CarTypeID], [Mileage], [Image], [BestCondition], [CarNumber], [BranchID]) VALUES (1, 1, 3000, N'ToyotaYaris.jpg', 1, N'8998998', 1)
INSERT [dbo].[Cars] ([CarID], [CarTypeID], [Mileage], [Image], [BestCondition], [CarNumber], [BranchID]) VALUES (2, 2, 3100, N'VolkswagenBeetle.jpg', 1, N'4554454', 1)
INSERT [dbo].[Cars] ([CarID], [CarTypeID], [Mileage], [Image], [BestCondition], [CarNumber], [BranchID]) VALUES (3, 3, 3200, N'HyundaiI20.jpg', 1, N'3232323', 2)
INSERT [dbo].[Cars] ([CarID], [CarTypeID], [Mileage], [Image], [BestCondition], [CarNumber], [BranchID]) VALUES (4, 4, 3300, N'FordFiesta.jpg', 1, N'6767676', 2)
INSERT [dbo].[Cars] ([CarID], [CarTypeID], [Mileage], [Image], [BestCondition], [CarNumber], [BranchID]) VALUES (5, 5, 3400, N'HondaCivic.jpg', 1, N'2929292', 3)
INSERT [dbo].[Cars] ([CarID], [CarTypeID], [Mileage], [Image], [BestCondition], [CarNumber], [BranchID]) VALUES (6, 6, 3500, N'RenaultFluence.jpg', 1, N'3883883', 4)
INSERT [dbo].[Cars] ([CarID], [CarTypeID], [Mileage], [Image], [BestCondition], [CarNumber], [BranchID]) VALUES (7, 2, 3600, N'VolkswagenBeetle.jpg', 1, N'6464646', 5)
INSERT [dbo].[Cars] ([CarID], [CarTypeID], [Mileage], [Image], [BestCondition], [CarNumber], [BranchID]) VALUES (8, 4, 3600, N'FordFiesta.jpg', 1, N'6462646', 6)
INSERT [dbo].[Cars] ([CarID], [CarTypeID], [Mileage], [Image], [BestCondition], [CarNumber], [BranchID]) VALUES (9, 6, 3600, N'RenaultFluence.jpg', 1, N'6463646', 6)
SET IDENTITY_INSERT [dbo].[Cars] OFF
SET IDENTITY_INSERT [dbo].[CarTypes] ON 

INSERT [dbo].[CarTypes] ([CarTypeID], [Manufacturer], [Model], [PricePerDay], [PricePerLateDay], [ProductionYear], [GearboxType]) VALUES (1, N'Toyota', N'Yaris', CAST(80 AS Decimal(18, 0)), CAST(100 AS Decimal(18, 0)), N'1980', 1)
INSERT [dbo].[CarTypes] ([CarTypeID], [Manufacturer], [Model], [PricePerDay], [PricePerLateDay], [ProductionYear], [GearboxType]) VALUES (2, N'Volkswagen', N'Beetle', CAST(90 AS Decimal(18, 0)), CAST(110 AS Decimal(18, 0)), N'1990', 2)
INSERT [dbo].[CarTypes] ([CarTypeID], [Manufacturer], [Model], [PricePerDay], [PricePerLateDay], [ProductionYear], [GearboxType]) VALUES (3, N'Hyundai', N'i20', CAST(100 AS Decimal(18, 0)), CAST(130 AS Decimal(18, 0)), N'2000', 1)
INSERT [dbo].[CarTypes] ([CarTypeID], [Manufacturer], [Model], [PricePerDay], [PricePerLateDay], [ProductionYear], [GearboxType]) VALUES (4, N'Ford', N'Fiesta', CAST(110 AS Decimal(18, 0)), CAST(150 AS Decimal(18, 0)), N'2005', 2)
INSERT [dbo].[CarTypes] ([CarTypeID], [Manufacturer], [Model], [PricePerDay], [PricePerLateDay], [ProductionYear], [GearboxType]) VALUES (5, N'Honda', N'Civic', CAST(120 AS Decimal(18, 0)), CAST(130 AS Decimal(18, 0)), N'2002', 1)
INSERT [dbo].[CarTypes] ([CarTypeID], [Manufacturer], [Model], [PricePerDay], [PricePerLateDay], [ProductionYear], [GearboxType]) VALUES (6, N'Renault', N'Fluence', CAST(130 AS Decimal(18, 0)), CAST(150 AS Decimal(18, 0)), N'1960', 2)
SET IDENTITY_INSERT [dbo].[CarTypes] OFF
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([CustomerID], [FullName], [IDNumber], [UserName], [BirthDate], [Gender], [EMail], [Password], [Photo]) VALUES (1, N'Muller Jacob', N'021381280', N'jaco123', CAST(N'1957-12-12 00:00:00.000' AS DateTime), 1, NULL, N'qwertyqwerty', NULL)
INSERT [dbo].[Customers] ([CustomerID], [FullName], [IDNumber], [UserName], [BirthDate], [Gender], [EMail], [Password], [Photo]) VALUES (2, N'Keller Michael', N'033624180', N'mich123', CAST(N'1965-12-12 00:00:00.000' AS DateTime), 1, NULL, N'qwertyqwerty', NULL)
INSERT [dbo].[Customers] ([CustomerID], [FullName], [IDNumber], [UserName], [BirthDate], [Gender], [EMail], [Password], [Photo]) VALUES (3, N'Huber Joseph', N'014293450', N'jose123', CAST(N'1970-12-12 00:00:00.000' AS DateTime), 1, NULL, N'qwertyqwerty', NULL)
INSERT [dbo].[Customers] ([CustomerID], [FullName], [IDNumber], [UserName], [BirthDate], [Gender], [EMail], [Password], [Photo]) VALUES (4, N'Martin Daniel', N'065152670', N'dani123', CAST(N'1971-12-12 00:00:00.000' AS DateTime), 1, NULL, N'qwertyqwerty', NULL)
INSERT [dbo].[Customers] ([CustomerID], [FullName], [IDNumber], [UserName], [BirthDate], [Gender], [EMail], [Password], [Photo]) VALUES (5, N'Murphy William', N'034112540', N'will123', CAST(N'1980-12-12 00:00:00.000' AS DateTime), 1, NULL, N'qwertyqwerty', NULL)
SET IDENTITY_INSERT [dbo].[Customers] OFF
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderID], [StartDate], [ExpectedReturnDate], [ActualReturnDate], [CustomerID], [CarID]) VALUES (1, CAST(N'2018-03-03 00:00:00.000' AS DateTime), CAST(N'2018-04-04 00:00:00.000' AS DateTime), CAST(N'2018-04-04 00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[Orders] ([OrderID], [StartDate], [ExpectedReturnDate], [ActualReturnDate], [CustomerID], [CarID]) VALUES (2, CAST(N'2018-04-03 00:00:00.000' AS DateTime), CAST(N'2018-04-04 00:00:00.000' AS DateTime), CAST(N'2018-04-04 00:00:00.000' AS DateTime), 2, 2)
INSERT [dbo].[Orders] ([OrderID], [StartDate], [ExpectedReturnDate], [ActualReturnDate], [CustomerID], [CarID]) VALUES (3, CAST(N'2018-05-03 00:00:00.000' AS DateTime), CAST(N'2018-04-04 00:00:00.000' AS DateTime), CAST(N'2018-04-04 00:00:00.000' AS DateTime), 3, 3)
INSERT [dbo].[Orders] ([OrderID], [StartDate], [ExpectedReturnDate], [ActualReturnDate], [CustomerID], [CarID]) VALUES (4, CAST(N'2018-06-03 00:00:00.000' AS DateTime), CAST(N'2018-04-04 00:00:00.000' AS DateTime), CAST(N'2018-04-04 00:00:00.000' AS DateTime), 4, 4)
INSERT [dbo].[Orders] ([OrderID], [StartDate], [ExpectedReturnDate], [ActualReturnDate], [CustomerID], [CarID]) VALUES (5, CAST(N'2018-03-03 00:00:00.000' AS DateTime), CAST(N'2018-04-04 00:00:00.000' AS DateTime), CAST(N'2018-04-04 00:00:00.000' AS DateTime), 5, 5)
INSERT [dbo].[Orders] ([OrderID], [StartDate], [ExpectedReturnDate], [ActualReturnDate], [CustomerID], [CarID]) VALUES (10, CAST(N'2018-05-01 00:00:00.000' AS DateTime), CAST(N'2018-05-03 00:00:00.000' AS DateTime), CAST(N'2018-05-03 00:00:00.000' AS DateTime), 3, 2)
SET IDENTITY_INSERT [dbo].[Orders] OFF
ALTER TABLE [dbo].[Cars]  WITH CHECK ADD  CONSTRAINT [FK_Cars_Branches] FOREIGN KEY([BranchID])
REFERENCES [dbo].[Branches] ([BranchID])
GO
ALTER TABLE [dbo].[Cars] CHECK CONSTRAINT [FK_Cars_Branches]
GO
ALTER TABLE [dbo].[Cars]  WITH CHECK ADD  CONSTRAINT [FK_Cars_CarTypes] FOREIGN KEY([CarTypeID])
REFERENCES [dbo].[CarTypes] ([CarTypeID])
GO
ALTER TABLE [dbo].[Cars] CHECK CONSTRAINT [FK_Cars_CarTypes]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Cars] FOREIGN KEY([CarID])
REFERENCES [dbo].[Cars] ([CarID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Cars]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customers]
GO
USE [master]
GO
ALTER DATABASE [BestCarsRental] SET  READ_WRITE 
GO
