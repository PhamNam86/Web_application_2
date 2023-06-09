USE [master]
GO
/****** Object:  Database [quanlydogo]    Script Date: 1/9/2021 8:26:45 AM ******/
CREATE DATABASE [quanlydogo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'quanlydogo', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\quanlydogo.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'quanlydogo_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\quanlydogo_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [quanlydogo] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [quanlydogo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [quanlydogo] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [quanlydogo] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [quanlydogo] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [quanlydogo] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [quanlydogo] SET ARITHABORT OFF 
GO
ALTER DATABASE [quanlydogo] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [quanlydogo] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [quanlydogo] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [quanlydogo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [quanlydogo] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [quanlydogo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [quanlydogo] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [quanlydogo] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [quanlydogo] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [quanlydogo] SET  DISABLE_BROKER 
GO
ALTER DATABASE [quanlydogo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [quanlydogo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [quanlydogo] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [quanlydogo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [quanlydogo] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [quanlydogo] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [quanlydogo] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [quanlydogo] SET RECOVERY FULL 
GO
ALTER DATABASE [quanlydogo] SET  MULTI_USER 
GO
ALTER DATABASE [quanlydogo] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [quanlydogo] SET DB_CHAINING OFF 
GO
ALTER DATABASE [quanlydogo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [quanlydogo] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [quanlydogo] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'quanlydogo', N'ON'
GO
USE [quanlydogo]
GO
/****** Object:  Table [dbo].[customer]    Script Date: 1/9/2021 8:26:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[customer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](250) NULL,
	[adress] [nvarchar](255) NULL,
	[phone] [char](20) NULL,
 CONSTRAINT [PK__customer__3214EC27D1E76DA6] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[login]    Script Date: 1/9/2021 8:26:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[login](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[userName] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[role] [nchar](10) NULL,
 CONSTRAINT [PK_login] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[orderCus]    Script Date: 1/9/2021 8:26:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orderCus](
	[customerid] [int] NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[order_time] [datetime] NULL,
	[total_price] [decimal](16, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[product]    Script Date: 1/9/2021 8:26:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
	[price] [decimal](16, 0) NULL,
	[pricelive] [decimal](16, 0) NULL,
	[product_type] [nvarchar](50) NULL,
	[info] [text] NULL,
	[design_type] [nvarchar](50) NULL,
	[size] [char](50) NULL,
 CONSTRAINT [PK__product__3213E83F9DD18BDA] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[product_order]    Script Date: 1/9/2021 8:26:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_order](
	[productId] [int] NULL,
	[orderId] [int] NULL,
	[quantity] [int] NULL,
	[price] [decimal](16, 0) NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_product_order] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[stock]    Script Date: 1/9/2021 8:26:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[stock](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[address] [nvarchar](50) NULL,
	[phone] [char](20) NULL,
 CONSTRAINT [PK_stock] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[stock_product]    Script Date: 1/9/2021 8:26:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[stock_product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[stockId] [int] NULL,
	[productID] [int] NULL,
	[quantity] [int] NOT NULL,
	[orderProduct] [int] NULL,
	[timeStamp] [varchar](50) NULL,
 CONSTRAINT [PK_stock_product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[User]    Script Date: 1/9/2021 8:26:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[Name] [varchar](50) NULL,
	[Role] [varchar](50) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[product_viewall]    Script Date: 1/9/2021 8:26:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[product_viewall] AS
SELECT name,price,pricelive,product_type,info,design_type,size,quantity,addressStore
FROM product
INNER JOIN stock
ON product.id = stock.productid;
GO
SET IDENTITY_INSERT [dbo].[customer] ON 

INSERT [dbo].[customer] ([ID], [name], [adress], [phone]) VALUES (1, N'long huu', N'Ha Noi', N'0166970454          ')
INSERT [dbo].[customer] ([ID], [name], [adress], [phone]) VALUES (2, N'longlienha', N'Ha Noi', N'0166970457          ')
INSERT [dbo].[customer] ([ID], [name], [adress], [phone]) VALUES (3, N'longlienha', N'Hà Nội', N'0166970454          ')
INSERT [dbo].[customer] ([ID], [name], [adress], [phone]) VALUES (4, N'longlienha', N'liên hà', N'01669704541         ')
INSERT [dbo].[customer] ([ID], [name], [adress], [phone]) VALUES (5, N'longlienha1', N'liên hà đan phượng', N'0166970457          ')
INSERT [dbo].[customer] ([ID], [name], [adress], [phone]) VALUES (6, N'Thang', N'Thai Binh City', N'0912922656          ')
INSERT [dbo].[customer] ([ID], [name], [adress], [phone]) VALUES (9, N'longlienha2', N'lienha danphuong', N'0359416906          ')
SET IDENTITY_INSERT [dbo].[customer] OFF
SET IDENTITY_INSERT [dbo].[product] ON 

INSERT [dbo].[product] ([id], [name], [price], [pricelive], [product_type], [info], [design_type], [size]) VALUES (1, N'giường', CAST(5000000 AS Decimal(16, 0)), CAST(9000000 AS Decimal(16, 0)), N'giường', N'giuong dinh huong', N'giuong phan', N'2Mx2M                                             ')
INSERT [dbo].[product] ([id], [name], [price], [pricelive], [product_type], [info], [design_type], [size]) VALUES (2, N'Giường đinh hương', CAST(5000000 AS Decimal(16, 0)), CAST(9000000 AS Decimal(16, 0)), N'giường', N'giuong dinh huong', N'giuong phan', N'2Mx2M                                             ')
INSERT [dbo].[product] ([id], [name], [price], [pricelive], [product_type], [info], [design_type], [size]) VALUES (4, N'Giường Xoan Đào', CAST(5000000 AS Decimal(16, 0)), CAST(9000000 AS Decimal(16, 0)), N'giường', N'giuong xoan dao', N'giuong thang giat', N'2Mx2M                                             ')
INSERT [dbo].[product] ([id], [name], [price], [pricelive], [product_type], [info], [design_type], [size]) VALUES (5, N'Tủ', CAST(5000000 AS Decimal(16, 0)), CAST(10000000 AS Decimal(16, 0)), N'Tu', N'tu que', N'tu 2 buom', N'2Mx2M                                             ')
SET IDENTITY_INSERT [dbo].[product] OFF
SET IDENTITY_INSERT [dbo].[stock] ON 

INSERT [dbo].[stock] ([id], [name], [address], [phone]) VALUES (1, N'QuangLong', N'17 thanh nien', N'0912353069          ')
INSERT [dbo].[stock] ([id], [name], [address], [phone]) VALUES (2, N'TienThanh', N'5 cong lang', N'0123456789          ')
INSERT [dbo].[stock] ([id], [name], [address], [phone]) VALUES (3, N'TungHue', N'7 thanh cong', N'0123456789          ')
SET IDENTITY_INSERT [dbo].[stock] OFF
SET IDENTITY_INSERT [dbo].[stock_product] ON 

INSERT [dbo].[stock_product] ([id], [stockId], [productID], [quantity], [orderProduct], [timeStamp]) VALUES (11, 2, 2, 1, NULL, N'20210205')
INSERT [dbo].[stock_product] ([id], [stockId], [productID], [quantity], [orderProduct], [timeStamp]) VALUES (13, 1, 2, 1, NULL, N'20210205')
INSERT [dbo].[stock_product] ([id], [stockId], [productID], [quantity], [orderProduct], [timeStamp]) VALUES (14, 1, 1, 20, NULL, N'20210207')
INSERT [dbo].[stock_product] ([id], [stockId], [productID], [quantity], [orderProduct], [timeStamp]) VALUES (15, 3, 1, 10, NULL, N'20210207')
INSERT [dbo].[stock_product] ([id], [stockId], [productID], [quantity], [orderProduct], [timeStamp]) VALUES (16, 1, 4, 2, NULL, N'20210207')
INSERT [dbo].[stock_product] ([id], [stockId], [productID], [quantity], [orderProduct], [timeStamp]) VALUES (19, 1, 5, 20, NULL, N'20210207')
INSERT [dbo].[stock_product] ([id], [stockId], [productID], [quantity], [orderProduct], [timeStamp]) VALUES (22, 2, 5, 20, NULL, N'20210207')
SET IDENTITY_INSERT [dbo].[stock_product] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [UserName], [Password], [Name], [Role]) VALUES (1, N'admin', N'123456', N'admin', N'Admin')
SET IDENTITY_INSERT [dbo].[User] OFF
ALTER TABLE [dbo].[orderCus] ADD  DEFAULT (getdate()) FOR [order_time]
GO
ALTER TABLE [dbo].[orderCus]  WITH CHECK ADD  CONSTRAINT [FK__orderCus__custom__182C9B23] FOREIGN KEY([customerid])
REFERENCES [dbo].[customer] ([ID])
GO
ALTER TABLE [dbo].[orderCus] CHECK CONSTRAINT [FK__orderCus__custom__182C9B23]
GO
ALTER TABLE [dbo].[product_order]  WITH CHECK ADD  CONSTRAINT [FK__product_o__order__1BFD2C07] FOREIGN KEY([orderId])
REFERENCES [dbo].[orderCus] ([ID])
GO
ALTER TABLE [dbo].[product_order] CHECK CONSTRAINT [FK__product_o__order__1BFD2C07]
GO
ALTER TABLE [dbo].[product_order]  WITH CHECK ADD  CONSTRAINT [FK__product_o__produ__1B0907CE] FOREIGN KEY([productId])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[product_order] CHECK CONSTRAINT [FK__product_o__produ__1B0907CE]
GO
ALTER TABLE [dbo].[stock_product]  WITH CHECK ADD  CONSTRAINT [FK__stock_pro__produ__38996AB5] FOREIGN KEY([productID])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[stock_product] CHECK CONSTRAINT [FK__stock_pro__produ__38996AB5]
GO
ALTER TABLE [dbo].[stock_product]  WITH CHECK ADD  CONSTRAINT [FK__stock_pro__stock__37A5467C] FOREIGN KEY([stockId])
REFERENCES [dbo].[stock] ([id])
GO
ALTER TABLE [dbo].[stock_product] CHECK CONSTRAINT [FK__stock_pro__stock__37A5467C]
GO
ALTER TABLE [dbo].[product_order]  WITH CHECK ADD  CONSTRAINT [CK__product_o__price__1DE57479] CHECK  (([price]>=(0)))
GO
ALTER TABLE [dbo].[product_order] CHECK CONSTRAINT [CK__product_o__price__1DE57479]
GO
ALTER TABLE [dbo].[product_order]  WITH CHECK ADD  CONSTRAINT [CK__product_o__quant__1CF15040] CHECK  (([quantity]>=(0)))
GO
ALTER TABLE [dbo].[product_order] CHECK CONSTRAINT [CK__product_o__quant__1CF15040]
GO
USE [master]
GO
ALTER DATABASE [quanlydogo] SET  READ_WRITE 
GO
