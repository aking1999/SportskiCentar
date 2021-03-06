USE [SportskiCentarEngleski]
GO
ALTER TABLE [dbo].[ShoppingCartItems] DROP CONSTRAINT [FK__ShoppingC__Shopp__45F365D3]
GO
ALTER TABLE [dbo].[ShoppingCartItems] DROP CONSTRAINT [FK__ShoppingC__Servi__46E78A0C]
GO
ALTER TABLE [dbo].[ShoppingCart] DROP CONSTRAINT [FK__ShoppingC__Custo__4316F928]
GO
ALTER TABLE [dbo].[Service] DROP CONSTRAINT [FK__Service__Employe__3B75D760]
GO
ALTER TABLE [dbo].[CreditCard] DROP CONSTRAINT [FK__CreditCar__Custo__3F466844]
GO
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserLogins] DROP CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserClaims] DROP CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
/****** Object:  Index [UQ__Shopping__F9EBAA3A9AE314EC]    Script Date: 28-Jan-20 6:15:04 PM ******/
ALTER TABLE [dbo].[ShoppingCart] DROP CONSTRAINT [UQ__Shopping__F9EBAA3A9AE314EC]
GO
/****** Object:  Index [UQ__CreditCa__F9EBAA3A16C21E8F]    Script Date: 28-Jan-20 6:15:04 PM ******/
ALTER TABLE [dbo].[CreditCard] DROP CONSTRAINT [UQ__CreditCa__F9EBAA3A16C21E8F]
GO
/****** Object:  Index [UserNameIndex]    Script Date: 28-Jan-20 6:15:04 PM ******/
DROP INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
GO
/****** Object:  Index [IX_UserId]    Script Date: 28-Jan-20 6:15:04 PM ******/
DROP INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
GO
/****** Object:  Index [IX_RoleId]    Script Date: 28-Jan-20 6:15:04 PM ******/
DROP INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
GO
/****** Object:  Index [IX_UserId]    Script Date: 28-Jan-20 6:15:04 PM ******/
DROP INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
GO
/****** Object:  Index [IX_UserId]    Script Date: 28-Jan-20 6:15:04 PM ******/
DROP INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 28-Jan-20 6:15:04 PM ******/
DROP INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
GO
/****** Object:  Table [dbo].[ShoppingCartItems]    Script Date: 28-Jan-20 6:15:04 PM ******/
DROP TABLE [dbo].[ShoppingCartItems]
GO
/****** Object:  Table [dbo].[ShoppingCart]    Script Date: 28-Jan-20 6:15:04 PM ******/
DROP TABLE [dbo].[ShoppingCart]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 28-Jan-20 6:15:04 PM ******/
DROP TABLE [dbo].[Service]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 28-Jan-20 6:15:04 PM ******/
DROP TABLE [dbo].[Employee]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 28-Jan-20 6:15:04 PM ******/
DROP TABLE [dbo].[Customer]
GO
/****** Object:  Table [dbo].[CreditCard]    Script Date: 28-Jan-20 6:15:04 PM ******/
DROP TABLE [dbo].[CreditCard]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 28-Jan-20 6:15:04 PM ******/
DROP TABLE [dbo].[AspNetUsers]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 28-Jan-20 6:15:04 PM ******/
DROP TABLE [dbo].[AspNetUserRoles]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 28-Jan-20 6:15:04 PM ******/
DROP TABLE [dbo].[AspNetUserLogins]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 28-Jan-20 6:15:04 PM ******/
DROP TABLE [dbo].[AspNetUserClaims]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 28-Jan-20 6:15:04 PM ******/
DROP TABLE [dbo].[AspNetRoles]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 28-Jan-20 6:15:04 PM ******/
DROP TABLE [dbo].[__MigrationHistory]
GO
USE [master]
GO
/****** Object:  Database [SportskiCentarEngleski]    Script Date: 28-Jan-20 6:15:04 PM ******/
DROP DATABASE [SportskiCentarEngleski]
GO
/****** Object:  Database [SportskiCentarEngleski]    Script Date: 28-Jan-20 6:15:04 PM ******/
CREATE DATABASE [SportskiCentarEngleski]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SportskiCentarEngleski', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\SportskiCentarEngleski.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SportskiCentarEngleski_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\SportskiCentarEngleski_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [SportskiCentarEngleski] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SportskiCentarEngleski].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SportskiCentarEngleski] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SportskiCentarEngleski] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SportskiCentarEngleski] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SportskiCentarEngleski] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SportskiCentarEngleski] SET ARITHABORT OFF 
GO
ALTER DATABASE [SportskiCentarEngleski] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SportskiCentarEngleski] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SportskiCentarEngleski] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SportskiCentarEngleski] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SportskiCentarEngleski] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SportskiCentarEngleski] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SportskiCentarEngleski] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SportskiCentarEngleski] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SportskiCentarEngleski] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SportskiCentarEngleski] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SportskiCentarEngleski] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SportskiCentarEngleski] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SportskiCentarEngleski] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SportskiCentarEngleski] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SportskiCentarEngleski] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SportskiCentarEngleski] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SportskiCentarEngleski] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SportskiCentarEngleski] SET RECOVERY FULL 
GO
ALTER DATABASE [SportskiCentarEngleski] SET  MULTI_USER 
GO
ALTER DATABASE [SportskiCentarEngleski] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SportskiCentarEngleski] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SportskiCentarEngleski] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SportskiCentarEngleski] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SportskiCentarEngleski] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'SportskiCentarEngleski', N'ON'
GO
ALTER DATABASE [SportskiCentarEngleski] SET QUERY_STORE = OFF
GO
USE [SportskiCentarEngleski]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 28-Jan-20 6:15:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 28-Jan-20 6:15:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 28-Jan-20 6:15:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 28-Jan-20 6:15:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 28-Jan-20 6:15:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 28-Jan-20 6:15:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
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
	[JMBG] [nvarchar](13) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CreditCard]    Script Date: 28-Jan-20 6:15:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CreditCard](
	[CreditCardNumber] [nvarchar](25) NOT NULL,
	[FirstName] [nvarchar](30) NULL,
	[LastName] [nvarchar](50) NULL,
	[Balance] [numeric](13, 0) NOT NULL,
	[ExpirationDate] [date] NULL,
	[Address] [nvarchar](50) NULL,
	[PostalCode] [nvarchar](15) NULL,
	[PIN] [nvarchar](10) NULL,
	[CustomerJMBG] [nvarchar](13) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CreditCardNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 28-Jan-20 6:15:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[JMBG] [nvarchar](13) NOT NULL,
	[FirstName] [nvarchar](30) NULL,
	[LastName] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[JMBG] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 28-Jan-20 6:15:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[JMBG] [nvarchar](13) NOT NULL,
	[FirstName] [nvarchar](30) NULL,
	[LastName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[JMBG] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 28-Jan-20 6:15:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[ServiceID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](45) NULL,
	[Price] [numeric](8, 2) NULL,
	[Type] [nvarchar](40) NULL,
	[EmployeeJMBG] [nvarchar](13) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ServiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShoppingCart]    Script Date: 28-Jan-20 6:15:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShoppingCart](
	[ShoppingCartID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerJMBG] [nvarchar](13) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ShoppingCartID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShoppingCartItems]    Script Date: 28-Jan-20 6:15:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShoppingCartItems](
	[ShoppingCartID] [int] NOT NULL,
	[OrdinalNum] [int] NOT NULL,
	[Amount] [numeric](8, 0) NULL,
	[ServiceID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ShoppingCartID] ASC,
	[OrdinalNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'186be3f1-0b1e-4e41-9bb3-624139f2fb5e', N'Employee')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'380ba60e-02dc-43f4-b842-70c4e700f4e6', N'186be3f1-0b1e-4e41-9bb3-624139f2fb5e')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [JMBG]) VALUES (N'0b45ad54-57fd-408a-bcf1-087dfb59dca1', N'aleksa@aleksa.com', 0, N'ACcvcn4HJD4fT5NWDJSkekgNPGnpMxHcVUbDbOU0aKOqR2ndcQD/rUPjuJilvDcUiQ==', N'77437de8-7563-47c1-acb1-bee4d4a3a0e0', NULL, 0, 0, NULL, 1, 0, N'aleksa@aleksa.com', N'5555555555555')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [JMBG]) VALUES (N'380ba60e-02dc-43f4-b842-70c4e700f4e6', N'admin@admin.com', 0, N'AH36ZAvw8v8rMech1ucTbAJ+f8cSpZ6Jd8zP6jSjjZmqi31/qbYtIBbXT+ASIz8kLA==', N'd723d883-5fe7-4762-8cca-260a33098441', NULL, 0, 0, NULL, 1, 0, N'admin@admin.com', N'4596582548526')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [JMBG]) VALUES (N'6de7fee0-1a93-40f8-83c0-d816dd9e5785', N'pera@pera.com', 0, N'AO/csg9mW3btJR9WtnkcaZufImry26RGvGSNyIXM+aJUjIjDmekn5NkslcbjyXrUVA==', N'0cb70bfe-dc7b-4d6f-aff0-3dfd51efa29b', NULL, 0, 0, NULL, 1, 0, N'pera@pera.com', N'7777777777777')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [JMBG]) VALUES (N'83de3e54-e031-4482-816e-e1786c8e0bc0', N'saban@saban.com', 0, N'AAhU7wZitGWCqmC+TXh7egSHg/HpUA++gvgQ1MqHuqdR8bGdoBIPEFHlwfbG5FueFQ==', N'1ab75116-3061-447f-94ea-5d4cb1dcd300', NULL, 0, 0, NULL, 1, 0, N'saban@saban.com', N'1111111111111')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [JMBG]) VALUES (N'bd448316-2416-44ec-972e-f184005610af', N'mitar@mitar.com', 0, N'ANO2f+bj/BchzEY85VdAUQNzg/JxFx9q6DUm9JVAH678xrtSa42byKxWd2yWFQ2k6g==', N'71ef09aa-4e39-477f-bcca-00b403e4e445', NULL, 0, 0, NULL, 1, 0, N'mitar@mitar.com', N'1234567891254')
