
USE [master]
GO

IF  EXISTS (select * from sys.databases where name='Prueba_Tecnica')
BEGIN
	DROP DATABASE [Prueba_Tecnica]
END

/****** Object:  Database [Prueba_Tecnica]    Script Date: 21/02/2021 1:08:34 a. m. ******/
CREATE DATABASE [Prueba_Tecnica]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Prueba_Tecnica', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Prueba_Tecnica.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Prueba_Tecnica_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Prueba_Tecnica_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Prueba_Tecnica].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [Prueba_Tecnica] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [Prueba_Tecnica] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [Prueba_Tecnica] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [Prueba_Tecnica] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [Prueba_Tecnica] SET ARITHABORT OFF 
GO

ALTER DATABASE [Prueba_Tecnica] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [Prueba_Tecnica] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [Prueba_Tecnica] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [Prueba_Tecnica] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [Prueba_Tecnica] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [Prueba_Tecnica] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [Prueba_Tecnica] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [Prueba_Tecnica] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [Prueba_Tecnica] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [Prueba_Tecnica] SET  ENABLE_BROKER 
GO

ALTER DATABASE [Prueba_Tecnica] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [Prueba_Tecnica] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [Prueba_Tecnica] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [Prueba_Tecnica] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [Prueba_Tecnica] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [Prueba_Tecnica] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [Prueba_Tecnica] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [Prueba_Tecnica] SET RECOVERY FULL 
GO

ALTER DATABASE [Prueba_Tecnica] SET  MULTI_USER 
GO

ALTER DATABASE [Prueba_Tecnica] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [Prueba_Tecnica] SET DB_CHAINING OFF 
GO

ALTER DATABASE [Prueba_Tecnica] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [Prueba_Tecnica] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [Prueba_Tecnica] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [Prueba_Tecnica] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO

ALTER DATABASE [Prueba_Tecnica] SET QUERY_STORE = OFF
GO

ALTER DATABASE [Prueba_Tecnica] SET  READ_WRITE 
GO



