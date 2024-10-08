USE [master]
GO
/****** Object:  Database [Wish]    Script Date: 11/29/2023 7:56:43 PM ******/
CREATE DATABASE [Wish]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Wish', FILENAME = N'F:\Workspace\CODE\SQL SERVER\MSSQL16.SQLEXPRESS\MSSQL\DATA\Wish.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Wish_log', FILENAME = N'F:\Workspace\CODE\SQL SERVER\MSSQL16.SQLEXPRESS\MSSQL\DATA\Wish_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Wish] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Wish].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Wish] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Wish] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Wish] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Wish] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Wish] SET ARITHABORT OFF 
GO
ALTER DATABASE [Wish] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Wish] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Wish] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Wish] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Wish] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Wish] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Wish] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Wish] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Wish] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Wish] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Wish] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Wish] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Wish] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Wish] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Wish] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Wish] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Wish] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Wish] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Wish] SET  MULTI_USER 
GO
ALTER DATABASE [Wish] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Wish] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Wish] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Wish] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Wish] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Wish] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Wish] SET QUERY_STORE = ON
GO
ALTER DATABASE [Wish] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Wish]
GO
/****** Object:  User [longmoi]    Script Date: 11/29/2023 7:56:43 PM ******/
CREATE USER [longmoi] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 11/29/2023 7:56:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[uID] [int] IDENTITY(1,1) NOT NULL,
	[user] [varchar](255) NULL,
	[pass] [varchar](255) NULL,
	[isSell] [int] NULL,
	[isAdmin] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[uID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 11/29/2023 7:56:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[cid] [int] NOT NULL,
	[cname] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[item]    Script Date: 11/29/2023 7:56:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[item](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
	[image] [nvarchar](max) NULL,
	[price] [money] NULL,
	[title] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[cateID] [int] NULL,
	[buy_ID] [int] NULL,
	[sell_ID] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order]    Script Date: 11/29/2023 7:56:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
	[image] [nvarchar](max) NULL,
	[price] [money] NULL,
	[title] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[cateID] [int] NULL,
	[namecustomer] [nvarchar](max) NULL,
	[phone] [nvarchar](max) NULL,
	[address] [nvarchar](max) NULL,
	[sell_ID] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 11/29/2023 7:56:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
	[image] [nvarchar](max) NULL,
	[price] [money] NULL,
	[title] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[cateID] [int] NULL,
	[sell_ID] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (1, N'Adam', N'123456', 1, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (2, N'Anjolie', N'SNZ6HE', 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (3, N'Ferris', N'RXH3XJ', 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (4, N'Katell', N'HWV8ZN', 0, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (5, N'Bruh', N'123456', 1, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (6, N'Conan', N'WIZ5VZ', 1, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (7, N'Cade', N'ZSW2LU', 1, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (8, N'Micah', N'RVV5SR', 0, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (9, N'Rowan', N'VAI6XR', 1, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (10, N'Kirby', N'DNX6JK', 1, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (11, N'Tanisha', N'XWU7JP', 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (12, N'Howard', N'TSR5MR', 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (13, N'Tana', N'EHS8CM', 0, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (14, N'Hadassah', N'YOY7ZW', 1, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (15, N'Echo', N'IGE8TN', 1, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (16, N'Slade', N'OFO6QS', 0, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (17, N'Devin', N'IBM6RZ', 1, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (18, N'Rowan', N'ZYS9VI', 1, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (19, N'Rafael', N'WZA0IH', 1, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (20, N'Madaline', N'QMW4EN', 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (21, N'Vera', N'CZB2VM', 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (22, N'Declan', N'ZKE7QZ', 1, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (23, N'Katell', N'SFS0IW', 1, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (24, N'Summer', N'PSQ7LC', 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (25, N'Robin', N'KIS9AF', 1, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (26, N'Dominique', N'IKV0IX', 0, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (27, N'admin', N'123', 1, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (28, N'mra', N'mra', 0, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (29, N'mrb', N'123', 0, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (30, N'Camden', N'123', 0, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (31, N'vtl', N'123', 1, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (32, N'vtl1', N'123', 0, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (33, N'vtl12', N'123', 0, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (34, N'vtl123', N'123', 0, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (35, N'datnd', N'123', 0, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (36, N'tuanlq', N'1', 0, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (37, N'tuanlq123', N'1', 0, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (38, N'khaitd', N'1', 0, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (39, N'datpv', N'1', 0, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (40, N'truongmv', N'1', 0, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (41, N'test', N'1', 0, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (42, N'test2', N'1', 0, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (43, N'tes3', N'1', 0, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (44, N'test3', N'1', 0, 0)
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
INSERT [dbo].[Category] ([cid], [cname]) VALUES (1, N'GIÀY ADIDAS')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (2, N'GIÀY NIKE')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (3, N'GIÀY BITI''S')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (4, N'GIÀY CONVERSE')
GO
SET IDENTITY_INSERT [dbo].[item] ON 

INSERT [dbo].[item] ([id], [name], [image], [price], [title], [description], [cateID], [buy_ID], [sell_ID]) VALUES (56, N'Air Jordan 1 low', N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/cd83452d-3a6c-4742-9129-3693e06a26e2/air-jordan-1-low-mens-shoes-z3Tl2VeJ.png', 100.0000, N'Air Jordan 1 low', N'Air Jordan 1 Low - sự kết hợp hoàn hảo giữa thiết kế thể thao và phong cách đường phố. Chất liệu da cao cấp và đế ngoài độc đáo mang lại cảm giác thoải mái và ổn định. Với logo Jumpman nổi tiếng, đây không chỉ là đôi giày, mà là biểu tượng của phong cách cá nhân. Sẵn sàng đồng hành cùng bạn từ phòng tập đến đường phố, Air Jordan 1 Low là sự lựa chọn hoàn hảo cho ngày hôm nay.', 1, 39, 31)
INSERT [dbo].[item] ([id], [name], [image], [price], [title], [description], [cateID], [buy_ID], [sell_ID]) VALUES (67, N'Air Jordan 1 low', N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/cd83452d-3a6c-4742-9129-3693e06a26e2/air-jordan-1-low-mens-shoes-z3Tl2VeJ.png', 100.0000, N'Air Jordan 1 low', N'Air Jordan 1 Low - sự kết hợp hoàn hảo giữa thiết kế thể thao và phong cách đường phố. Chất liệu da cao cấp và đế ngoài độc đáo mang lại cảm giác thoải mái và ổn định. Với logo Jumpman nổi tiếng, đây không chỉ là đôi giày, mà là biểu tượng của phong cách cá nhân. Sẵn sàng đồng hành cùng bạn từ phòng tập đến đường phố, Air Jordan 1 Low là sự lựa chọn hoàn hảo cho ngày hôm nay.', 1, 41, 31)
INSERT [dbo].[item] ([id], [name], [image], [price], [title], [description], [cateID], [buy_ID], [sell_ID]) VALUES (35, N'Nike Blazer Mid ''77 Vintage', N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/073bc8ed-d6c6-442b-a35d-bd53eb61ab78/blazer-mid-77-vintage-mens-shoes-nw30B2.png', 110.0000, N'Nike Blazer Mid ''77 Vintage', N'Trải nghiệm sự quay lại quá khứ với Nike Blazer Mid ''77 Vintage. Thiết kế retro và màu sắc tinh tế kết hợp cùng chất liệu da và đế giữa chống sốc, đôi giày này không chỉ là biểu tượng thời trang mà còn đem đến cảm giác thoải mái cho mọi bước đi. Sự hoàn hảo cho những người yêu thích phong cách cổ điển và hiện đại.', 1, 39, 31)
INSERT [dbo].[item] ([id], [name], [image], [price], [title], [description], [cateID], [buy_ID], [sell_ID]) VALUES (53, N'SB force 58', N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/459b3fa1-f96a-4985-b856-b6d33b299a82/sb-force-58-skate-shoes-Txk6xG.png', 130.0000, N'SB force 58', N'Bước vào thế giới đương đại với Nike SB Force 58. Với chất liệu da và vải, đôi giày này không chỉ nhẹ nhàng và thoải mái, mà còn thể hiện phong cách cá nhân của bạn. Thiết kế độc đáo kết hợp cùng đế giữa nhẹ và đế ngoài chống trơn, SB Force 58 là sự lựa chọn hoàn hảo cho những người yêu thích streetwear và đường phố.', 1, 37, 31)
INSERT [dbo].[item] ([id], [name], [image], [price], [title], [description], [cateID], [buy_ID], [sell_ID]) VALUES (68, N'Air Jordan 1 low', N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/cd83452d-3a6c-4742-9129-3693e06a26e2/air-jordan-1-low-mens-shoes-z3Tl2VeJ.png', 100.0000, N'Air Jordan 1 low', N'Air Jordan 1 Low - sự kết hợp hoàn hảo giữa thiết kế thể thao và phong cách đường phố. Chất liệu da cao cấp và đế ngoài độc đáo mang lại cảm giác thoải mái và ổn định. Với logo Jumpman nổi tiếng, đây không chỉ là đôi giày, mà là biểu tượng của phong cách cá nhân. Sẵn sàng đồng hành cùng bạn từ phòng tập đến đường phố, Air Jordan 1 Low là sự lựa chọn hoàn hảo cho ngày hôm nay.', 1, 42, 31)
INSERT [dbo].[item] ([id], [name], [image], [price], [title], [description], [cateID], [buy_ID], [sell_ID]) VALUES (55, N'Air Jordan 1 low', N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/cd83452d-3a6c-4742-9129-3693e06a26e2/air-jordan-1-low-mens-shoes-z3Tl2VeJ.png', 100.0000, N'Air Jordan 1 low', N'Air Jordan 1 Low - sự kết hợp hoàn hảo giữa thiết kế thể thao và phong cách đường phố. Chất liệu da cao cấp và đế ngoài độc đáo mang lại cảm giác thoải mái và ổn định. Với logo Jumpman nổi tiếng, đây không chỉ là đôi giày, mà là biểu tượng của phong cách cá nhân. Sẵn sàng đồng hành cùng bạn từ phòng tập đến đường phố, Air Jordan 1 Low là sự lựa chọn hoàn hảo cho ngày hôm nay.', 1, 39, 31)
INSERT [dbo].[item] ([id], [name], [image], [price], [title], [description], [cateID], [buy_ID], [sell_ID]) VALUES (51, N'Nike Blazer Mid ''77 Vintage', N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/889ef520-349a-49da-80d4-8d75f9651feb/blazer-mid-77-vintage-mens-shoes-nw30B2.png', 110.0000, N'Nike Blazer Mid ''77 Vintage', N'Trải nghiệm sự quay lại quá khứ với Nike Blazer Mid ''77 Vintage. Thiết kế retro và màu sắc tinh tế kết hợp cùng chất liệu da và đế giữa chống sốc, đôi giày này không chỉ là biểu tượng thời trang mà còn đem đến cảm giác thoải mái cho mọi bước đi. Sự hoàn hảo cho những người yêu thích phong cách cổ điển và hiện đại.', 1, 37, 31)
INSERT [dbo].[item] ([id], [name], [image], [price], [title], [description], [cateID], [buy_ID], [sell_ID]) VALUES (52, N'Air Jordan 1 low', N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/a3f4837b-678c-466c-b4fb-532b306dfb1e/air-jordan-1-low-mens-shoes-0LXhbn.png', 100.0000, N'Air Jordan 1 low', N'Air Jordan 1 Low - sự kết hợp hoàn hảo giữa thiết kế thể thao và phong cách đường phố. Chất liệu da cao cấp và đế ngoài độc đáo mang lại cảm giác thoải mái và ổn định. Với logo Jumpman nổi tiếng, đây không chỉ là đôi giày, mà là biểu tượng của phong cách cá nhân. Sẵn sàng đồng hành cùng bạn từ phòng tập đến đường phố, Air Jordan 1 Low là sự lựa chọn hoàn hảo cho ngày hôm nay.', 1, 37, 31)
INSERT [dbo].[item] ([id], [name], [image], [price], [title], [description], [cateID], [buy_ID], [sell_ID]) VALUES (34, N'Nike Blazer Mid ''77 Vintage', N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/38dc60ac-dd3b-4d11-8827-ed11b6b05e6b/blazer-mid-77-vintage-mens-shoes-nw30B2.png', 110.0000, N'Nike Blazer Mid ''77 Vintage', N'Trải nghiệm sự quay lại quá khứ với Nike Blazer Mid ''77 Vintage. Thiết kế retro và màu sắc tinh tế kết hợp cùng chất liệu da và đế giữa chống sốc, đôi giày này không chỉ là biểu tượng thời trang mà còn đem đến cảm giác thoải mái cho mọi bước đi. Sự hoàn hảo cho những người yêu thích phong cách cổ điển và hiện đại.', 1, 39, 31)
INSERT [dbo].[item] ([id], [name], [image], [price], [title], [description], [cateID], [buy_ID], [sell_ID]) VALUES (36, N'Air force 1', N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/350e7f3a-979a-402b-9396-a8a998dd76ab/air-force-1-07-mens-shoes-jBrhbr.png', 120.0000, N'Air force 1', N'Bước vào phong cách với Nike Air Force 1. Chất liệu da cao cấp và thiết kế đơn giản, đôi giày này là biểu tượng thời trang dễ kết hợp, đồng thời mang lại sự thoải mái và độ bền đáng tin cậy. Cho mọi hoạt động, Air Force 1 là sự lựa chọn hoàn hảo cho phong cách hàng ngày.', 1, 39, 31)
SET IDENTITY_INSERT [dbo].[item] OFF
GO
SET IDENTITY_INSERT [dbo].[order] ON 

INSERT [dbo].[order] ([id], [name], [image], [price], [title], [description], [cateID], [namecustomer], [phone], [address], [sell_ID]) VALUES (52, N'SB force 58', N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/16d16df9-aafe-45d0-8740-ffbf3b7c7d94/sb-force-58-skate-shoe-Txk6xG.png', 130.0000, N'SB force 58', N'Bước vào thế giới đương đại với Nike SB Force 58. Với chất liệu da và vải, đôi giày này không chỉ nhẹ nhàng và thoải mái, mà còn thể hiện phong cách cá nhân của bạn. Thiết kế độc đáo kết hợp cùng đế giữa nhẹ và đế ngoài chống trơn, SB Force 58 là sự lựa chọn hoàn hảo cho những người yêu thích streetwear và đường phố.', 1, N'vtl1', N'0346842376', N'Vĩnh Thọ- Hương Mạc- Từ Sơn- Bắc Ninh', 31)
INSERT [dbo].[order] ([id], [name], [image], [price], [title], [description], [cateID], [namecustomer], [phone], [address], [sell_ID]) VALUES (53, N'Air Jordan 1 low', N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/cd83452d-3a6c-4742-9129-3693e06a26e2/air-jordan-1-low-mens-shoes-z3Tl2VeJ.png', 100.0000, N'Air Jordan 1 low', N'Air Jordan 1 Low - sự kết hợp hoàn hảo giữa thiết kế thể thao và phong cách đường phố. Chất liệu da cao cấp và đế ngoài độc đáo mang lại cảm giác thoải mái và ổn định. Với logo Jumpman nổi tiếng, đây không chỉ là đôi giày, mà là biểu tượng của phong cách cá nhân. Sẵn sàng đồng hành cùng bạn từ phòng tập đến đường phố, Air Jordan 1 Low là sự lựa chọn hoàn hảo cho ngày hôm nay.', 1, N'vtl1', N'0346842376', N'Vĩnh Thọ- Hương Mạc- Từ Sơn- Bắc Ninh', 31)
INSERT [dbo].[order] ([id], [name], [image], [price], [title], [description], [cateID], [namecustomer], [phone], [address], [sell_ID]) VALUES (54, N'Air Jordan 1 low', N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/1e463dee-799d-4fba-9b32-0f7e0bb9d5f5/air-jordan-1-low-mens-shoes-0LXhbn.png', 100.0000, N'Air Jordan 1 low', N'Air Jordan 1 Low - sự kết hợp hoàn hảo giữa thiết kế thể thao và phong cách đường phố. Chất liệu da cao cấp và đế ngoài độc đáo mang lại cảm giác thoải mái và ổn định. Với logo Jumpman nổi tiếng, đây không chỉ là đôi giày, mà là biểu tượng của phong cách cá nhân. Sẵn sàng đồng hành cùng bạn từ phòng tập đến đường phố, Air Jordan 1 Low là sự lựa chọn hoàn hảo cho ngày hôm nay.', 1, N'vtl1', N'0346842376', N'Vĩnh Thọ- Hương Mạc- Từ Sơn- Bắc Ninh', 31)
SET IDENTITY_INSERT [dbo].[order] OFF
GO
SET IDENTITY_INSERT [dbo].[product] ON 

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (29, N'Air Jordan 1 low', N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/cd83452d-3a6c-4742-9129-3693e06a26e2/air-jordan-1-low-mens-shoes-z3Tl2VeJ.png', 100.0000, N'Air Jordan 1 low', N'Air Jordan 1 Low - sự kết hợp hoàn hảo giữa thiết kế thể thao và phong cách đường phố. Chất liệu da cao cấp và đế ngoài độc đáo mang lại cảm giác thoải mái và ổn định. Với logo Jumpman nổi tiếng, đây không chỉ là đôi giày, mà là biểu tượng của phong cách cá nhân. Sẵn sàng đồng hành cùng bạn từ phòng tập đến đường phố, Air Jordan 1 Low là sự lựa chọn hoàn hảo cho ngày hôm nay.', 1, 31)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (32, N'Air Jordan 1 low', N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/1e463dee-799d-4fba-9b32-0f7e0bb9d5f5/air-jordan-1-low-mens-shoes-0LXhbn.png', 100.0000, N'Air Jordan 1 low', N'Air Jordan 1 Low - sự kết hợp hoàn hảo giữa thiết kế thể thao và phong cách đường phố. Chất liệu da cao cấp và đế ngoài độc đáo mang lại cảm giác thoải mái và ổn định. Với logo Jumpman nổi tiếng, đây không chỉ là đôi giày, mà là biểu tượng của phong cách cá nhân. Sẵn sàng đồng hành cùng bạn từ phòng tập đến đường phố, Air Jordan 1 Low là sự lựa chọn hoàn hảo cho ngày hôm nay.', 1, 31)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (36, N'SB force 58', N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/16d16df9-aafe-45d0-8740-ffbf3b7c7d94/sb-force-58-skate-shoe-Txk6xG.png', 130.0000, N'SB force 58', N'Bước vào thế giới đương đại với Nike SB Force 58. Với chất liệu da và vải, đôi giày này không chỉ nhẹ nhàng và thoải mái, mà còn thể hiện phong cách cá nhân của bạn. Thiết kế độc đáo kết hợp cùng đế giữa nhẹ và đế ngoài chống trơn, SB Force 58 là sự lựa chọn hoàn hảo cho những người yêu thích streetwear và đường phố.', 1, 31)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (40, N'Nike Blazer Mid ''77 Vintage', N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/38dc60ac-dd3b-4d11-8827-ed11b6b05e6b/blazer-mid-77-vintage-mens-shoes-nw30B2.png', 110.0000, N'Nike Blazer Mid ''77 Vintage', N'Trải nghiệm sự quay lại quá khứ với Nike Blazer Mid ''77 Vintage. Thiết kế retro và màu sắc tinh tế kết hợp cùng chất liệu da và đế giữa chống sốc, đôi giày này không chỉ là biểu tượng thời trang mà còn đem đến cảm giác thoải mái cho mọi bước đi. Sự hoàn hảo cho những người yêu thích phong cách cổ điển và hiện đại.', 1, 31)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (41, N'Nike Blazer Mid ''77 Vintage', N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/073bc8ed-d6c6-442b-a35d-bd53eb61ab78/blazer-mid-77-vintage-mens-shoes-nw30B2.png', 110.0000, N'Nike Blazer Mid ''77 Vintage', N'Trải nghiệm sự quay lại quá khứ với Nike Blazer Mid ''77 Vintage. Thiết kế retro và màu sắc tinh tế kết hợp cùng chất liệu da và đế giữa chống sốc, đôi giày này không chỉ là biểu tượng thời trang mà còn đem đến cảm giác thoải mái cho mọi bước đi. Sự hoàn hảo cho những người yêu thích phong cách cổ điển và hiện đại.', 1, 31)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (34, N'Air force 1', N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/350e7f3a-979a-402b-9396-a8a998dd76ab/air-force-1-07-mens-shoes-jBrhbr.png', 120.0000, N'Air force 1', N'Bước vào phong cách với Nike Air Force 1. Chất liệu da cao cấp và thiết kế đơn giản, đôi giày này là biểu tượng thời trang dễ kết hợp, đồng thời mang lại sự thoải mái và độ bền đáng tin cậy. Cho mọi hoạt động, Air Force 1 là sự lựa chọn hoàn hảo cho phong cách hàng ngày.', NULL, 31)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (42, N'Nike Blazer Mid ''77 Vintage', N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/889ef520-349a-49da-80d4-8d75f9651feb/blazer-mid-77-vintage-mens-shoes-nw30B2.png', 110.0000, N'Nike Blazer Mid ''77 Vintage', N'Trải nghiệm sự quay lại quá khứ với Nike Blazer Mid ''77 Vintage. Thiết kế retro và màu sắc tinh tế kết hợp cùng chất liệu da và đế giữa chống sốc, đôi giày này không chỉ là biểu tượng thời trang mà còn đem đến cảm giác thoải mái cho mọi bước đi. Sự hoàn hảo cho những người yêu thích phong cách cổ điển và hiện đại.', 1, 31)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (31, N'Air Jordan 1 low', N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/a3f4837b-678c-466c-b4fb-532b306dfb1e/air-jordan-1-low-mens-shoes-0LXhbn.png', 100.0000, N'Air Jordan 1 low', N'Air Jordan 1 Low - sự kết hợp hoàn hảo giữa thiết kế thể thao và phong cách đường phố. Chất liệu da cao cấp và đế ngoài độc đáo mang lại cảm giác thoải mái và ổn định. Với logo Jumpman nổi tiếng, đây không chỉ là đôi giày, mà là biểu tượng của phong cách cá nhân. Sẵn sàng đồng hành cùng bạn từ phòng tập đến đường phố, Air Jordan 1 Low là sự lựa chọn hoàn hảo cho ngày hôm nay.', 1, 31)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (37, N'SB force 58', N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/459b3fa1-f96a-4985-b856-b6d33b299a82/sb-force-58-skate-shoes-Txk6xG.png', 130.0000, N'SB force 58', N'Bước vào thế giới đương đại với Nike SB Force 58. Với chất liệu da và vải, đôi giày này không chỉ nhẹ nhàng và thoải mái, mà còn thể hiện phong cách cá nhân của bạn. Thiết kế độc đáo kết hợp cùng đế giữa nhẹ và đế ngoài chống trơn, SB Force 58 là sự lựa chọn hoàn hảo cho những người yêu thích streetwear và đường phố.', 1, 31)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (33, N'Air force 1', N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/b7d9211c-26e7-431a-ac24-b0540fb3c00f/air-force-1-07-mens-shoes-jBrhbr.png', 120.0000, N'Air force 1', N'Bước vào phong cách với Nike Air Force 1. Chất liệu da cao cấp và thiết kế đơn giản, đôi giày này là biểu tượng thời trang dễ kết hợp, đồng thời mang lại sự thoải mái và độ bền đáng tin cậy. Cho mọi hoạt động, Air Force 1 là sự lựa chọn hoàn hảo cho phong cách hàng ngày.', NULL, 31)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (35, N'SB force 58', N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/30ceab71-d94b-4cef-a768-d41bef344002/sb-force-58-skate-shoes-Txk6xG.png', 130.0000, N'SB force 58', N'Bước vào thế giới đương đại với Nike SB Force 58. Với chất liệu da và vải, đôi giày này không chỉ nhẹ nhàng và thoải mái, mà còn thể hiện phong cách cá nhân của bạn. Thiết kế độc đáo kết hợp cùng đế giữa nhẹ và đế ngoài chống trơn, SB Force 58 là sự lựa chọn hoàn hảo cho những người yêu thích streetwear và đường phố.', 1, 31)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (38, N'SB force 58', N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/581035be-b752-458b-98d7-949757f7fd64/sb-force-58-skate-shoes-Txk6xG.png', 130.0000, N'SB force 58', N'Bước vào thế giới đương đại với Nike SB Force 58. Với chất liệu da và vải, đôi giày này không chỉ nhẹ nhàng và thoải mái, mà còn thể hiện phong cách cá nhân của bạn. Thiết kế độc đáo kết hợp cùng đế giữa nhẹ và đế ngoài chống trơn, SB Force 58 là sự lựa chọn hoàn hảo cho những người yêu thích streetwear và đường phố.', 1, 31)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (39, N'Nike Blazer Mid ''77 Vintage', N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/fb7eda3c-5ac8-4d05-a18f-1c2c5e82e36e/blazer-mid-77-vintage-mens-shoes-nw30B2.png', 110.0000, N'Nike Blazer Mid ''77 Vintage', N'Trải nghiệm sự quay lại quá khứ với Nike Blazer Mid ''77 Vintage. Thiết kế retro và màu sắc tinh tế kết hợp cùng chất liệu da và đế giữa chống sốc, đôi giày này không chỉ là biểu tượng thời trang mà còn đem đến cảm giác thoải mái cho mọi bước đi. Sự hoàn hảo cho những người yêu thích phong cách cổ điển và hiện đại.', 1, 31)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (30, N'Air Jordan 1 low', N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/cca60d56-a2db-4661-aec3-f0d1bba672f5/air-jordan-1-low-mens-shoes-0LXhbn.png', 100.0000, N'Air Jordan 1 Low - sự kết hợp hoàn hảo giữa thiết kế thể thao và phong cách đường phố. Chất liệu da cao cấp và đế ngoài độc đáo mang lại cảm giác thoải mái và ổn định. Với logo Jumpman nổi tiếng, đây không chỉ là đôi giày, mà là biểu tượng của phong cách cá nhân. Sẵn sàng đồng hành cùng bạn từ phòng tập đến đường phố, Air Jordan 1 Low là sự lựa chọn hoàn hảo cho ngày hôm nay.', N'Air Jordan 1 Low - sự kết hợp hoàn hảo giữa thiết kế thể thao và phong cách đường phố. Chất liệu da cao cấp và đế ngoài độc đáo mang lại cảm giác thoải mái và ổn định. Với logo Jumpman nổi tiếng, đây không chỉ là đôi giày, mà là biểu tượng của phong cách cá nhân. Sẵn sàng đồng hành cùng bạn từ phòng tập đến đường phố, Air Jordan 1 Low là sự lựa chọn hoàn hảo cho ngày hôm nay.', 1, 31)
SET IDENTITY_INSERT [dbo].[product] OFF
GO
USE [master]
GO
ALTER DATABASE [Wish] SET  READ_WRITE 
GO