INSERT [dbo].[CreditCard] ([CreditCardNumber], [FirstName], [LastName], [Balance], [ExpirationDate], [Address], [PostalCode], [PIN], [CustomerJMBG]) VALUES (N'123', N'Aleksa', N'Aleksic', CAST(11500 AS Numeric(13, 0)), CAST(N'2020-05-02' AS Date), N'Pozeska', N'11273', N'4444', N'5555555555555')
INSERT [dbo].[Customer] ([JMBG], [FirstName], [LastName], [Address]) VALUES (N'1111111111111', N'Saban', N'Saulic', N'Zemunska')
INSERT [dbo].[Customer] ([JMBG], [FirstName], [LastName], [Address]) VALUES (N'1234567891254', N'Mitar', N'Miric', N'Adresa')
INSERT [dbo].[Customer] ([JMBG], [FirstName], [LastName], [Address]) VALUES (N'1235623562356', N'Gost', N'Gostic', N'Pozeska')
INSERT [dbo].[Customer] ([JMBG], [FirstName], [LastName], [Address]) VALUES (N'5258754646', N'Senidah', N'Senidah', N'Bosanska Krupa')
INSERT [dbo].[Customer] ([JMBG], [FirstName], [LastName], [Address]) VALUES (N'5555555555555', N'Aleksa', N'Shahgoli', N'Mihajla Pupina')
INSERT [dbo].[Customer] ([JMBG], [FirstName], [LastName], [Address]) VALUES (N'7777777777777', N'Pera', N'Peric', N'Pozeska')
INSERT [dbo].[Employee] ([JMBG], [FirstName], [LastName]) VALUES (N'4596582548526', N'Milos', N'Milosevic')
SET IDENTITY_INSERT [dbo].[Service] ON 