USE [Prueba_Tecnica]
GO
/****** Object:  Trigger [TRG_I_INVENTARIOS]    Script Date: 17/05/2021 7:35:47 p. m. ******/
DROP TRIGGER IF EXISTS [dbo].[TRG_I_INVENTARIOS]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Movimientos]') AND type in (N'U'))
ALTER TABLE [dbo].[Movimientos] DROP CONSTRAINT IF EXISTS [FK_Movimientos_Clientes]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Movimientos]') AND type in (N'U'))
ALTER TABLE [dbo].[Movimientos] DROP CONSTRAINT IF EXISTS [FK_Movimientos_Catalogos]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Detalle_Movimientos]') AND type in (N'U'))
ALTER TABLE [dbo].[Detalle_Movimientos] DROP CONSTRAINT IF EXISTS [FK_Detalle_Movimientos_Movimientos]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Detalle_Movimientos]') AND type in (N'U'))
ALTER TABLE [dbo].[Detalle_Movimientos] DROP CONSTRAINT IF EXISTS [FK_Detalle_Movimientos_Inventarios]
GO
/****** Object:  Table [dbo].[Movimientos]    Script Date: 17/05/2021 7:35:47 p. m. ******/
DROP TABLE IF EXISTS [dbo].[Movimientos]
GO
/****** Object:  Table [dbo].[Inventarios]    Script Date: 17/05/2021 7:35:47 p. m. ******/
DROP TABLE IF EXISTS [dbo].[Inventarios]
GO
/****** Object:  Table [dbo].[Detalle_Movimientos]    Script Date: 17/05/2021 7:35:47 p. m. ******/
DROP TABLE IF EXISTS [dbo].[Detalle_Movimientos]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 17/05/2021 7:35:47 p. m. ******/
DROP TABLE IF EXISTS [dbo].[Clientes]
GO
/****** Object:  Table [dbo].[Catalogos]    Script Date: 17/05/2021 7:35:47 p. m. ******/
DROP TABLE IF EXISTS [dbo].[Catalogos]
GO
USE [master]
GO
/****** Object:  Database [Prueba_Tecnica]    Script Date: 17/05/2021 7:35:47 p. m. ******/
DROP DATABASE IF EXISTS [Prueba_Tecnica]
GO
/****** Object:  Database [Prueba_Tecnica]    Script Date: 17/05/2021 7:35:47 p. m. ******/
CREATE DATABASE [Prueba_Tecnica]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Prueba_Tecnica', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Prueba_Tecnica.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Prueba_Tecnica_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Prueba_Tecnica_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Prueba_Tecnica] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Prueba_Tecnica].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Prueba_Tecnica] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Prueba_Tecnica] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Prueba_Tecnica] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Prueba_Tecnica] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Prueba_Tecnica] SET ARITHABORT OFF 
GO
ALTER DATABASE [Prueba_Tecnica] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Prueba_Tecnica] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Prueba_Tecnica] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Prueba_Tecnica] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Prueba_Tecnica] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Prueba_Tecnica] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Prueba_Tecnica] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Prueba_Tecnica] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Prueba_Tecnica] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Prueba_Tecnica] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Prueba_Tecnica] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Prueba_Tecnica] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Prueba_Tecnica] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Prueba_Tecnica] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Prueba_Tecnica] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Prueba_Tecnica] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Prueba_Tecnica] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Prueba_Tecnica] SET RECOVERY FULL 
GO
ALTER DATABASE [Prueba_Tecnica] SET  MULTI_USER 
GO
ALTER DATABASE [Prueba_Tecnica] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Prueba_Tecnica] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Prueba_Tecnica] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Prueba_Tecnica] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Prueba_Tecnica] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Prueba_Tecnica] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Prueba_Tecnica', N'ON'
GO
ALTER DATABASE [Prueba_Tecnica] SET QUERY_STORE = OFF
GO
USE [Prueba_Tecnica]
GO
/****** Object:  Table [dbo].[Catalogos]    Script Date: 17/05/2021 7:35:48 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Catalogos](
	[Id_Elemento] [int] IDENTITY(1,1) NOT NULL,
	[Id_Grupo] [int] NOT NULL,
	[Descripcion] [varchar](250) NOT NULL,
 CONSTRAINT [PK_Catalogos] PRIMARY KEY CLUSTERED 
(
	[Id_Elemento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 17/05/2021 7:35:48 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[Id_Cliente] [int] IDENTITY(1,1) NOT NULL,
	[Numero_identificacion] [int] NOT NULL,
	[Tipo_Identificacion] [int] NOT NULL,
	[Nombre_completo] [nvarchar](250) NOT NULL,
	[Fecha_nacimiento] [date] NOT NULL,
 CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED 
(
	[Id_Cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Detalle_Movimientos]    Script Date: 17/05/2021 7:35:48 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Detalle_Movimientos](
	[Id_Detalle] [int] IDENTITY(1,1) NOT NULL,
	[Id_Movimiento] [int] NOT NULL,
	[Id_Item] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[Estado] [bit] NOT NULL,
 CONSTRAINT [PK_Detalle_Movimientos] PRIMARY KEY CLUSTERED 
(
	[Id_Detalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inventarios]    Script Date: 17/05/2021 7:35:48 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventarios](
	[Id_Item] [int] IDENTITY(1,1) NOT NULL,
	[Codigo_item] [int] NOT NULL,
	[Descripcion] [nvarchar](250) NOT NULL,
	[Cantidad_stock] [int] NOT NULL,
	[Stock_minimo] [int] NOT NULL,
	[Precio] [float] NOT NULL,
	[Fecha_actualizacion] [date] NOT NULL,
 CONSTRAINT [PK_Inventarios] PRIMARY KEY CLUSTERED 
(
	[Id_Item] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movimientos]    Script Date: 17/05/2021 7:35:48 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movimientos](
	[Id_Movimiento] [int] IDENTITY(1,1) NOT NULL,
	[Id_Cliente] [int] NOT NULL,
	[Fecha] [date] NOT NULL,
	[Total] [float] NOT NULL,
	[Estado] [bit] NOT NULL,
	[Tipo_movimiento] [int] NOT NULL,
 CONSTRAINT [PK_Movimientos] PRIMARY KEY CLUSTERED 
(
	[Id_Movimiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Catalogos] ON 

INSERT [dbo].[Catalogos] ([Id_Elemento], [Id_Grupo], [Descripcion]) VALUES (1, 1, N'Prueba')
INSERT [dbo].[Catalogos] ([Id_Elemento], [Id_Grupo], [Descripcion]) VALUES (2, 1, N'Elemento')
SET IDENTITY_INSERT [dbo].[Catalogos] OFF
GO
SET IDENTITY_INSERT [dbo].[Clientes] ON 

INSERT [dbo].[Clientes] ([Id_Cliente], [Numero_identificacion], [Tipo_Identificacion], [Nombre_completo], [Fecha_nacimiento]) VALUES (1, 123456789, 1, N'USUARIO PRUEBA', CAST(N'1985-08-16' AS Date))
INSERT [dbo].[Clientes] ([Id_Cliente], [Numero_identificacion], [Tipo_Identificacion], [Nombre_completo], [Fecha_nacimiento]) VALUES (2, 1122334455, 1, N'USUARIO PRUEBA INSERT', CAST(N'1986-11-07' AS Date))
SET IDENTITY_INSERT [dbo].[Clientes] OFF
GO
SET IDENTITY_INSERT [dbo].[Detalle_Movimientos] ON 

INSERT [dbo].[Detalle_Movimientos] ([Id_Detalle], [Id_Movimiento], [Id_Item], [Cantidad], [Estado]) VALUES (1, 1, 6, 20, 1)
INSERT [dbo].[Detalle_Movimientos] ([Id_Detalle], [Id_Movimiento], [Id_Item], [Cantidad], [Estado]) VALUES (2, 2, 6, 50, 1)
INSERT [dbo].[Detalle_Movimientos] ([Id_Detalle], [Id_Movimiento], [Id_Item], [Cantidad], [Estado]) VALUES (3, 3, 6, 25, 1)
INSERT [dbo].[Detalle_Movimientos] ([Id_Detalle], [Id_Movimiento], [Id_Item], [Cantidad], [Estado]) VALUES (4, 4, 8, 55, 1)
INSERT [dbo].[Detalle_Movimientos] ([Id_Detalle], [Id_Movimiento], [Id_Item], [Cantidad], [Estado]) VALUES (5, 5, 6, 5, 1)
SET IDENTITY_INSERT [dbo].[Detalle_Movimientos] OFF
GO
SET IDENTITY_INSERT [dbo].[Inventarios] ON 

INSERT [dbo].[Inventarios] ([Id_Item], [Codigo_item], [Descripcion], [Cantidad_stock], [Stock_minimo], [Precio], [Fecha_actualizacion]) VALUES (6, 12345, N'PRUEBA', 0, 5, 70000, CAST(N'2021-05-17' AS Date))
INSERT [dbo].[Inventarios] ([Id_Item], [Codigo_item], [Descripcion], [Cantidad_stock], [Stock_minimo], [Precio], [Fecha_actualizacion]) VALUES (7, 98765, N'PRUEBA 2', 100, 5, 80000, CAST(N'2021-01-01' AS Date))
INSERT [dbo].[Inventarios] ([Id_Item], [Codigo_item], [Descripcion], [Cantidad_stock], [Stock_minimo], [Precio], [Fecha_actualizacion]) VALUES (8, 129855, N'PRUEBA30', 145, 50, 95000, CAST(N'2021-05-17' AS Date))
INSERT [dbo].[Inventarios] ([Id_Item], [Codigo_item], [Descripcion], [Cantidad_stock], [Stock_minimo], [Precio], [Fecha_actualizacion]) VALUES (9, 111222, N'PRUEBA INSERT', 100, 5, 100000, CAST(N'2021-05-17' AS Date))
SET IDENTITY_INSERT [dbo].[Inventarios] OFF
GO
SET IDENTITY_INSERT [dbo].[Movimientos] ON 

INSERT [dbo].[Movimientos] ([Id_Movimiento], [Id_Cliente], [Fecha], [Total], [Estado], [Tipo_movimiento]) VALUES (1, 1, CAST(N'2021-05-17' AS Date), 1400000, 1, 1)
INSERT [dbo].[Movimientos] ([Id_Movimiento], [Id_Cliente], [Fecha], [Total], [Estado], [Tipo_movimiento]) VALUES (2, 1, CAST(N'2021-05-17' AS Date), 3500000, 1, 1)
INSERT [dbo].[Movimientos] ([Id_Movimiento], [Id_Cliente], [Fecha], [Total], [Estado], [Tipo_movimiento]) VALUES (3, 1, CAST(N'2021-05-17' AS Date), 1750000, 1, 1)
INSERT [dbo].[Movimientos] ([Id_Movimiento], [Id_Cliente], [Fecha], [Total], [Estado], [Tipo_movimiento]) VALUES (4, 1, CAST(N'2000-05-25' AS Date), 5225000, 1, 1)
INSERT [dbo].[Movimientos] ([Id_Movimiento], [Id_Cliente], [Fecha], [Total], [Estado], [Tipo_movimiento]) VALUES (5, 2, CAST(N'2000-02-01' AS Date), 1500000, 1, 1)
SET IDENTITY_INSERT [dbo].[Movimientos] OFF
GO
ALTER TABLE [dbo].[Detalle_Movimientos]  WITH CHECK ADD  CONSTRAINT [FK_Detalle_Movimientos_Inventarios] FOREIGN KEY([Id_Item])
REFERENCES [dbo].[Inventarios] ([Id_Item])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Detalle_Movimientos] CHECK CONSTRAINT [FK_Detalle_Movimientos_Inventarios]
GO
ALTER TABLE [dbo].[Detalle_Movimientos]  WITH CHECK ADD  CONSTRAINT [FK_Detalle_Movimientos_Movimientos] FOREIGN KEY([Id_Movimiento])
REFERENCES [dbo].[Movimientos] ([Id_Movimiento])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Detalle_Movimientos] CHECK CONSTRAINT [FK_Detalle_Movimientos_Movimientos]
GO
ALTER TABLE [dbo].[Movimientos]  WITH CHECK ADD  CONSTRAINT [FK_Movimientos_Catalogos] FOREIGN KEY([Tipo_movimiento])
REFERENCES [dbo].[Catalogos] ([Id_Elemento])
GO
ALTER TABLE [dbo].[Movimientos] CHECK CONSTRAINT [FK_Movimientos_Catalogos]
GO
ALTER TABLE [dbo].[Movimientos]  WITH CHECK ADD  CONSTRAINT [FK_Movimientos_Clientes] FOREIGN KEY([Id_Cliente])
REFERENCES [dbo].[Clientes] ([Id_Cliente])
GO
ALTER TABLE [dbo].[Movimientos] CHECK CONSTRAINT [FK_Movimientos_Clientes]
GO
/****** Object:  Trigger [dbo].[TRG_I_INVENTARIOS]    Script Date: 17/05/2021 7:35:48 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[TRG_I_INVENTARIOS]
    ON [dbo].[Detalle_Movimientos]
    FOR INSERT
    AS
    BEGIN
		SET NOCOUNT ON		
		UPDATE [dbo].[Inventarios]
		SET [Cantidad_stock] = (SELECT [Cantidad_stock] - (SELECT Cantidad FROM inserted))
		   ,[Fecha_actualizacion] = (SELECT GETDATE())
		WHERE [Id_Item] = (SELECT Id_Item FROM inserted)
	END
GO
ALTER TABLE [dbo].[Detalle_Movimientos] ENABLE TRIGGER [TRG_I_INVENTARIOS]
GO
USE [master]
GO
ALTER DATABASE [Prueba_Tecnica] SET  READ_WRITE 
GO
