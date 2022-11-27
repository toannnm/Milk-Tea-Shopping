USE [master]
CREATE DATABASE [PROJECT_PRJ]
GO
GO
USE [PROJECT_PRJ]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsers](
	[userID] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[password] [varchar](50) NULL,
	[phone] [Nvarchar](50) NOT NULL,
	[address] [nvarchar](50) NOT NULL,
    [email] [nvarchar](50) NOT NULL,
    [roleID] [nvarchar](50) NOT NULL
 CONSTRAINT [PK_tblUsers] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRoles](
    [roleID] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NOT NULL
 CONSTRAINT [PK_tblRoles] PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrder](
	[orderID] int NOT NULL identity(1,1),
	[userID] [nvarchar](50) NOT NULL,
    [date] [date] NOT NULL,
    [total] [int] NOT NULL
 CONSTRAINT [PK_tblOrder] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProduct](
	[productID] [nvarchar](50) NOT NULL,
    [name] [nvarchar](50) NOT NULL,
	[price] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[image] [ntext] NULL,
	[categoryID] [nvarchar](50) NOT NULL
 CONSTRAINT [PK_tblProduct] PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderDetail](
	[detailID] int identity(1,1) NOT NULL,
	[orderID]  int NOT NULL,
    [productID] [nvarchar](50) NOT NULL,
    [name] [nvarchar](50) NOT NULL,
	[price] [int] NOT NULL,
	[image] [ntext] NULL,
	[quantity] [int] NOT NULL
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[detailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategories](
	[categoryID] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NOT NULL
 CONSTRAINT [PK_categories] PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

INSERT [dbo].[tblUsers] ([userID], [name], [password], [phone], [address], [email], [roleID]) VALUES (N'admin', N'Toi la admin', N'1', N'0912321230', N'TPHCM', N'admin@gmail.com', N'AD' )
INSERT [dbo].[tblUsers] ([userID], [name], [password], [phone], [address], [email], [roleID]) VALUES (N'SE160644', N'Ngo Ha Tri Bao', N'123', N'0912344630', N'HaNoi', N'abcd@gmail.com', N'US' )
INSERT [dbo].[tblUsers] ([userID], [name], [password], [phone], [address], [email], [roleID]) VALUES (N'SE160655', N'Phuoc Ha', N'1123', N'0912371260', N'HaiPhong', N'adssn@gmail.com', N'US' )
INSERT [dbo].[tblUsers] ([userID], [name], [password], [phone], [address], [email], [roleID]) VALUES (N'SE160666', N'Tam Tran', N'1122', N'0912381140', N'GiaLai', N'aasd@gmail.com', N'US' )
INSERT [dbo].[tblUsers] ([userID], [name], [password], [phone], [address], [email], [roleID]) VALUES (N'SE160653', N'Nguyen Huu Tin', N'145', N'0913345230', N'VungTau', N'asdasd@gmail.com', N'US' )

INSERT [dbo].[tblRoles] ([roleID], [name]) VALUES (N'AD', N'ADMIN' )
INSERT [dbo].[tblRoles] ([roleID], [name]) VALUES (N'US', N'USER' )

INSERT [dbo].[tblProduct] ([productID], [name], [price], [quantity] ,[image], [categoryID]) VALUES (N'T001', N'Trà sữa trân châu đường đen',40000,70,N'image\trasua1.jpg',N'A')
INSERT [dbo].[tblProduct] ([productID], [name], [price], [quantity] ,[image], [categoryID]) VALUES (N'T002', N'Trà sữa matcha',38000,40,N'image\matcha.jpg',N'A')
INSERT [dbo].[tblProduct] ([productID], [name], [price], [quantity] ,[image], [categoryID]) VALUES (N'T003', N'Trà sữa hoa đậu biếc ',32000,50,N'image\hoadaubiec.png',N'A')
INSERT [dbo].[tblProduct] ([productID], [name], [price], [quantity] ,[image], [categoryID]) VALUES (N'T004', N'Trà sữa socola',33000,40,N'image\socola.jpg',N'B')
INSERT [dbo].[tblProduct] ([productID], [name], [price], [quantity] ,[image], [categoryID]) VALUES (N'T005', N'Trà sữa khoai môn',44000,79,N'image\khoaimon.jpg',N'B')
INSERT [dbo].[tblProduct] ([productID], [name], [price], [quantity] ,[image], [categoryID]) VALUES (N'T006', N'Trà sữa việt quất',45000,80,N'image\vietquat.jpg',N'B')
INSERT [dbo].[tblProduct] ([productID], [name], [price], [quantity] ,[image], [categoryID]) VALUES (N'T007', N'Trà sữa kiwi',50000,90,N'image\kiwi.jpg',N'B')
INSERT [dbo].[tblProduct] ([productID], [name], [price], [quantity] ,[image], [categoryID]) VALUES (N'T008', N'Trà sữa the way',55000,100,N'image\theway.jpg',N'C')
INSERT [dbo].[tblProduct] ([productID], [name], [price], [quantity] ,[image], [categoryID]) VALUES (N'T009', N'Trà sữa vani',65000,67,N'image\vani.jpg',N'C')
INSERT [dbo].[tblProduct] ([productID], [name], [price], [quantity] ,[image], [categoryID]) VALUES (N'T010', N'Trà sữa hokkaido',55000,76,N'image\hokkaido.jpg',N'C')


INSERT [dbo].[tblCategories] ([categoryID], [name]) VALUES (N'A', N'Trân châu đường đen' )
INSERT [dbo].[tblCategories] ([categoryID], [name]) VALUES (N'B', N'Trà sữa truyền thống' )
INSERT [dbo].[tblCategories] ([categoryID], [name]) VALUES (N'C', N'Trà sữa đặc biệt' )








ALTER TABLE [dbo].[tblUsers]  WITH CHECK ADD  CONSTRAINT [FK_tblUsers_tblRoles] FOREIGN KEY([roleID])
REFERENCES [dbo].[tblRoles] ([roleID])
GO
ALTER TABLE [dbo].[tblUsers] CHECK CONSTRAINT [FK_tblUsers_tblRoles]
GO
ALTER TABLE [dbo].[tblOrder]  WITH CHECK ADD  CONSTRAINT [FK_tblOrders_tblUsers] FOREIGN KEY([userID])
REFERENCES [dbo].[tblUsers] ([userID])
GO
ALTER TABLE [dbo].[tblOrder] CHECK CONSTRAINT [FK_tblOrders_tblUsers]
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetail_tblOrder] FOREIGN KEY([orderID])
REFERENCES [dbo].[tblOrder] ([orderID])
GO
ALTER TABLE [dbo].[tblOrderDetail] CHECK CONSTRAINT [FK_tblOrderDetail_tblOrder]
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetail_tblProduct] FOREIGN KEY([productID])
REFERENCES [dbo].[tblProduct] ([productID])
GO
ALTER TABLE [dbo].[tblOrderDetail] CHECK CONSTRAINT [FK_tblOrderDetail_tblProduct]
GO
ALTER TABLE [dbo].[tblProduct]  WITH CHECK ADD  CONSTRAINT [FK_Product_tblCategories] FOREIGN KEY([categoryID])
REFERENCES [dbo].[tblCategories] ([categoryID])
GO
ALTER TABLE [dbo].[tblProduct] CHECK CONSTRAINT [FK_Product_tblCategories]
GO




