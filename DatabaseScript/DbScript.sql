USE [master]
GO
/****** Object:  Database [MobileShopOnline]    Script Date: 7/30/2021 11:28:12 AM ******/
CREATE DATABASE [MobileShopOnline]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MobileShopOnline', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MobileShopOnline.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MobileShopOnline_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MobileShopOnline_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [MobileShopOnline] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MobileShopOnline].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MobileShopOnline] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MobileShopOnline] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MobileShopOnline] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MobileShopOnline] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MobileShopOnline] SET ARITHABORT OFF 
GO
ALTER DATABASE [MobileShopOnline] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MobileShopOnline] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MobileShopOnline] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MobileShopOnline] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MobileShopOnline] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MobileShopOnline] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MobileShopOnline] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MobileShopOnline] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MobileShopOnline] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MobileShopOnline] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MobileShopOnline] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MobileShopOnline] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MobileShopOnline] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MobileShopOnline] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MobileShopOnline] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MobileShopOnline] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MobileShopOnline] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MobileShopOnline] SET RECOVERY FULL 
GO
ALTER DATABASE [MobileShopOnline] SET  MULTI_USER 
GO
ALTER DATABASE [MobileShopOnline] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MobileShopOnline] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MobileShopOnline] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MobileShopOnline] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MobileShopOnline] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MobileShopOnline] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'MobileShopOnline', N'ON'
GO
ALTER DATABASE [MobileShopOnline] SET QUERY_STORE = OFF
GO
USE [MobileShopOnline]
GO
/****** Object:  Table [dbo].[Images]    Script Date: 7/30/2021 11:28:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Images](
	[ProductID] [nchar](10) NOT NULL,
	[ProductImage] [nchar](50) NOT NULL,
	[Image1] [nchar](50) NULL,
	[Image2] [nchar](50) NULL,
	[Image3] [nchar](50) NULL,
	[Image4] [nchar](50) NULL,
	[Image5] [nchar](50) NULL,
	[Image6] [nchar](50) NULL,
	[Image7] [nchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manufacturer]    Script Date: 7/30/2021 11:28:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufacturer](
	[ManufacturerID] [nchar](10) NOT NULL,
	[ManufacturerName] [nchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 7/30/2021 11:28:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [nchar](10) NOT NULL,
	[ProductTypeID] [nchar](10) NOT NULL,
	[ManufacturerID] [nchar](10) NOT NULL,
	[ProductName] [nvarchar](max) NULL,
	[ProductConfig] [ntext] NULL,
	[ProductStatus] [bit] NULL,
	[ProductPrice] [money] NULL,
	[ProductSellRecord] [int] NULL,
	[ProductViewed] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductType]    Script Date: 7/30/2021 11:28:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductType](
	[ProductTypeID] [nchar](10) NOT NULL,
	[ProductTypeName] [nchar](50) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_ProductStatus]  DEFAULT ((0)) FOR [ProductStatus]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_ProductPrice]  DEFAULT ((0)) FOR [ProductPrice]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_ProductSellRecord]  DEFAULT ((0)) FOR [ProductSellRecord]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_ProductViewed]  DEFAULT ((0)) FOR [ProductViewed]
GO
USE [master]
GO
ALTER DATABASE [MobileShopOnline] SET  READ_WRITE 
GO