INSERT [dbo].[Service] ([ServiceID], [Name], [Price], [Type], [EmployeeJMBG]) VALUES (14, N'Basketball', CAST(1500.00 AS Numeric(8, 2)), N'Team', N'4596582548526')
INSERT [dbo].[Service] ([ServiceID], [Name], [Price], [Type], [EmployeeJMBG]) VALUES (17, N'Swimming2', CAST(6500.00 AS Numeric(8, 2)), N'Water Sportss', N'4596582548526')
INSERT [dbo].[Service] ([ServiceID], [Name], [Price], [Type], [EmployeeJMBG]) VALUES (18, N'Swimming', CAST(6500.00 AS Numeric(8, 2)), N'Water Sports', N'4596582548526')
INSERT [dbo].[Service] ([ServiceID], [Name], [Price], [Type], [EmployeeJMBG]) VALUES (19, N'Primer', CAST(566.00 AS Numeric(8, 2)), N'Tip', N'4596582548526')
INSERT [dbo].[Service] ([ServiceID], [Name], [Price], [Type], [EmployeeJMBG]) VALUES (21, N'Swimming', CAST(5000.00 AS Numeric(8, 2)), N'Outdoor', N'4596582548526')
INSERT [dbo].[Service] ([ServiceID], [Name], [Price], [Type], [EmployeeJMBG]) VALUES (23, N'MMA', CAST(5000.00 AS Numeric(8, 2)), N'Team Sports', N'4596582548526')
INSERT [dbo].[Service] ([ServiceID], [Name], [Price], [Type], [EmployeeJMBG]) VALUES (24, N'Running', CAST(5000.00 AS Numeric(8, 2)), N'Outdoor', N'4596582548526')
INSERT [dbo].[Service] ([ServiceID], [Name], [Price], [Type], [EmployeeJMBG]) VALUES (26, N'Tennis', CAST(7800.00 AS Numeric(8, 2)), N'Outdoor', N'4596582548526')
SET IDENTITY_INSERT [dbo].[Service] OFF
SET IDENTITY_INSERT [dbo].[ShoppingCart] ON 

