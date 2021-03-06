USE [master]
GO
/****** Object:  Database [bd_minisuper]    Script Date: 4/10/2021 12:07:18 a. m. ******/
CREATE DATABASE [bd_minisuper]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'bd_minisuper', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\bd_minisuper.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'bd_minisuper_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\bd_minisuper_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [bd_minisuper] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [bd_minisuper].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [bd_minisuper] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [bd_minisuper] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [bd_minisuper] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [bd_minisuper] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [bd_minisuper] SET ARITHABORT OFF 
GO
ALTER DATABASE [bd_minisuper] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [bd_minisuper] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [bd_minisuper] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [bd_minisuper] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [bd_minisuper] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [bd_minisuper] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [bd_minisuper] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [bd_minisuper] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [bd_minisuper] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [bd_minisuper] SET  DISABLE_BROKER 
GO
ALTER DATABASE [bd_minisuper] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [bd_minisuper] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [bd_minisuper] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [bd_minisuper] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [bd_minisuper] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [bd_minisuper] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [bd_minisuper] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [bd_minisuper] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [bd_minisuper] SET  MULTI_USER 
GO
ALTER DATABASE [bd_minisuper] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [bd_minisuper] SET DB_CHAINING OFF 
GO
ALTER DATABASE [bd_minisuper] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [bd_minisuper] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [bd_minisuper] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [bd_minisuper] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [bd_minisuper] SET QUERY_STORE = OFF
GO
USE [bd_minisuper]
GO
/****** Object:  Table [dbo].[tbl_order]    Script Date: 4/10/2021 12:07:18 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[cantidadLess] [int] NOT NULL,
	[ProductoID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_productos]    Script Date: 4/10/2021 12:07:18 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_productos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Product_name] [nvarchar](50) NULL,
	[Quantity] [int] NULL,
	[Description] [nvarchar](80) NULL,
	[UnitPrice] [int] NULL,
	[Imagen] [image] NULL,
 CONSTRAINT [PK_tbl_productos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[tbl_order]  WITH CHECK ADD FOREIGN KEY([ProductoID])
REFERENCES [dbo].[tbl_productos] ([Id])
GO
/****** Object:  StoredProcedure [dbo].[AddOrder]    Script Date: 4/10/2021 12:07:18 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddOrder]
@CantidadLess int,
@IdProducto int
AS
BEGIN
	INSERT INTO tbl_order (cantidadLess,ProductoID)
	VALUES(@CantidadLess, @IdProducto)
END
GO
/****** Object:  StoredProcedure [dbo].[AddProducts]    Script Date: 4/10/2021 12:07:18 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[AddProducts]
@Product_name nvarchar(50),
@Quantity int,
@Description nvarchar(80),
@UnitPrice int, 
@Image image
AS
BEGIN
insert into tbl_productos(Product_name, Quantity, Description,UnitPrice, Imagen)
values(@Product_name, @Quantity, @Description,@UnitPrice, @Image)
end
GO
/****** Object:  StoredProcedure [dbo].[GetAllProducts]    Script Date: 4/10/2021 12:07:18 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllProducts]
AS
Begin
	SELECT Id, Product_name, Quantity, Description, UnitPrice, Imagen from tbl_productos ORDER BY Id ASC
END
GO
/****** Object:  StoredProcedure [dbo].[GetOrderBuy]    Script Date: 4/10/2021 12:07:18 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Script for SelectTopNRows command from SSMS  ******/
CREATE PROCEDURE [dbo].[GetOrderBuy]
AS
BEGIN
	SELECT tbl_productos.Product_name,tbl_productos.Description, tbl_order.cantidadLess, tbl_productos.UnitPrice
FROM tbl_order
INNER JOIN  tbl_productos ON tbl_order.ProductoID = tbl_productos.Id;
END
GO
/****** Object:  StoredProcedure [dbo].[GetProductByID]    Script Date: 4/10/2021 12:07:18 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetProductByID]
	@Id int
AS
BEGIN
	SELECT Product_name,Quantity,Description,UnitPrice, Imagen FROM tbl_productos Where Id = @Id
END
GO
USE [master]
GO
ALTER DATABASE [bd_minisuper] SET  READ_WRITE 
GO
