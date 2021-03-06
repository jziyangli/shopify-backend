USE [master]
GO
/****** Object:  Database [shopify_backend]    Script Date: 1/19/2022 2:07:45 PM ******/
CREATE DATABASE [shopify_backend]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'shopify_backend', FILENAME = N'C:\Users\admin\shopify_backend.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'shopify_backend_log', FILENAME = N'C:\Users\admin\shopify_backend_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [shopify_backend] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [shopify_backend].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [shopify_backend] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [shopify_backend] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [shopify_backend] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [shopify_backend] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [shopify_backend] SET ARITHABORT OFF 
GO
ALTER DATABASE [shopify_backend] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [shopify_backend] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [shopify_backend] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [shopify_backend] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [shopify_backend] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [shopify_backend] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [shopify_backend] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [shopify_backend] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [shopify_backend] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [shopify_backend] SET  ENABLE_BROKER 
GO
ALTER DATABASE [shopify_backend] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [shopify_backend] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [shopify_backend] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [shopify_backend] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [shopify_backend] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [shopify_backend] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [shopify_backend] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [shopify_backend] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [shopify_backend] SET  MULTI_USER 
GO
ALTER DATABASE [shopify_backend] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [shopify_backend] SET DB_CHAINING OFF 
GO
ALTER DATABASE [shopify_backend] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [shopify_backend] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [shopify_backend] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [shopify_backend] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [shopify_backend] SET QUERY_STORE = OFF
GO
USE [shopify_backend]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 1/19/2022 2:07:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 1/19/2022 2:07:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](max) NOT NULL,
	[LastName] [nvarchar](max) NOT NULL,
	[BirthDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 1/19/2022 2:07:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[OrderDateTime] [int] NOT NULL,
	[TotalPrice] [float] NOT NULL,
	[CustomerId] [int] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductOrder]    Script Date: 1/19/2022 2:07:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductOrder](
	[ProductOrderId] [int] IDENTITY(1,1) NOT NULL,
	[OrderQuantity] [int] NOT NULL,
	[UnitPrice] [float] NOT NULL,
	[SubTotal] [float] NOT NULL,
	[ProductId] [int] NOT NULL,
	[OrderId] [int] NOT NULL,
 CONSTRAINT [PK_ProductOrder] PRIMARY KEY CLUSTERED 
(
	[ProductOrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 1/19/2022 2:07:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[UnitPrice] [float] NOT NULL,
	[Quantity] [int] NOT NULL,
	[QuantityShipped] [int] NOT NULL,
	[QuantityReceived] [int] NOT NULL,
	[PartNumber] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductSupply]    Script Date: 1/19/2022 2:07:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSupply](
	[ProductSupplyId] [int] IDENTITY(1,1) NOT NULL,
	[SupplyQuantity] [int] NOT NULL,
	[OrderDateTime] [int] NOT NULL,
	[ArriveDateTime] [int] NOT NULL,
	[Arrived] [bit] NOT NULL,
	[ProductId] [int] NOT NULL,
	[SupplierId] [int] NOT NULL,
 CONSTRAINT [PK_ProductSupply] PRIMARY KEY CLUSTERED 
(
	[ProductSupplyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductTag]    Script Date: 1/19/2022 2:07:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductTag](
	[ProductsProductId] [int] NOT NULL,
	[TagsTagId] [int] NOT NULL,
 CONSTRAINT [PK_ProductTag] PRIMARY KEY CLUSTERED 
(
	[ProductsProductId] ASC,
	[TagsTagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 1/19/2022 2:07:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[SupplierId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Phone] [nvarchar](max) NOT NULL,
	[EmailAddress] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[SupplierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tags]    Script Date: 1/19/2022 2:07:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tags](
	[TagId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Tags] PRIMARY KEY CLUSTERED 
(
	[TagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Index [IX_Orders_CustomerId]    Script Date: 1/19/2022 2:07:45 PM ******/
CREATE NONCLUSTERED INDEX [IX_Orders_CustomerId] ON [dbo].[Orders]
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductOrder_OrderId]    Script Date: 1/19/2022 2:07:45 PM ******/
CREATE NONCLUSTERED INDEX [IX_ProductOrder_OrderId] ON [dbo].[ProductOrder]
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductOrder_ProductId]    Script Date: 1/19/2022 2:07:45 PM ******/
CREATE NONCLUSTERED INDEX [IX_ProductOrder_ProductId] ON [dbo].[ProductOrder]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductSupply_ProductId]    Script Date: 1/19/2022 2:07:45 PM ******/
CREATE NONCLUSTERED INDEX [IX_ProductSupply_ProductId] ON [dbo].[ProductSupply]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductSupply_SupplierId]    Script Date: 1/19/2022 2:07:45 PM ******/
CREATE NONCLUSTERED INDEX [IX_ProductSupply_SupplierId] ON [dbo].[ProductSupply]
(
	[SupplierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductTag_TagsTagId]    Script Date: 1/19/2022 2:07:45 PM ******/
CREATE NONCLUSTERED INDEX [IX_ProductTag_TagsTagId] ON [dbo].[ProductTag]
(
	[TagsTagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customers_CustomerId] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([CustomerId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customers_CustomerId]
GO
ALTER TABLE [dbo].[ProductOrder]  WITH CHECK ADD  CONSTRAINT [FK_ProductOrder_Orders_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([OrderId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductOrder] CHECK CONSTRAINT [FK_ProductOrder_Orders_OrderId]
GO
ALTER TABLE [dbo].[ProductOrder]  WITH CHECK ADD  CONSTRAINT [FK_ProductOrder_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductOrder] CHECK CONSTRAINT [FK_ProductOrder_Products_ProductId]
GO
ALTER TABLE [dbo].[ProductSupply]  WITH CHECK ADD  CONSTRAINT [FK_ProductSupply_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductSupply] CHECK CONSTRAINT [FK_ProductSupply_Products_ProductId]
GO
ALTER TABLE [dbo].[ProductSupply]  WITH CHECK ADD  CONSTRAINT [FK_ProductSupply_Supplier_SupplierId] FOREIGN KEY([SupplierId])
REFERENCES [dbo].[Supplier] ([SupplierId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductSupply] CHECK CONSTRAINT [FK_ProductSupply_Supplier_SupplierId]
GO
ALTER TABLE [dbo].[ProductTag]  WITH CHECK ADD  CONSTRAINT [FK_ProductTag_Products_ProductsProductId] FOREIGN KEY([ProductsProductId])
REFERENCES [dbo].[Products] ([ProductId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductTag] CHECK CONSTRAINT [FK_ProductTag_Products_ProductsProductId]
GO
ALTER TABLE [dbo].[ProductTag]  WITH CHECK ADD  CONSTRAINT [FK_ProductTag_Tags_TagsTagId] FOREIGN KEY([TagsTagId])
REFERENCES [dbo].[Tags] ([TagId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductTag] CHECK CONSTRAINT [FK_ProductTag_Tags_TagsTagId]
GO
USE [master]
GO
ALTER DATABASE [shopify_backend] SET  READ_WRITE 
GO