INSERT [dbo].[ShoppingCart] ([ShoppingCartID], [CustomerJMBG]) VALUES (56, N'1111111111111')
INSERT [dbo].[ShoppingCart] ([ShoppingCartID], [CustomerJMBG]) VALUES (55, N'1234567891254')
INSERT [dbo].[ShoppingCart] ([ShoppingCartID], [CustomerJMBG]) VALUES (52, N'1235623562356')
INSERT [dbo].[ShoppingCart] ([ShoppingCartID], [CustomerJMBG]) VALUES (59, N'5555555555555')
INSERT [dbo].[ShoppingCart] ([ShoppingCartID], [CustomerJMBG]) VALUES (53, N'7777777777777')
SET IDENTITY_INSERT [dbo].[ShoppingCart] OFF
INSERT [dbo].[ShoppingCartItems] ([ShoppingCartID], [OrdinalNum], [Amount], [ServiceID]) VALUES (52, 1, CAST(1500 AS Numeric(8, 0)), 14)
INSERT [dbo].[ShoppingCartItems] ([ShoppingCartID], [OrdinalNum], [Amount], [ServiceID]) VALUES (52, 2, CAST(1500 AS Numeric(8, 0)), 14)
INSERT [dbo].[ShoppingCartItems] ([ShoppingCartID], [OrdinalNum], [Amount], [ServiceID]) VALUES (53, 1, CAST(6500 AS Numeric(8, 0)), 17)
INSERT [dbo].[ShoppingCartItems] ([ShoppingCartID], [OrdinalNum], [Amount], [ServiceID]) VALUES (53, 2, CAST(6500 AS Numeric(8, 0)), 17)
INSERT [dbo].[ShoppingCartItems] ([ShoppingCartID], [OrdinalNum], [Amount], [ServiceID]) VALUES (53, 3, CAST(6500 AS Numeric(8, 0)), 17)
INSERT [dbo].[ShoppingCartItems] ([ShoppingCartID], [OrdinalNum], [Amount], [ServiceID]) VALUES (55, 1, CAST(1500 AS Numeric(8, 0)), 14)
INSERT [dbo].[ShoppingCartItems] ([ShoppingCartID], [OrdinalNum], [Amount], [ServiceID]) VALUES (55, 2, CAST(1500 AS Numeric(8, 0)), 14)
INSERT [dbo].[ShoppingCartItems] ([ShoppingCartID], [OrdinalNum], [Amount], [ServiceID]) VALUES (56, 1, CAST(1500 AS Numeric(8, 0)), 14)
INSERT [dbo].[ShoppingCartItems] ([ShoppingCartID], [OrdinalNum], [Amount], [ServiceID]) VALUES (59, 5, CAST(6500 AS Numeric(8, 0)), 17)
INSERT [dbo].[ShoppingCartItems] ([ShoppingCartID], [OrdinalNum], [Amount], [ServiceID]) VALUES (59, 6, CAST(6500 AS Numeric(8, 0)), 17)
INSERT [dbo].[ShoppingCartItems] ([ShoppingCartID], [OrdinalNum], [Amount], [ServiceID]) VALUES (59, 7, CAST(6500 AS Numeric(8, 0)), 17)
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 28-Jan-20 6:15:05 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 28-Jan-20 6:15:05 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 28-Jan-20 6:15:05 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_RoleId]    Script Date: 28-Jan-20 6:15:05 PM ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 28-Jan-20 6:15:05 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 28-Jan-20 6:15:05 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__CreditCa__F9EBAA3A16C21E8F]    Script Date: 28-Jan-20 6:15:05 PM ******/
ALTER TABLE [dbo].[CreditCard] ADD UNIQUE NONCLUSTERED 
(
	[CustomerJMBG] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Shopping__F9EBAA3A9AE314EC]    Script Date: 28-Jan-20 6:15:05 PM ******/
ALTER TABLE [dbo].[ShoppingCart] ADD UNIQUE NONCLUSTERED 
(
	[CustomerJMBG] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[CreditCard]  WITH CHECK ADD FOREIGN KEY([CustomerJMBG])
REFERENCES [dbo].[Customer] ([JMBG])
GO
ALTER TABLE [dbo].[Service]  WITH CHECK ADD FOREIGN KEY([EmployeeJMBG])
REFERENCES [dbo].[Employee] ([JMBG])
GO
ALTER TABLE [dbo].[ShoppingCart]  WITH CHECK ADD FOREIGN KEY([CustomerJMBG])
REFERENCES [dbo].[Customer] ([JMBG])
GO
ALTER TABLE [dbo].[ShoppingCartItems]  WITH CHECK ADD FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Service] ([ServiceID])
GO
ALTER TABLE [dbo].[ShoppingCartItems]  WITH CHECK ADD FOREIGN KEY([ShoppingCartID])
REFERENCES [dbo].[ShoppingCart] ([ShoppingCartID])
GO
USE [master]
GO
ALTER DATABASE [SportskiCentarEngleski] SET  READ_WRITE 
GO
