USE [master]
GO
/****** Object:  Database [BestCarsRental]    Script Date: 21/04/2018 16:58:58 ******/
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
/****** Object:  Table [dbo].[Branches]    Script Date: 21/04/2018 16:58:58 ******/
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
/****** Object:  Table [dbo].[Cars]    Script Date: 21/04/2018 16:58:58 ******/
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
/****** Object:  Table [dbo].[CarTypes]    Script Date: 21/04/2018 16:58:58 ******/
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
/****** Object:  Table [dbo].[Customers]    Script Date: 21/04/2018 16:58:58 ******/
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
	[Gender] [nvarchar](5) NOT NULL,
	[Email] [nvarchar](50) NULL,
	[Password] [nvarchar](256) NOT NULL,
	[Photo] [nvarchar](50) NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employees]    Script Date: 21/04/2018 16:58:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](10) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](256) NOT NULL,
	[Email] [nvarchar](50) NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 21/04/2018 16:58:58 ******/
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
/****** Object:  Table [dbo].[Role]    Script Date: 21/04/2018 16:58:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 21/04/2018 16:58:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [nvarchar](128) NOT NULL,
	[aname] [nvarchar](max) NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
	[FullName] [nvarchar](max) NULL,
	[IDNumber] [nvarchar](max) NULL,
	[BirthDate] [datetime] NULL,
	[Gender] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
	[Photo] [nvarchar](max) NULL,
	[bname] [nvarchar](max) NULL,
	[Discriminator] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserClaim]    Script Date: 21/04/2018 16:58:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserClaim](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.UserClaim] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserLogin]    Script Date: 21/04/2018 16:58:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLogin](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.UserLogin] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 21/04/2018 16:58:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.UserRole] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
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

INSERT [dbo].[Customers] ([CustomerID], [FullName], [IDNumber], [UserName], [BirthDate], [Gender], [Email], [Password], [Photo]) VALUES (1, N'Muller Jacob', N'021381280', N'jaco123', CAST(N'1957-12-12 00:00:00.000' AS DateTime), N'F', N'MullerJacob@xmail.com', N'qwertyqwerty', NULL)
INSERT [dbo].[Customers] ([CustomerID], [FullName], [IDNumber], [UserName], [BirthDate], [Gender], [Email], [Password], [Photo]) VALUES (2, N'Keller Michael', N'033624180', N'mich123', CAST(N'1965-12-12 00:00:00.000' AS DateTime), N'F', N'KellerMichael@xmail.com', N'qwertyqwerty', NULL)
INSERT [dbo].[Customers] ([CustomerID], [FullName], [IDNumber], [UserName], [BirthDate], [Gender], [Email], [Password], [Photo]) VALUES (3, N'Huber Joseph', N'014293450', N'jose123', CAST(N'1970-12-12 00:00:00.000' AS DateTime), N'F', N'HuberJoseph@xmail.com', N'qwertyqwerty', NULL)
INSERT [dbo].[Customers] ([CustomerID], [FullName], [IDNumber], [UserName], [BirthDate], [Gender], [Email], [Password], [Photo]) VALUES (4, N'Martin Daniel', N'065152670', N'dani123', CAST(N'1971-12-12 00:00:00.000' AS DateTime), N'F', N'MartinDaniel@xmail.com', N'qwertyqwerty', NULL)
INSERT [dbo].[Customers] ([CustomerID], [FullName], [IDNumber], [UserName], [BirthDate], [Gender], [Email], [Password], [Photo]) VALUES (5, N'Murphy William', N'034112540', N'will123', CAST(N'1980-12-12 00:00:00.000' AS DateTime), N'F', N'MurphyWilliam@xmail.com', N'qwertyqwerty', NULL)
SET IDENTITY_INSERT [dbo].[Customers] OFF
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([EmployeeID], [UserName], [Title], [Password], [Email]) VALUES (1, N'employee1', N'good', N'qwerty123', N'emp1@bestcars.com')
INSERT [dbo].[Employees] ([EmployeeID], [UserName], [Title], [Password], [Email]) VALUES (2, N'manager', N'admin', N'qwerty123', N'manager@bestcars.com')
INSERT [dbo].[Employees] ([EmployeeID], [UserName], [Title], [Password], [Email]) VALUES (3, N'employee2', N'good', N'qwerty123', N'emp2@bestcars.com')
INSERT [dbo].[Employees] ([EmployeeID], [UserName], [Title], [Password], [Email]) VALUES (4, N'employee3', N'good', N'qwerty123', N'emp3@bestcars.com')
SET IDENTITY_INSERT [dbo].[Employees] OFF
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderID], [StartDate], [ExpectedReturnDate], [ActualReturnDate], [CustomerID], [CarID]) VALUES (1, CAST(N'2018-03-03 00:00:00.000' AS DateTime), CAST(N'2018-04-04 00:00:00.000' AS DateTime), CAST(N'2018-04-04 00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[Orders] ([OrderID], [StartDate], [ExpectedReturnDate], [ActualReturnDate], [CustomerID], [CarID]) VALUES (2, CAST(N'2018-04-03 00:00:00.000' AS DateTime), CAST(N'2018-04-04 00:00:00.000' AS DateTime), CAST(N'2018-04-04 00:00:00.000' AS DateTime), 2, 2)
INSERT [dbo].[Orders] ([OrderID], [StartDate], [ExpectedReturnDate], [ActualReturnDate], [CustomerID], [CarID]) VALUES (3, CAST(N'2018-05-03 00:00:00.000' AS DateTime), CAST(N'2018-04-04 00:00:00.000' AS DateTime), CAST(N'2018-04-04 00:00:00.000' AS DateTime), 3, 3)
INSERT [dbo].[Orders] ([OrderID], [StartDate], [ExpectedReturnDate], [ActualReturnDate], [CustomerID], [CarID]) VALUES (4, CAST(N'2018-06-03 00:00:00.000' AS DateTime), CAST(N'2018-04-04 00:00:00.000' AS DateTime), CAST(N'2018-04-04 00:00:00.000' AS DateTime), 4, 4)
INSERT [dbo].[Orders] ([OrderID], [StartDate], [ExpectedReturnDate], [ActualReturnDate], [CustomerID], [CarID]) VALUES (5, CAST(N'2018-03-03 00:00:00.000' AS DateTime), CAST(N'2018-04-04 00:00:00.000' AS DateTime), CAST(N'2018-04-04 00:00:00.000' AS DateTime), 5, 5)
SET IDENTITY_INSERT [dbo].[Orders] OFF
INSERT [dbo].[User] ([Id], [aname], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FullName], [IDNumber], [BirthDate], [Gender], [Password], [Photo], [bname], [Discriminator]) VALUES (N'15d6e78c-f1ca-4391-98ce-672530e484f2', NULL, N'MurphyWilliam@xmail.com', 0, N'AFMGGxbGkHZKcDGNf2slsLCcLfy1KS3b5n/8Oiv3zxzFB6YjCygLfnRUOF8gtSNvlQ==', N'113202c6-5108-4a17-b7e8-63fa09653e55', NULL, 0, 0, NULL, 0, 0, N'will123', N'Murphy William', N'034112540', CAST(N'1980-12-12 00:00:00.000' AS DateTime), N'M', N'qwertyqwerty', NULL, NULL, N'CustomerIdentityUser')
INSERT [dbo].[User] ([Id], [aname], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FullName], [IDNumber], [BirthDate], [Gender], [Password], [Photo], [bname], [Discriminator]) VALUES (N'464966ec-a0cf-415b-851c-85dbb64c366e', NULL, N'MartinDaniel@xmail.com', 0, N'AJK99DXKfqlwxVXWyyEOu+lUhnUurqLPZ5iVVBsC2n5QolW/lZQNxozMJjiFA9ZbNg==', N'c9f2c161-943b-4ff4-8c96-4e8e6af81045', NULL, 0, 0, NULL, 0, 0, N'dani123', N'Martin Daniel', N'065152670', CAST(N'1971-12-12 00:00:00.000' AS DateTime), N'M', N'qwertyqwerty', NULL, NULL, N'CustomerIdentityUser')
INSERT [dbo].[User] ([Id], [aname], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FullName], [IDNumber], [BirthDate], [Gender], [Password], [Photo], [bname], [Discriminator]) VALUES (N'4da94238-ac25-4da9-8fa8-795db6775e11', NULL, N'MullerJacob@xmail.com', 0, N'AFq67jasWmq3O2QY0vXAvwL8Z0CKNd8wA8yI5wAD0MWH+pJmr/C5LBvOmqrPtrsi9Q==', N'e19b229c-6fd1-4385-9d63-96d762d0b44b', NULL, 0, 0, NULL, 0, 0, N'jaco123', N'Muller Jacob', N'021381280', CAST(N'1957-12-12 00:00:00.000' AS DateTime), N'M', N'qwertyqwerty', NULL, NULL, N'CustomerIdentityUser')
INSERT [dbo].[User] ([Id], [aname], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FullName], [IDNumber], [BirthDate], [Gender], [Password], [Photo], [bname], [Discriminator]) VALUES (N'96d20620-241f-4ccc-876d-61bbe76ee81b', NULL, N'KellerMichael@xmail.com', 0, N'AKap67YmzFikvjTrfEFRxlgs5e7/eXpWmSonOVdQtVDW9ilJ9muCSGbT7dGxeOmhNg==', N'51d55ad4-254a-40f2-aa6f-4379039a6fbd', NULL, 0, 0, NULL, 0, 0, N'mich123', N'Keller Michael', N'033624180', CAST(N'1965-12-12 00:00:00.000' AS DateTime), N'M', N'qwertyqwerty', NULL, NULL, N'CustomerIdentityUser')
INSERT [dbo].[User] ([Id], [aname], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FullName], [IDNumber], [BirthDate], [Gender], [Password], [Photo], [bname], [Discriminator]) VALUES (N'fbf66516-f614-4339-98db-38490d0d762b', NULL, N'HuberJoseph@xmail.com', 0, N'AJWb+7tdFIvoZh9VtPSzeuap0CpfxTbNb5TBJ+rKesk822ZjDtJjYNZUKQbHMgZQYQ==', N'a2ea22c8-ae48-426b-88db-792728654281', NULL, 0, 0, NULL, 0, 0, N'jose123', N'Huber Joseph', N'014293450', CAST(N'1970-12-12 00:00:00.000' AS DateTime), N'M', N'qwertyqwerty', NULL, NULL, N'CustomerIdentityUser')
SET ANSI_PADDING ON

GO
/****** Object:  Index [RoleNameIndex]    Script Date: 21/04/2018 16:58:58 ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[Role]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UserNameIndex]    Script Date: 21/04/2018 16:58:58 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[User]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 21/04/2018 16:58:58 ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[UserClaim]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 21/04/2018 16:58:58 ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[UserLogin]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_RoleId]    Script Date: 21/04/2018 16:58:58 ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[UserRole]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 21/04/2018 16:58:58 ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[UserRole]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
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
ALTER TABLE [dbo].[UserClaim]  WITH CHECK ADD  CONSTRAINT [FK_dbo.UserClaim_dbo.User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserClaim] CHECK CONSTRAINT [FK_dbo.UserClaim_dbo.User_UserId]
GO
ALTER TABLE [dbo].[UserLogin]  WITH CHECK ADD  CONSTRAINT [FK_dbo.UserLogin_dbo.User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserLogin] CHECK CONSTRAINT [FK_dbo.UserLogin_dbo.User_UserId]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_dbo.UserRole_dbo.Role_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_dbo.UserRole_dbo.Role_RoleId]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_dbo.UserRole_dbo.User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_dbo.UserRole_dbo.User_UserId]
GO
USE [master]
GO
ALTER DATABASE [BestCarsRental] SET  READ_WRITE 
GO
