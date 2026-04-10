USE [master]
GO
/****** Object:  Database [serviqo_s_df]    Script Date: 4/11/2026 2:32:44 AM ******/
CREATE DATABASE [serviqo_s_df]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'serviqo_s_df', FILENAME = N'E:\SQL Server\MSSQL17.SQLEXPRESS\MSSQL\DATA\serviqo_s_df.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'serviqo_s_df_log', FILENAME = N'E:\SQL Server\MSSQL17.SQLEXPRESS\MSSQL\DATA\serviqo_s_df_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [serviqo_s_df] SET COMPATIBILITY_LEVEL = 170
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [serviqo_s_df].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [serviqo_s_df] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [serviqo_s_df] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [serviqo_s_df] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [serviqo_s_df] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [serviqo_s_df] SET ARITHABORT OFF 
GO
ALTER DATABASE [serviqo_s_df] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [serviqo_s_df] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [serviqo_s_df] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [serviqo_s_df] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [serviqo_s_df] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [serviqo_s_df] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [serviqo_s_df] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [serviqo_s_df] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [serviqo_s_df] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [serviqo_s_df] SET  DISABLE_BROKER 
GO
ALTER DATABASE [serviqo_s_df] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [serviqo_s_df] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [serviqo_s_df] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [serviqo_s_df] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [serviqo_s_df] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [serviqo_s_df] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [serviqo_s_df] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [serviqo_s_df] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [serviqo_s_df] SET  MULTI_USER 
GO
ALTER DATABASE [serviqo_s_df] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [serviqo_s_df] SET DB_CHAINING OFF 
GO
ALTER DATABASE [serviqo_s_df] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [serviqo_s_df] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [serviqo_s_df] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [serviqo_s_df] SET OPTIMIZED_LOCKING = OFF 
GO
ALTER DATABASE [serviqo_s_df] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [serviqo_s_df] SET QUERY_STORE = ON
GO
ALTER DATABASE [serviqo_s_df] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [serviqo_s_df]
GO
/****** Object:  User [docker_user]    Script Date: 4/11/2026 2:32:46 AM ******/
CREATE USER [docker_user] FOR LOGIN [docker_user] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [docker_user]
GO
/****** Object:  Table [dbo].[categories]    Script Date: 4/11/2026 2:32:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categories](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[description] [nvarchar](max) NULL,
	[created_at] [datetime2](7) NULL,
	[updated_at] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customers]    Script Date: 4/11/2026 2:32:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customers](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[fname] [nvarchar](255) NOT NULL,
	[lname] [nvarchar](255) NOT NULL,
	[dob] [date] NULL,
	[email] [nvarchar](255) NOT NULL,
	[phone] [nvarchar](255) NULL,
	[password] [nvarchar](255) NOT NULL,
	[address] [nvarchar](255) NULL,
	[city] [nvarchar](255) NOT NULL,
	[region] [nvarchar](255) NULL,
	[date_registered] [datetime2](7) NOT NULL,
	[preferred_payment_method] [nvarchar](255) NULL,
	[created_at] [datetime2](7) NULL,
	[updated_at] [datetime2](7) NULL,
	[role] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[failed_jobs]    Script Date: 4/11/2026 2:32:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[failed_jobs](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[uuid] [nvarchar](255) NOT NULL,
	[connection] [nvarchar](max) NOT NULL,
	[queue] [nvarchar](max) NOT NULL,
	[payload] [nvarchar](max) NOT NULL,
	[exception] [nvarchar](max) NOT NULL,
	[failed_at] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[migrations]    Script Date: 4/11/2026 2:32:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[migrations](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[migration] [nvarchar](255) NOT NULL,
	[batch] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[notifications]    Script Date: 4/11/2026 2:32:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[notifications](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[customer_id] [bigint] NOT NULL,
	[title] [nvarchar](255) NOT NULL,
	[message] [nvarchar](max) NOT NULL,
	[is_read] [bit] NULL,
	[created_at] [datetime2](7) NULL,
	[updated_at] [datetime2](7) NULL,
	[service_order_id] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_confirmations]    Script Date: 4/11/2026 2:32:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_confirmations](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[service_order_id] [bigint] NOT NULL,
	[confirmation_status] [nvarchar](255) NULL,
	[final_amount] [decimal](10, 2) NOT NULL,
	[confirmed_at] [datetime2](7) NOT NULL,
	[notes] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_items]    Script Date: 4/11/2026 2:32:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_items](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[service_order_id] [bigint] NOT NULL,
	[service_provider_offering_id] [bigint] NOT NULL,
	[quantity] [int] NULL,
	[item_price] [decimal](10, 2) NOT NULL,
	[item_status] [nvarchar](255) NULL,
	[created_at] [datetime2](7) NULL,
	[updated_at] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[password_reset_tokens]    Script Date: 4/11/2026 2:32:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[password_reset_tokens](
	[email] [nvarchar](255) NOT NULL,
	[token] [nvarchar](255) NOT NULL,
	[created_at] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[payments]    Script Date: 4/11/2026 2:32:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[payments](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[service_order_id] [bigint] NOT NULL,
	[payment_method] [nvarchar](255) NOT NULL,
	[payment_datetime] [datetime2](7) NOT NULL,
	[transaction_reference] [nvarchar](255) NULL,
	[created_at] [datetime2](7) NULL,
	[updated_at] [datetime2](7) NULL,
	[payable_amount] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[personal_access_tokens]    Script Date: 4/11/2026 2:32:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[personal_access_tokens](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[tokenable_type] [nvarchar](255) NOT NULL,
	[tokenable_id] [bigint] NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[token] [nvarchar](64) NOT NULL,
	[abilities] [nvarchar](max) NULL,
	[last_used_at] [datetime2](7) NULL,
	[expires_at] [datetime2](7) NULL,
	[created_at] [datetime2](7) NULL,
	[updated_at] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ratings_reviews]    Script Date: 4/11/2026 2:32:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ratings_reviews](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[customer_id] [bigint] NOT NULL,
	[service_provider_id] [bigint] NOT NULL,
	[service_order_id] [bigint] NOT NULL,
	[rating] [int] NOT NULL,
	[review_date] [date] NOT NULL,
	[review_notes] [nvarchar](max) NULL,
	[created_at] [datetime2](7) NULL,
	[updated_at] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[service_areas]    Script Date: 4/11/2026 2:32:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[service_areas](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[city_name] [nvarchar](255) NOT NULL,
	[area_name] [nvarchar](255) NOT NULL,
	[postal_code] [nvarchar](255) NULL,
	[created_at] [datetime2](7) NULL,
	[updated_at] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[service_orders]    Script Date: 4/11/2026 2:32:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[service_orders](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[customer_id] [bigint] NOT NULL,
	[status] [nvarchar](255) NULL,
	[total_amount] [decimal](10, 2) NULL,
	[payment_status] [nvarchar](255) NULL,
	[order_datetime] [datetime2](7) NOT NULL,
	[scheduled_datetime] [datetime2](7) NULL,
	[created_at] [datetime2](7) NULL,
	[updated_at] [datetime2](7) NULL,
	[city_name] [nvarchar](255) NULL,
	[area_name] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[service_provider_offerings]    Script Date: 4/11/2026 2:32:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[service_provider_offerings](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[service_provider_id] [bigint] NOT NULL,
	[sub_service_id] [bigint] NOT NULL,
	[price_charged] [decimal](10, 2) NOT NULL,
	[rating] [decimal](3, 2) NULL,
	[created_at] [datetime2](7) NULL,
	[updated_at] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[service_providers]    Script Date: 4/11/2026 2:32:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[service_providers](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[full_name] [nvarchar](255) NOT NULL,
	[email] [nvarchar](255) NOT NULL,
	[phone] [nvarchar](255) NOT NULL,
	[address] [nvarchar](255) NULL,
	[city] [nvarchar](255) NOT NULL,
	[rating] [decimal](3, 2) NULL,
	[nid] [nvarchar](255) NOT NULL,
	[service_area_id] [bigint] NOT NULL,
	[created_at] [datetime2](7) NULL,
	[updated_at] [datetime2](7) NULL,
	[region] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sub_services]    Script Date: 4/11/2026 2:32:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sub_services](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[service_name] [nvarchar](255) NOT NULL,
	[description] [nvarchar](max) NULL,
	[category_id] [bigint] NOT NULL,
	[created_at] [datetime2](7) NULL,
	[updated_at] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 4/11/2026 2:32:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[email] [nvarchar](255) NOT NULL,
	[email_verified_at] [datetime2](7) NULL,
	[password] [nvarchar](255) NOT NULL,
	[remember_token] [nvarchar](100) NULL,
	[created_at] [datetime2](7) NULL,
	[updated_at] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[categories] ON 

INSERT [dbo].[categories] ([id], [name], [description], [created_at], [updated_at]) VALUES (1, N'General Services', N'System Auto Category', CAST(N'2026-04-02T07:12:27.8590000' AS DateTime2), CAST(N'2026-04-02T07:12:27.8590000' AS DateTime2))
INSERT [dbo].[categories] ([id], [name], [description], [created_at], [updated_at]) VALUES (2, N'Cleaning Services', N'', CAST(N'2026-04-04T16:17:20.5640000' AS DateTime2), CAST(N'2026-04-04T16:17:20.5640000' AS DateTime2))
INSERT [dbo].[categories] ([id], [name], [description], [created_at], [updated_at]) VALUES (3, N'Appliance Repair', N'', CAST(N'2026-04-04T16:17:20.7000000' AS DateTime2), CAST(N'2026-04-04T16:17:20.7000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[categories] OFF
GO
SET IDENTITY_INSERT [dbo].[customers] ON 

INSERT [dbo].[customers] ([id], [fname], [lname], [dob], [email], [phone], [password], [address], [city], [region], [date_registered], [preferred_payment_method], [created_at], [updated_at], [role]) VALUES (1, N'first', N'user', CAST(N'2008-03-01' AS Date), N'firstuser@gmail.com', N'01334567891', N'$2y$12$cWQcwRWh5MjrpYjA55I0a.RlDOGdrt.mISg3qW/XCVRNdJcK4Zj8y', N'abc 123', N'Sylhet', N'Noyashahar', CAST(N'2026-03-29T00:00:01.7300000' AS DateTime2), NULL, CAST(N'2026-03-28T18:00:01.7130000' AS DateTime2), CAST(N'2026-03-28T18:39:39.3130000' AS DateTime2), N'user')
INSERT [dbo].[customers] ([id], [fname], [lname], [dob], [email], [phone], [password], [address], [city], [region], [date_registered], [preferred_payment_method], [created_at], [updated_at], [role]) VALUES (2, N'Second', N'User', CAST(N'2008-03-22' AS Date), N'seconduser@email.com', N'01456789234', N'$2y$12$naExoxNhXNe5fozaKuof2unG1OIZJCT1AlsjQYRhYvK.VQTBZuMea', N'xyz', N'Rajshahi', N'Durgapur', CAST(N'2026-03-29T01:04:07.5333333' AS DateTime2), NULL, CAST(N'2026-03-28T19:04:07.4720000' AS DateTime2), CAST(N'2026-03-28T19:18:38.4870000' AS DateTime2), N'user')
INSERT [dbo].[customers] ([id], [fname], [lname], [dob], [email], [phone], [password], [address], [city], [region], [date_registered], [preferred_payment_method], [created_at], [updated_at], [role]) VALUES (3, N'Admin', N'User', NULL, N'admin@example.com', NULL, N'$2y$12$KI45Erlji7724hgc/.OJ2OCDBL4DZIxlvLhItteVbkKU9gtBvYEoS', NULL, N'Dhaka', NULL, CAST(N'2026-04-02T22:57:37.3700000' AS DateTime2), NULL, NULL, CAST(N'2026-04-02T19:20:27.2870000' AS DateTime2), N'admin')
INSERT [dbo].[customers] ([id], [fname], [lname], [dob], [email], [phone], [password], [address], [city], [region], [date_registered], [preferred_payment_method], [created_at], [updated_at], [role]) VALUES (4, N'fourth', N'user', CAST(N'2008-03-31' AS Date), N'fourthuser@gmail.co', N'01456789234', N'$2y$12$PBw4VMRA8cJYlS6dw8gTYuVOw8mgVrrs5gepzojrR80zz9eL6oc.u', N'xyz', N'Rangpur', N'Pirgachha', CAST(N'2026-04-03T02:56:13.1400000' AS DateTime2), NULL, CAST(N'2026-04-02T20:56:13.0420000' AS DateTime2), CAST(N'2026-04-02T20:56:13.0420000' AS DateTime2), N'user')
INSERT [dbo].[customers] ([id], [fname], [lname], [dob], [email], [phone], [password], [address], [city], [region], [date_registered], [preferred_payment_method], [created_at], [updated_at], [role]) VALUES (5, N'docker', N'user', CAST(N'2008-04-01' AS Date), N'dockeruser@email.com', N'01892324567', N'$2y$12$33k.QxpWraRU5gIFAnQY2eySS7DBPC2YCTceEXhEM/ncgGPhHmwbK', N'xqz', N'Rangpur', N'Badarganj', CAST(N'2026-04-04T19:20:19.0333333' AS DateTime2), NULL, CAST(N'2026-04-04T13:20:18.9900000' AS DateTime2), CAST(N'2026-04-04T13:20:18.9900000' AS DateTime2), N'user')
INSERT [dbo].[customers] ([id], [fname], [lname], [dob], [email], [phone], [password], [address], [city], [region], [date_registered], [preferred_payment_method], [created_at], [updated_at], [role]) VALUES (6, N'Zahin', N'Zia', CAST(N'2007-11-07' AS Date), N'zahinzia@gmail.com', N'01456789234', N'$2y$12$4JwmbpHfDfsMAMxiJyl0OuMmqQCjLEeisCKXKRZhJNhGOUnwpaYXi', N'xyz', N'Dhaka', N'Tejgaon', CAST(N'2026-04-05T09:27:31.5433333' AS DateTime2), NULL, CAST(N'2026-04-05T03:27:31.4890000' AS DateTime2), CAST(N'2026-04-05T03:27:31.4890000' AS DateTime2), N'user')
SET IDENTITY_INSERT [dbo].[customers] OFF
GO
SET IDENTITY_INSERT [dbo].[notifications] ON 

INSERT [dbo].[notifications] ([id], [customer_id], [title], [message], [is_read], [created_at], [updated_at], [service_order_id]) VALUES (1, 1, N'Order Confirmed', N'Your order #17 has been approved and confirmed.', 1, CAST(N'2026-04-10T15:22:23.8240000' AS DateTime2), CAST(N'2026-04-10T15:25:22.8230000' AS DateTime2), 17)
INSERT [dbo].[notifications] ([id], [customer_id], [title], [message], [is_read], [created_at], [updated_at], [service_order_id]) VALUES (2, 1, N'Order Confirmed', N'Your order #18 has been approved and confirmed.', 1, CAST(N'2026-04-10T16:22:51.4320000' AS DateTime2), CAST(N'2026-04-10T19:52:55.8790000' AS DateTime2), 18)
SET IDENTITY_INSERT [dbo].[notifications] OFF
GO
SET IDENTITY_INSERT [dbo].[order_confirmations] ON 

INSERT [dbo].[order_confirmations] ([id], [service_order_id], [confirmation_status], [final_amount], [confirmed_at], [notes]) VALUES (1, 1, N'confirmed', CAST(50.00 AS Decimal(10, 2)), CAST(N'2026-04-02T07:12:28.0230000' AS DateTime2), NULL)
INSERT [dbo].[order_confirmations] ([id], [service_order_id], [confirmation_status], [final_amount], [confirmed_at], [notes]) VALUES (2, 2, N'confirmed', CAST(50.00 AS Decimal(10, 2)), CAST(N'2026-04-02T22:27:44.3940000' AS DateTime2), NULL)
INSERT [dbo].[order_confirmations] ([id], [service_order_id], [confirmation_status], [final_amount], [confirmed_at], [notes]) VALUES (3, 3, N'confirmed', CAST(50.00 AS Decimal(10, 2)), CAST(N'2026-04-02T23:17:57.3410000' AS DateTime2), NULL)
INSERT [dbo].[order_confirmations] ([id], [service_order_id], [confirmation_status], [final_amount], [confirmed_at], [notes]) VALUES (4, 4, N'confirmed', CAST(50.00 AS Decimal(10, 2)), CAST(N'2026-04-04T16:09:24.5700000' AS DateTime2), NULL)
INSERT [dbo].[order_confirmations] ([id], [service_order_id], [confirmation_status], [final_amount], [confirmed_at], [notes]) VALUES (5, 5, N'confirmed', CAST(50.00 AS Decimal(10, 2)), CAST(N'2026-04-04T16:10:11.7390000' AS DateTime2), NULL)
INSERT [dbo].[order_confirmations] ([id], [service_order_id], [confirmation_status], [final_amount], [confirmed_at], [notes]) VALUES (6, 6, N'confirmed', CAST(50.00 AS Decimal(10, 2)), CAST(N'2026-04-04T17:06:37.0600000' AS DateTime2), NULL)
INSERT [dbo].[order_confirmations] ([id], [service_order_id], [confirmation_status], [final_amount], [confirmed_at], [notes]) VALUES (7, 7, N'confirmed', CAST(50.00 AS Decimal(10, 2)), CAST(N'2026-04-04T17:44:08.7090000' AS DateTime2), NULL)
INSERT [dbo].[order_confirmations] ([id], [service_order_id], [confirmation_status], [final_amount], [confirmed_at], [notes]) VALUES (8, 8, N'confirmed', CAST(50.00 AS Decimal(10, 2)), CAST(N'2026-04-04T17:49:45.8270000' AS DateTime2), NULL)
INSERT [dbo].[order_confirmations] ([id], [service_order_id], [confirmation_status], [final_amount], [confirmed_at], [notes]) VALUES (9, 9, N'confirmed', CAST(50.00 AS Decimal(10, 2)), CAST(N'2026-04-04T18:01:36.4480000' AS DateTime2), NULL)
INSERT [dbo].[order_confirmations] ([id], [service_order_id], [confirmation_status], [final_amount], [confirmed_at], [notes]) VALUES (10, 10, N'confirmed', CAST(50.00 AS Decimal(10, 2)), CAST(N'2026-04-04T18:15:57.6230000' AS DateTime2), NULL)
INSERT [dbo].[order_confirmations] ([id], [service_order_id], [confirmation_status], [final_amount], [confirmed_at], [notes]) VALUES (11, 11, N'confirmed', CAST(50.00 AS Decimal(10, 2)), CAST(N'2026-04-04T18:16:57.1020000' AS DateTime2), NULL)
INSERT [dbo].[order_confirmations] ([id], [service_order_id], [confirmation_status], [final_amount], [confirmed_at], [notes]) VALUES (12, 12, N'confirmed', CAST(50.00 AS Decimal(10, 2)), CAST(N'2026-04-04T18:36:23.8960000' AS DateTime2), NULL)
INSERT [dbo].[order_confirmations] ([id], [service_order_id], [confirmation_status], [final_amount], [confirmed_at], [notes]) VALUES (13, 13, N'confirmed', CAST(50.00 AS Decimal(10, 2)), CAST(N'2026-04-04T19:25:22.4110000' AS DateTime2), NULL)
INSERT [dbo].[order_confirmations] ([id], [service_order_id], [confirmation_status], [final_amount], [confirmed_at], [notes]) VALUES (14, 14, N'confirmed', CAST(5000.00 AS Decimal(10, 2)), CAST(N'2026-04-05T19:08:55.0170000' AS DateTime2), NULL)
INSERT [dbo].[order_confirmations] ([id], [service_order_id], [confirmation_status], [final_amount], [confirmed_at], [notes]) VALUES (15, 15, N'confirmed', CAST(15000.00 AS Decimal(10, 2)), CAST(N'2026-04-05T19:09:46.7130000' AS DateTime2), NULL)
INSERT [dbo].[order_confirmations] ([id], [service_order_id], [confirmation_status], [final_amount], [confirmed_at], [notes]) VALUES (16, 17, N'confirmed', CAST(2500.00 AS Decimal(10, 2)), CAST(N'2026-04-10T15:22:23.7000000' AS DateTime2), NULL)
INSERT [dbo].[order_confirmations] ([id], [service_order_id], [confirmation_status], [final_amount], [confirmed_at], [notes]) VALUES (17, 18, N'confirmed', CAST(600.00 AS Decimal(10, 2)), CAST(N'2026-04-10T16:22:51.3370000' AS DateTime2), NULL)
SET IDENTITY_INSERT [dbo].[order_confirmations] OFF
GO
SET IDENTITY_INSERT [dbo].[order_items] ON 

INSERT [dbo].[order_items] ([id], [service_order_id], [service_provider_offering_id], [quantity], [item_price], [item_status], [created_at], [updated_at]) VALUES (1, 1, 1, 1, CAST(50.00 AS Decimal(10, 2)), N'pending', CAST(N'2026-04-02T07:12:28.0010000' AS DateTime2), CAST(N'2026-04-02T07:12:28.0010000' AS DateTime2))
INSERT [dbo].[order_items] ([id], [service_order_id], [service_provider_offering_id], [quantity], [item_price], [item_status], [created_at], [updated_at]) VALUES (2, 2, 2, 1, CAST(50.00 AS Decimal(10, 2)), N'pending', CAST(N'2026-04-02T22:27:44.3560000' AS DateTime2), CAST(N'2026-04-02T22:27:44.3560000' AS DateTime2))
INSERT [dbo].[order_items] ([id], [service_order_id], [service_provider_offering_id], [quantity], [item_price], [item_status], [created_at], [updated_at]) VALUES (3, 3, 3, 1, CAST(50.00 AS Decimal(10, 2)), N'pending', CAST(N'2026-04-02T23:17:57.3250000' AS DateTime2), CAST(N'2026-04-02T23:17:57.3250000' AS DateTime2))
INSERT [dbo].[order_items] ([id], [service_order_id], [service_provider_offering_id], [quantity], [item_price], [item_status], [created_at], [updated_at]) VALUES (4, 4, 4, 1, CAST(50.00 AS Decimal(10, 2)), N'pending', CAST(N'2026-04-04T16:09:24.4640000' AS DateTime2), CAST(N'2026-04-04T16:09:24.4640000' AS DateTime2))
INSERT [dbo].[order_items] ([id], [service_order_id], [service_provider_offering_id], [quantity], [item_price], [item_status], [created_at], [updated_at]) VALUES (5, 5, 9, 1, CAST(50.00 AS Decimal(10, 2)), N'pending', CAST(N'2026-04-04T16:10:11.7040000' AS DateTime2), CAST(N'2026-04-04T16:29:36.0910000' AS DateTime2))
INSERT [dbo].[order_items] ([id], [service_order_id], [service_provider_offering_id], [quantity], [item_price], [item_status], [created_at], [updated_at]) VALUES (6, 6, 10, 1, CAST(50.00 AS Decimal(10, 2)), N'pending', CAST(N'2026-04-04T17:06:37.0390000' AS DateTime2), CAST(N'2026-04-04T17:06:37.0390000' AS DateTime2))
INSERT [dbo].[order_items] ([id], [service_order_id], [service_provider_offering_id], [quantity], [item_price], [item_status], [created_at], [updated_at]) VALUES (7, 7, 11, 1, CAST(50.00 AS Decimal(10, 2)), N'pending', CAST(N'2026-04-04T17:44:08.6750000' AS DateTime2), CAST(N'2026-04-04T17:44:08.6750000' AS DateTime2))
INSERT [dbo].[order_items] ([id], [service_order_id], [service_provider_offering_id], [quantity], [item_price], [item_status], [created_at], [updated_at]) VALUES (8, 8, 12, 1, CAST(50.00 AS Decimal(10, 2)), N'pending', CAST(N'2026-04-04T17:49:45.7920000' AS DateTime2), CAST(N'2026-04-04T17:49:45.7920000' AS DateTime2))
INSERT [dbo].[order_items] ([id], [service_order_id], [service_provider_offering_id], [quantity], [item_price], [item_status], [created_at], [updated_at]) VALUES (9, 9, 13, 1, CAST(50.00 AS Decimal(10, 2)), N'pending', CAST(N'2026-04-04T18:01:36.3950000' AS DateTime2), CAST(N'2026-04-04T18:13:23.6860000' AS DateTime2))
INSERT [dbo].[order_items] ([id], [service_order_id], [service_provider_offering_id], [quantity], [item_price], [item_status], [created_at], [updated_at]) VALUES (10, 10, 14, 1, CAST(50.00 AS Decimal(10, 2)), N'pending', CAST(N'2026-04-04T18:15:57.5930000' AS DateTime2), CAST(N'2026-04-04T18:15:57.5930000' AS DateTime2))
INSERT [dbo].[order_items] ([id], [service_order_id], [service_provider_offering_id], [quantity], [item_price], [item_status], [created_at], [updated_at]) VALUES (11, 11, 12, 1, CAST(50.00 AS Decimal(10, 2)), N'pending', CAST(N'2026-04-04T18:16:57.0760000' AS DateTime2), CAST(N'2026-04-04T18:16:57.0760000' AS DateTime2))
INSERT [dbo].[order_items] ([id], [service_order_id], [service_provider_offering_id], [quantity], [item_price], [item_status], [created_at], [updated_at]) VALUES (12, 12, 15, 1, CAST(50.00 AS Decimal(10, 2)), N'pending', CAST(N'2026-04-04T18:36:23.8640000' AS DateTime2), CAST(N'2026-04-04T19:22:55.5410000' AS DateTime2))
INSERT [dbo].[order_items] ([id], [service_order_id], [service_provider_offering_id], [quantity], [item_price], [item_status], [created_at], [updated_at]) VALUES (13, 13, 16, 1, CAST(50.00 AS Decimal(10, 2)), N'pending', CAST(N'2026-04-04T19:25:22.3720000' AS DateTime2), CAST(N'2026-04-04T19:25:22.3720000' AS DateTime2))
INSERT [dbo].[order_items] ([id], [service_order_id], [service_provider_offering_id], [quantity], [item_price], [item_status], [created_at], [updated_at]) VALUES (14, 14, 17, 1, CAST(5000.00 AS Decimal(10, 2)), N'pending', CAST(N'2026-04-05T19:08:54.9730000' AS DateTime2), CAST(N'2026-04-05T19:08:54.9730000' AS DateTime2))
INSERT [dbo].[order_items] ([id], [service_order_id], [service_provider_offering_id], [quantity], [item_price], [item_status], [created_at], [updated_at]) VALUES (15, 15, 19, 1, CAST(15000.00 AS Decimal(10, 2)), N'pending', CAST(N'2026-04-05T19:09:46.6680000' AS DateTime2), CAST(N'2026-04-05T19:10:55.3280000' AS DateTime2))
INSERT [dbo].[order_items] ([id], [service_order_id], [service_provider_offering_id], [quantity], [item_price], [item_status], [created_at], [updated_at]) VALUES (16, 16, 3, 1, CAST(50.00 AS Decimal(10, 2)), N'pending', CAST(N'2026-04-10T15:16:25.9000000' AS DateTime2), CAST(N'2026-04-10T15:16:25.9000000' AS DateTime2))
INSERT [dbo].[order_items] ([id], [service_order_id], [service_provider_offering_id], [quantity], [item_price], [item_status], [created_at], [updated_at]) VALUES (17, 17, 21, 1, CAST(2500.00 AS Decimal(10, 2)), N'pending', CAST(N'2026-04-10T15:17:56.5410000' AS DateTime2), CAST(N'2026-04-10T15:21:36.5010000' AS DateTime2))
INSERT [dbo].[order_items] ([id], [service_order_id], [service_provider_offering_id], [quantity], [item_price], [item_status], [created_at], [updated_at]) VALUES (18, 18, 22, 1, CAST(600.00 AS Decimal(10, 2)), N'pending', CAST(N'2026-04-10T16:19:25.7470000' AS DateTime2), CAST(N'2026-04-10T16:19:25.7470000' AS DateTime2))
INSERT [dbo].[order_items] ([id], [service_order_id], [service_provider_offering_id], [quantity], [item_price], [item_status], [created_at], [updated_at]) VALUES (19, 19, 23, 1, CAST(800.00 AS Decimal(10, 2)), N'pending', CAST(N'2026-04-10T19:58:04.9900000' AS DateTime2), CAST(N'2026-04-10T19:58:04.9900000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[order_items] OFF
GO
SET IDENTITY_INSERT [dbo].[payments] ON 

INSERT [dbo].[payments] ([id], [service_order_id], [payment_method], [payment_datetime], [transaction_reference], [created_at], [updated_at], [payable_amount]) VALUES (1, 1, N'mobile_banking', CAST(N'2026-04-02T13:12:28.0100000' AS DateTime2), NULL, CAST(N'2026-04-02T07:12:28.0110000' AS DateTime2), CAST(N'2026-04-02T07:12:28.0110000' AS DateTime2), CAST(0.00 AS Decimal(10, 2)))
INSERT [dbo].[payments] ([id], [service_order_id], [payment_method], [payment_datetime], [transaction_reference], [created_at], [updated_at], [payable_amount]) VALUES (2, 2, N'cash', CAST(N'2026-04-03T04:27:44.3800000' AS DateTime2), NULL, CAST(N'2026-04-02T22:27:44.3720000' AS DateTime2), CAST(N'2026-04-02T22:27:44.3720000' AS DateTime2), CAST(0.00 AS Decimal(10, 2)))
INSERT [dbo].[payments] ([id], [service_order_id], [payment_method], [payment_datetime], [transaction_reference], [created_at], [updated_at], [payable_amount]) VALUES (3, 3, N'mobile_banking', CAST(N'2026-04-03T05:17:57.3233333' AS DateTime2), NULL, CAST(N'2026-04-02T23:17:57.3330000' AS DateTime2), CAST(N'2026-04-02T23:17:57.3330000' AS DateTime2), CAST(0.00 AS Decimal(10, 2)))
INSERT [dbo].[payments] ([id], [service_order_id], [payment_method], [payment_datetime], [transaction_reference], [created_at], [updated_at], [payable_amount]) VALUES (4, 4, N'cash', CAST(N'2026-04-04T22:09:24.4866667' AS DateTime2), NULL, CAST(N'2026-04-04T16:09:24.4850000' AS DateTime2), CAST(N'2026-04-04T16:09:24.4850000' AS DateTime2), CAST(50.00 AS Decimal(10, 2)))
INSERT [dbo].[payments] ([id], [service_order_id], [payment_method], [payment_datetime], [transaction_reference], [created_at], [updated_at], [payable_amount]) VALUES (5, 5, N'mobile_banking', CAST(N'2026-04-04T22:10:11.7266667' AS DateTime2), NULL, CAST(N'2026-04-04T16:10:11.7210000' AS DateTime2), CAST(N'2026-04-04T16:10:11.7210000' AS DateTime2), CAST(50.00 AS Decimal(10, 2)))
INSERT [dbo].[payments] ([id], [service_order_id], [payment_method], [payment_datetime], [transaction_reference], [created_at], [updated_at], [payable_amount]) VALUES (6, 6, N'cash', CAST(N'2026-04-04T23:06:37.0500000' AS DateTime2), NULL, CAST(N'2026-04-04T17:06:37.0490000' AS DateTime2), CAST(N'2026-04-04T17:06:37.0490000' AS DateTime2), CAST(50.00 AS Decimal(10, 2)))
INSERT [dbo].[payments] ([id], [service_order_id], [payment_method], [payment_datetime], [transaction_reference], [created_at], [updated_at], [payable_amount]) VALUES (7, 7, N'mobile_banking', CAST(N'2026-04-04T23:44:08.7000000' AS DateTime2), NULL, CAST(N'2026-04-04T17:44:08.6940000' AS DateTime2), CAST(N'2026-04-04T17:44:08.6940000' AS DateTime2), CAST(50.00 AS Decimal(10, 2)))
INSERT [dbo].[payments] ([id], [service_order_id], [payment_method], [payment_datetime], [transaction_reference], [created_at], [updated_at], [payable_amount]) VALUES (8, 8, N'mobile_banking', CAST(N'2026-04-04T23:49:45.8133333' AS DateTime2), NULL, CAST(N'2026-04-04T17:49:45.8090000' AS DateTime2), CAST(N'2026-04-04T17:49:45.8090000' AS DateTime2), CAST(50.00 AS Decimal(10, 2)))
INSERT [dbo].[payments] ([id], [service_order_id], [payment_method], [payment_datetime], [transaction_reference], [created_at], [updated_at], [payable_amount]) VALUES (9, 9, N'mobile_banking', CAST(N'2026-04-05T00:01:36.4266667' AS DateTime2), NULL, CAST(N'2026-04-04T18:01:36.4190000' AS DateTime2), CAST(N'2026-04-04T18:01:36.4190000' AS DateTime2), CAST(50.00 AS Decimal(10, 2)))
INSERT [dbo].[payments] ([id], [service_order_id], [payment_method], [payment_datetime], [transaction_reference], [created_at], [updated_at], [payable_amount]) VALUES (10, 10, N'cash', CAST(N'2026-04-05T00:15:57.6133333' AS DateTime2), NULL, CAST(N'2026-04-04T18:15:57.6090000' AS DateTime2), CAST(N'2026-04-04T18:15:57.6090000' AS DateTime2), CAST(50.00 AS Decimal(10, 2)))
INSERT [dbo].[payments] ([id], [service_order_id], [payment_method], [payment_datetime], [transaction_reference], [created_at], [updated_at], [payable_amount]) VALUES (11, 11, N'mobile_banking', CAST(N'2026-04-05T00:16:57.0900000' AS DateTime2), NULL, CAST(N'2026-04-04T18:16:57.0880000' AS DateTime2), CAST(N'2026-04-04T18:16:57.0880000' AS DateTime2), CAST(50.00 AS Decimal(10, 2)))
INSERT [dbo].[payments] ([id], [service_order_id], [payment_method], [payment_datetime], [transaction_reference], [created_at], [updated_at], [payable_amount]) VALUES (12, 12, N'mobile_banking', CAST(N'2026-04-05T00:36:23.8833333' AS DateTime2), NULL, CAST(N'2026-04-04T18:36:23.8820000' AS DateTime2), CAST(N'2026-04-04T18:36:23.8820000' AS DateTime2), CAST(50.00 AS Decimal(10, 2)))
INSERT [dbo].[payments] ([id], [service_order_id], [payment_method], [payment_datetime], [transaction_reference], [created_at], [updated_at], [payable_amount]) VALUES (13, 13, N'mobile_banking', CAST(N'2026-04-05T01:25:22.3966667' AS DateTime2), NULL, CAST(N'2026-04-04T19:25:22.3920000' AS DateTime2), CAST(N'2026-04-04T19:25:22.3920000' AS DateTime2), CAST(50.00 AS Decimal(10, 2)))
INSERT [dbo].[payments] ([id], [service_order_id], [payment_method], [payment_datetime], [transaction_reference], [created_at], [updated_at], [payable_amount]) VALUES (14, 14, N'cash', CAST(N'2026-04-06T01:08:55.0000000' AS DateTime2), NULL, CAST(N'2026-04-05T19:08:54.9950000' AS DateTime2), CAST(N'2026-04-05T19:08:54.9950000' AS DateTime2), CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[payments] ([id], [service_order_id], [payment_method], [payment_datetime], [transaction_reference], [created_at], [updated_at], [payable_amount]) VALUES (15, 15, N'mobile_banking', CAST(N'2026-04-06T01:09:46.6966667' AS DateTime2), NULL, CAST(N'2026-04-05T19:09:46.6900000' AS DateTime2), CAST(N'2026-04-05T19:09:46.6900000' AS DateTime2), CAST(15000.00 AS Decimal(10, 2)))
INSERT [dbo].[payments] ([id], [service_order_id], [payment_method], [payment_datetime], [transaction_reference], [created_at], [updated_at], [payable_amount]) VALUES (16, 16, N'mobile_banking', CAST(N'2026-04-10T21:16:25.9500000' AS DateTime2), NULL, CAST(N'2026-04-10T15:16:25.9380000' AS DateTime2), CAST(N'2026-04-10T15:16:25.9380000' AS DateTime2), CAST(50.00 AS Decimal(10, 2)))
INSERT [dbo].[payments] ([id], [service_order_id], [payment_method], [payment_datetime], [transaction_reference], [created_at], [updated_at], [payable_amount]) VALUES (17, 17, N'mobile_banking', CAST(N'2026-04-10T21:17:56.5700000' AS DateTime2), NULL, CAST(N'2026-04-10T15:17:56.5710000' AS DateTime2), CAST(N'2026-04-10T15:17:56.5710000' AS DateTime2), CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[payments] ([id], [service_order_id], [payment_method], [payment_datetime], [transaction_reference], [created_at], [updated_at], [payable_amount]) VALUES (18, 18, N'mobile_banking', CAST(N'2026-04-10T22:19:25.7766667' AS DateTime2), NULL, CAST(N'2026-04-10T16:19:25.7770000' AS DateTime2), CAST(N'2026-04-10T16:19:25.7770000' AS DateTime2), CAST(600.00 AS Decimal(10, 2)))
INSERT [dbo].[payments] ([id], [service_order_id], [payment_method], [payment_datetime], [transaction_reference], [created_at], [updated_at], [payable_amount]) VALUES (19, 19, N'cash', CAST(N'2026-04-11T01:58:05.0133333' AS DateTime2), NULL, CAST(N'2026-04-10T19:58:05.0070000' AS DateTime2), CAST(N'2026-04-10T19:58:05.0070000' AS DateTime2), CAST(800.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[payments] OFF
GO
SET IDENTITY_INSERT [dbo].[ratings_reviews] ON 

INSERT [dbo].[ratings_reviews] ([id], [customer_id], [service_provider_id], [service_order_id], [rating], [review_date], [review_notes], [created_at], [updated_at]) VALUES (1, 1, 1, 18, 5, CAST(N'2026-04-10' AS Date), N'good', CAST(N'2026-04-10T19:53:40.9320000' AS DateTime2), CAST(N'2026-04-10T19:53:40.9320000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[ratings_reviews] OFF
GO
SET IDENTITY_INSERT [dbo].[service_areas] ON 

INSERT [dbo].[service_areas] ([id], [city_name], [area_name], [postal_code], [created_at], [updated_at]) VALUES (1, N'Default City', N'Default Area', N'0000', CAST(N'2026-04-02T07:12:27.9050000' AS DateTime2), CAST(N'2026-04-02T07:12:27.9050000' AS DateTime2))
INSERT [dbo].[service_areas] ([id], [city_name], [area_name], [postal_code], [created_at], [updated_at]) VALUES (2, N'Dhaka', N'Mirpur', NULL, CAST(N'2026-04-04T18:52:50.8040000' AS DateTime2), CAST(N'2026-04-04T18:52:50.8040000' AS DateTime2))
INSERT [dbo].[service_areas] ([id], [city_name], [area_name], [postal_code], [created_at], [updated_at]) VALUES (3, N'Dhaka', N'Dhanmondi', NULL, CAST(N'2026-04-04T18:52:50.8480000' AS DateTime2), CAST(N'2026-04-04T18:52:50.8480000' AS DateTime2))
INSERT [dbo].[service_areas] ([id], [city_name], [area_name], [postal_code], [created_at], [updated_at]) VALUES (4, N'Dhaka', N'Uttara', NULL, CAST(N'2026-04-04T18:52:50.8530000' AS DateTime2), CAST(N'2026-04-04T18:52:50.8530000' AS DateTime2))
INSERT [dbo].[service_areas] ([id], [city_name], [area_name], [postal_code], [created_at], [updated_at]) VALUES (5, N'Dhaka', N'Gulshan', NULL, CAST(N'2026-04-04T18:52:50.8560000' AS DateTime2), CAST(N'2026-04-04T18:52:50.8560000' AS DateTime2))
INSERT [dbo].[service_areas] ([id], [city_name], [area_name], [postal_code], [created_at], [updated_at]) VALUES (6, N'Dhaka', N'Banani', NULL, CAST(N'2026-04-04T18:52:50.8600000' AS DateTime2), CAST(N'2026-04-04T18:52:50.8600000' AS DateTime2))
INSERT [dbo].[service_areas] ([id], [city_name], [area_name], [postal_code], [created_at], [updated_at]) VALUES (7, N'Dhaka', N'Mohammadpur', NULL, CAST(N'2026-04-04T18:52:50.8630000' AS DateTime2), CAST(N'2026-04-04T18:52:50.8630000' AS DateTime2))
INSERT [dbo].[service_areas] ([id], [city_name], [area_name], [postal_code], [created_at], [updated_at]) VALUES (8, N'Dhaka', N'Tejgaon', NULL, CAST(N'2026-04-04T18:52:50.8680000' AS DateTime2), CAST(N'2026-04-04T18:52:50.8680000' AS DateTime2))
INSERT [dbo].[service_areas] ([id], [city_name], [area_name], [postal_code], [created_at], [updated_at]) VALUES (9, N'Dhaka', N'Motijheel', NULL, CAST(N'2026-04-04T18:52:50.8730000' AS DateTime2), CAST(N'2026-04-04T18:52:50.8730000' AS DateTime2))
INSERT [dbo].[service_areas] ([id], [city_name], [area_name], [postal_code], [created_at], [updated_at]) VALUES (10, N'Dhaka', N'Paltan', NULL, CAST(N'2026-04-04T18:52:50.8760000' AS DateTime2), CAST(N'2026-04-04T18:52:50.8760000' AS DateTime2))
INSERT [dbo].[service_areas] ([id], [city_name], [area_name], [postal_code], [created_at], [updated_at]) VALUES (11, N'Dhaka', N'Savar', NULL, CAST(N'2026-04-04T18:52:50.8790000' AS DateTime2), CAST(N'2026-04-04T18:52:50.8790000' AS DateTime2))
INSERT [dbo].[service_areas] ([id], [city_name], [area_name], [postal_code], [created_at], [updated_at]) VALUES (12, N'Dhaka', N'Keraniganj', NULL, CAST(N'2026-04-04T18:52:50.8820000' AS DateTime2), CAST(N'2026-04-04T18:52:50.8820000' AS DateTime2))
INSERT [dbo].[service_areas] ([id], [city_name], [area_name], [postal_code], [created_at], [updated_at]) VALUES (13, N'Dhaka', N'Dohar', NULL, CAST(N'2026-04-04T18:52:50.8860000' AS DateTime2), CAST(N'2026-04-04T18:52:50.8860000' AS DateTime2))
INSERT [dbo].[service_areas] ([id], [city_name], [area_name], [postal_code], [created_at], [updated_at]) VALUES (14, N'Chittagong', N'Cox''s Bazar', NULL, CAST(N'2026-04-04T18:52:50.8900000' AS DateTime2), CAST(N'2026-04-04T18:52:50.8900000' AS DateTime2))
INSERT [dbo].[service_areas] ([id], [city_name], [area_name], [postal_code], [created_at], [updated_at]) VALUES (15, N'Chittagong', N'Panchlaish', NULL, CAST(N'2026-04-04T18:52:50.8940000' AS DateTime2), CAST(N'2026-04-04T18:52:50.8940000' AS DateTime2))
INSERT [dbo].[service_areas] ([id], [city_name], [area_name], [postal_code], [created_at], [updated_at]) VALUES (16, N'Chittagong', N'Halishahar', NULL, CAST(N'2026-04-04T18:52:50.9010000' AS DateTime2), CAST(N'2026-04-04T18:52:50.9010000' AS DateTime2))
INSERT [dbo].[service_areas] ([id], [city_name], [area_name], [postal_code], [created_at], [updated_at]) VALUES (17, N'Chittagong', N'Pahartali', NULL, CAST(N'2026-04-04T18:52:50.9050000' AS DateTime2), CAST(N'2026-04-04T18:52:50.9050000' AS DateTime2))
INSERT [dbo].[service_areas] ([id], [city_name], [area_name], [postal_code], [created_at], [updated_at]) VALUES (18, N'Chittagong', N'Chandgaon', NULL, CAST(N'2026-04-04T18:52:50.9110000' AS DateTime2), CAST(N'2026-04-04T18:52:50.9110000' AS DateTime2))
INSERT [dbo].[service_areas] ([id], [city_name], [area_name], [postal_code], [created_at], [updated_at]) VALUES (19, N'Chittagong', N'Sitakunda', NULL, CAST(N'2026-04-04T18:52:50.9170000' AS DateTime2), CAST(N'2026-04-04T18:52:50.9170000' AS DateTime2))
INSERT [dbo].[service_areas] ([id], [city_name], [area_name], [postal_code], [created_at], [updated_at]) VALUES (20, N'Chittagong', N'Rangunia', NULL, CAST(N'2026-04-04T18:52:50.9210000' AS DateTime2), CAST(N'2026-04-04T18:52:50.9210000' AS DateTime2))
INSERT [dbo].[service_areas] ([id], [city_name], [area_name], [postal_code], [created_at], [updated_at]) VALUES (21, N'Chittagong', N'Sandwip', NULL, CAST(N'2026-04-04T18:52:50.9260000' AS DateTime2), CAST(N'2026-04-04T18:52:50.9260000' AS DateTime2))
INSERT [dbo].[service_areas] ([id], [city_name], [area_name], [postal_code], [created_at], [updated_at]) VALUES (22, N'Chittagong', N'Mirsharai', NULL, CAST(N'2026-04-04T18:52:50.9290000' AS DateTime2), CAST(N'2026-04-04T18:52:50.9290000' AS DateTime2))
INSERT [dbo].[service_areas] ([id], [city_name], [area_name], [postal_code], [created_at], [updated_at]) VALUES (23, N'Chittagong', N'Boalkhali', NULL, CAST(N'2026-04-04T18:52:50.9360000' AS DateTime2), CAST(N'2026-04-04T18:52:50.9360000' AS DateTime2))
INSERT [dbo].[service_areas] ([id], [city_name], [area_name], [postal_code], [created_at], [updated_at]) VALUES (24, N'Sylhet', N'Zindabazar', NULL, CAST(N'2026-04-04T18:52:50.9400000' AS DateTime2), CAST(N'2026-04-04T18:52:50.9400000' AS DateTime2))
INSERT [dbo].[service_areas] ([id], [city_name], [area_name], [postal_code], [created_at], [updated_at]) VALUES (25, N'Sylhet', N'Amberkhana', NULL, CAST(N'2026-04-04T18:52:50.9610000' AS DateTime2), CAST(N'2026-04-04T18:52:50.9610000' AS DateTime2))
INSERT [dbo].[service_areas] ([id], [city_name], [area_name], [postal_code], [created_at], [updated_at]) VALUES (26, N'Sylhet', N'Tilagor', NULL, CAST(N'2026-04-04T18:52:50.9690000' AS DateTime2), CAST(N'2026-04-04T18:52:50.9690000' AS DateTime2))
INSERT [dbo].[service_areas] ([id], [city_name], [area_name], [postal_code], [created_at], [updated_at]) VALUES (27, N'Sylhet', N'Noyashahar', NULL, CAST(N'2026-04-04T18:52:50.9750000' AS DateTime2), CAST(N'2026-04-04T18:52:50.9750000' AS DateTime2))
INSERT [dbo].[service_areas] ([id], [city_name], [area_name], [postal_code], [created_at], [updated_at]) VALUES (28, N'Sylhet', N'Kumarpara', NULL, CAST(N'2026-04-04T18:52:50.9800000' AS DateTime2), CAST(N'2026-04-04T18:52:50.9800000' AS DateTime2))
INSERT [dbo].[service_areas] ([id], [city_name], [area_name], [postal_code], [created_at], [updated_at]) VALUES (29, N'Sylhet', N'Moglabazar', NULL, CAST(N'2026-04-04T18:52:50.9870000' AS DateTime2), CAST(N'2026-04-04T18:52:50.9870000' AS DateTime2))
INSERT [dbo].[service_areas] ([id], [city_name], [area_name], [postal_code], [created_at], [updated_at]) VALUES (30, N'Sylhet', N'Gowainghat', NULL, CAST(N'2026-04-04T18:52:50.9920000' AS DateTime2), CAST(N'2026-04-04T18:52:50.9920000' AS DateTime2))
INSERT [dbo].[service_areas] ([id], [city_name], [area_name], [postal_code], [created_at], [updated_at]) VALUES (31, N'Sylhet', N'Beanibazar', NULL, CAST(N'2026-04-04T18:52:50.9960000' AS DateTime2), CAST(N'2026-04-04T18:52:50.9960000' AS DateTime2))
INSERT [dbo].[service_areas] ([id], [city_name], [area_name], [postal_code], [created_at], [updated_at]) VALUES (32, N'Sylhet', N'Balaganj', NULL, CAST(N'2026-04-04T18:52:51.0040000' AS DateTime2), CAST(N'2026-04-04T18:52:51.0040000' AS DateTime2))
INSERT [dbo].[service_areas] ([id], [city_name], [area_name], [postal_code], [created_at], [updated_at]) VALUES (33, N'Sylhet', N'Fenchuganj', NULL, CAST(N'2026-04-04T18:52:51.0090000' AS DateTime2), CAST(N'2026-04-04T18:52:51.0090000' AS DateTime2))
INSERT [dbo].[service_areas] ([id], [city_name], [area_name], [postal_code], [created_at], [updated_at]) VALUES (34, N'Barisal', N'Sadatpur', NULL, CAST(N'2026-04-04T18:52:51.0140000' AS DateTime2), CAST(N'2026-04-04T18:52:51.0140000' AS DateTime2))
INSERT [dbo].[service_areas] ([id], [city_name], [area_name], [postal_code], [created_at], [updated_at]) VALUES (35, N'Barisal', N'Amtali', NULL, CAST(N'2026-04-04T18:52:51.0190000' AS DateTime2), CAST(N'2026-04-04T18:52:51.0190000' AS DateTime2))
INSERT [dbo].[service_areas] ([id], [city_name], [area_name], [postal_code], [created_at], [updated_at]) VALUES (36, N'Barisal', N'Agailjhara', NULL, CAST(N'2026-04-04T18:52:51.0230000' AS DateTime2), CAST(N'2026-04-04T18:52:51.0230000' AS DateTime2))
INSERT [dbo].[service_areas] ([id], [city_name], [area_name], [postal_code], [created_at], [updated_at]) VALUES (37, N'Barisal', N'Babuganj', NULL, CAST(N'2026-04-04T18:52:51.0280000' AS DateTime2), CAST(N'2026-04-04T18:52:51.0280000' AS DateTime2))
INSERT [dbo].[service_areas] ([id], [city_name], [area_name], [postal_code], [created_at], [updated_at]) VALUES (38, N'Barisal', N'Bakerganj', NULL, CAST(N'2026-04-04T18:52:51.0320000' AS DateTime2), CAST(N'2026-04-04T18:52:51.0320000' AS DateTime2))
INSERT [dbo].[service_areas] ([id], [city_name], [area_name], [postal_code], [created_at], [updated_at]) VALUES (39, N'Barisal', N'Banaripara', NULL, CAST(N'2026-04-04T18:52:51.0350000' AS DateTime2), CAST(N'2026-04-04T18:52:51.0350000' AS DateTime2))
INSERT [dbo].[service_areas] ([id], [city_name], [area_name], [postal_code], [created_at], [updated_at]) VALUES (40, N'Barisal', N'Gournadi', NULL, CAST(N'2026-04-04T18:52:51.0390000' AS DateTime2), CAST(N'2026-04-04T18:52:51.0390000' AS DateTime2))
INSERT [dbo].[service_areas] ([id], [city_name], [area_name], [postal_code], [created_at], [updated_at]) VALUES (41, N'Barisal', N'Hizla', NULL, CAST(N'2026-04-04T18:52:51.0410000' AS DateTime2), CAST(N'2026-04-04T18:52:51.0410000' AS DateTime2))
INSERT [dbo].[service_areas] ([id], [city_name], [area_name], [postal_code], [created_at], [updated_at]) VALUES (42, N'Barisal', N'Mehendiganj', NULL, CAST(N'2026-04-04T18:52:51.0450000' AS DateTime2), CAST(N'2026-04-04T18:52:51.0450000' AS DateTime2))
INSERT [dbo].[service_areas] ([id], [city_name], [area_name], [postal_code], [created_at], [updated_at]) VALUES (43, N'Barisal', N'Muladi', NULL, CAST(N'2026-04-04T18:52:51.0500000' AS DateTime2), CAST(N'2026-04-04T18:52:51.0500000' AS DateTime2))
INSERT [dbo].[service_areas] ([id], [city_name], [area_name], [postal_code], [created_at], [updated_at]) VALUES (44, N'Barisal', N'Wazirpur', NULL, CAST(N'2026-04-04T18:52:51.0540000' AS DateTime2), CAST(N'2026-04-04T18:52:51.0540000' AS DateTime2))
INSERT [dbo].[service_areas] ([id], [city_name], [area_name], [postal_code], [created_at], [updated_at]) VALUES (45, N'Rangpur', N'Modern More', NULL, CAST(N'2026-04-04T18:52:51.0600000' AS DateTime2), CAST(N'2026-04-04T18:52:51.0600000' AS DateTime2))
INSERT [dbo].[service_areas] ([id], [city_name], [area_name], [postal_code], [created_at], [updated_at]) VALUES (46, N'Rangpur', N'Kaunia', NULL, CAST(N'2026-04-04T18:52:51.0650000' AS DateTime2), CAST(N'2026-04-04T18:52:51.0650000' AS DateTime2))
INSERT [dbo].[service_areas] ([id], [city_name], [area_name], [postal_code], [created_at], [updated_at]) VALUES (47, N'Rangpur', N'Gangachara', NULL, CAST(N'2026-04-04T18:52:51.0700000' AS DateTime2), CAST(N'2026-04-04T18:52:51.0700000' AS DateTime2))
INSERT [dbo].[service_areas] ([id], [city_name], [area_name], [postal_code], [created_at], [updated_at]) VALUES (48, N'Rangpur', N'Pirgachha', NULL, CAST(N'2026-04-04T18:52:51.0740000' AS DateTime2), CAST(N'2026-04-04T18:52:51.0740000' AS DateTime2))
INSERT [dbo].[service_areas] ([id], [city_name], [area_name], [postal_code], [created_at], [updated_at]) VALUES (49, N'Rangpur', N'Badarganj', NULL, CAST(N'2026-04-04T18:52:51.0790000' AS DateTime2), CAST(N'2026-04-04T18:52:51.0790000' AS DateTime2))
INSERT [dbo].[service_areas] ([id], [city_name], [area_name], [postal_code], [created_at], [updated_at]) VALUES (50, N'Rangpur', N'Mithapukur', NULL, CAST(N'2026-04-04T18:52:51.0830000' AS DateTime2), CAST(N'2026-04-04T18:52:51.0830000' AS DateTime2))
INSERT [dbo].[service_areas] ([id], [city_name], [area_name], [postal_code], [created_at], [updated_at]) VALUES (51, N'Rangpur', N'Pirganj', NULL, CAST(N'2026-04-04T18:52:51.0860000' AS DateTime2), CAST(N'2026-04-04T18:52:51.0860000' AS DateTime2))
INSERT [dbo].[service_areas] ([id], [city_name], [area_name], [postal_code], [created_at], [updated_at]) VALUES (52, N'Rangpur', N'Rangpur Sadar', NULL, CAST(N'2026-04-04T18:52:51.0890000' AS DateTime2), CAST(N'2026-04-04T18:52:51.0890000' AS DateTime2))
INSERT [dbo].[service_areas] ([id], [city_name], [area_name], [postal_code], [created_at], [updated_at]) VALUES (53, N'Rangpur', N'Taraganj', NULL, CAST(N'2026-04-04T18:52:51.0920000' AS DateTime2), CAST(N'2026-04-04T18:52:51.0920000' AS DateTime2))
INSERT [dbo].[service_areas] ([id], [city_name], [area_name], [postal_code], [created_at], [updated_at]) VALUES (54, N'Rajshahi', N'Motihar', NULL, CAST(N'2026-04-04T18:52:51.0990000' AS DateTime2), CAST(N'2026-04-04T18:52:51.0990000' AS DateTime2))
INSERT [dbo].[service_areas] ([id], [city_name], [area_name], [postal_code], [created_at], [updated_at]) VALUES (55, N'Rajshahi', N'Boalia', NULL, CAST(N'2026-04-04T18:52:51.1010000' AS DateTime2), CAST(N'2026-04-04T18:52:51.1010000' AS DateTime2))
INSERT [dbo].[service_areas] ([id], [city_name], [area_name], [postal_code], [created_at], [updated_at]) VALUES (56, N'Rajshahi', N'Paba', NULL, CAST(N'2026-04-04T18:52:51.1040000' AS DateTime2), CAST(N'2026-04-04T18:52:51.1040000' AS DateTime2))
INSERT [dbo].[service_areas] ([id], [city_name], [area_name], [postal_code], [created_at], [updated_at]) VALUES (57, N'Rajshahi', N'Durgapur', NULL, CAST(N'2026-04-04T18:52:51.1060000' AS DateTime2), CAST(N'2026-04-04T18:52:51.1060000' AS DateTime2))
INSERT [dbo].[service_areas] ([id], [city_name], [area_name], [postal_code], [created_at], [updated_at]) VALUES (58, N'Rajshahi', N'Bagha', NULL, CAST(N'2026-04-04T18:52:51.1080000' AS DateTime2), CAST(N'2026-04-04T18:52:51.1080000' AS DateTime2))
INSERT [dbo].[service_areas] ([id], [city_name], [area_name], [postal_code], [created_at], [updated_at]) VALUES (59, N'Rajshahi', N'Bagmara', NULL, CAST(N'2026-04-04T18:52:51.1100000' AS DateTime2), CAST(N'2026-04-04T18:52:51.1100000' AS DateTime2))
INSERT [dbo].[service_areas] ([id], [city_name], [area_name], [postal_code], [created_at], [updated_at]) VALUES (60, N'Rajshahi', N'Charghat', NULL, CAST(N'2026-04-04T18:52:51.1130000' AS DateTime2), CAST(N'2026-04-04T18:52:51.1130000' AS DateTime2))
INSERT [dbo].[service_areas] ([id], [city_name], [area_name], [postal_code], [created_at], [updated_at]) VALUES (61, N'Rajshahi', N'Godagari', NULL, CAST(N'2026-04-04T18:52:51.1160000' AS DateTime2), CAST(N'2026-04-04T18:52:51.1160000' AS DateTime2))
INSERT [dbo].[service_areas] ([id], [city_name], [area_name], [postal_code], [created_at], [updated_at]) VALUES (62, N'Rajshahi', N'Tanore', NULL, CAST(N'2026-04-04T18:52:51.1190000' AS DateTime2), CAST(N'2026-04-04T18:52:51.1190000' AS DateTime2))
INSERT [dbo].[service_areas] ([id], [city_name], [area_name], [postal_code], [created_at], [updated_at]) VALUES (63, N'Rajshahi', N'Puthia', NULL, CAST(N'2026-04-04T18:52:51.1210000' AS DateTime2), CAST(N'2026-04-04T18:52:51.1210000' AS DateTime2))
INSERT [dbo].[service_areas] ([id], [city_name], [area_name], [postal_code], [created_at], [updated_at]) VALUES (64, N'Rajshahi', N'Mohonpur', NULL, CAST(N'2026-04-04T18:52:51.1230000' AS DateTime2), CAST(N'2026-04-04T18:52:51.1230000' AS DateTime2))
INSERT [dbo].[service_areas] ([id], [city_name], [area_name], [postal_code], [created_at], [updated_at]) VALUES (65, N'Khulna', N'Boyra', NULL, CAST(N'2026-04-04T18:52:51.1260000' AS DateTime2), CAST(N'2026-04-04T18:52:51.1260000' AS DateTime2))
INSERT [dbo].[service_areas] ([id], [city_name], [area_name], [postal_code], [created_at], [updated_at]) VALUES (66, N'Khulna', N'Khalishpur', NULL, CAST(N'2026-04-04T18:52:51.1280000' AS DateTime2), CAST(N'2026-04-04T18:52:51.1280000' AS DateTime2))
INSERT [dbo].[service_areas] ([id], [city_name], [area_name], [postal_code], [created_at], [updated_at]) VALUES (67, N'Khulna', N'Sonadanga', NULL, CAST(N'2026-04-04T18:52:51.1300000' AS DateTime2), CAST(N'2026-04-04T18:52:51.1300000' AS DateTime2))
INSERT [dbo].[service_areas] ([id], [city_name], [area_name], [postal_code], [created_at], [updated_at]) VALUES (68, N'Khulna', N'Daulatpur', NULL, CAST(N'2026-04-04T18:52:51.1320000' AS DateTime2), CAST(N'2026-04-04T18:52:51.1320000' AS DateTime2))
INSERT [dbo].[service_areas] ([id], [city_name], [area_name], [postal_code], [created_at], [updated_at]) VALUES (69, N'Khulna', N'Dumuria', NULL, CAST(N'2026-04-04T18:52:51.1350000' AS DateTime2), CAST(N'2026-04-04T18:52:51.1350000' AS DateTime2))
INSERT [dbo].[service_areas] ([id], [city_name], [area_name], [postal_code], [created_at], [updated_at]) VALUES (70, N'Khulna', N'Dighalia', NULL, CAST(N'2026-04-04T18:52:51.1370000' AS DateTime2), CAST(N'2026-04-04T18:52:51.1370000' AS DateTime2))
INSERT [dbo].[service_areas] ([id], [city_name], [area_name], [postal_code], [created_at], [updated_at]) VALUES (71, N'Khulna', N'Batiaghata', NULL, CAST(N'2026-04-04T18:52:51.1390000' AS DateTime2), CAST(N'2026-04-04T18:52:51.1390000' AS DateTime2))
INSERT [dbo].[service_areas] ([id], [city_name], [area_name], [postal_code], [created_at], [updated_at]) VALUES (72, N'Khulna', N'Phultala', NULL, CAST(N'2026-04-04T18:52:51.1410000' AS DateTime2), CAST(N'2026-04-04T18:52:51.1410000' AS DateTime2))
INSERT [dbo].[service_areas] ([id], [city_name], [area_name], [postal_code], [created_at], [updated_at]) VALUES (73, N'Khulna', N'Rupsha', NULL, CAST(N'2026-04-04T18:52:51.1430000' AS DateTime2), CAST(N'2026-04-04T18:52:51.1430000' AS DateTime2))
INSERT [dbo].[service_areas] ([id], [city_name], [area_name], [postal_code], [created_at], [updated_at]) VALUES (74, N'Khulna', N'Terokhada', NULL, CAST(N'2026-04-04T18:52:51.1440000' AS DateTime2), CAST(N'2026-04-04T18:52:51.1440000' AS DateTime2))
INSERT [dbo].[service_areas] ([id], [city_name], [area_name], [postal_code], [created_at], [updated_at]) VALUES (75, N'Khulna', N'Paikgachha', NULL, CAST(N'2026-04-04T18:52:51.1460000' AS DateTime2), CAST(N'2026-04-04T18:52:51.1460000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[service_areas] OFF
GO
SET IDENTITY_INSERT [dbo].[service_orders] ON 

INSERT [dbo].[service_orders] ([id], [customer_id], [status], [total_amount], [payment_status], [order_datetime], [scheduled_datetime], [created_at], [updated_at], [city_name], [area_name]) VALUES (1, 1, N'Order Confirmed', CAST(50.00 AS Decimal(10, 2)), N'unpaid', CAST(N'2026-04-02T13:12:27.8133333' AS DateTime2), CAST(N'2026-04-02T18:10:00.0000000' AS DateTime2), CAST(N'2026-04-02T07:12:27.7760000' AS DateTime2), CAST(N'2026-04-02T07:12:27.9690000' AS DateTime2), NULL, NULL)
INSERT [dbo].[service_orders] ([id], [customer_id], [status], [total_amount], [payment_status], [order_datetime], [scheduled_datetime], [created_at], [updated_at], [city_name], [area_name]) VALUES (2, 1, N'Order Confirmed', CAST(50.00 AS Decimal(10, 2)), N'unpaid', CAST(N'2026-04-03T04:27:43.9100000' AS DateTime2), CAST(N'2026-04-08T16:32:00.0000000' AS DateTime2), CAST(N'2026-04-02T22:27:43.8240000' AS DateTime2), CAST(N'2026-04-02T22:27:44.3290000' AS DateTime2), NULL, NULL)
INSERT [dbo].[service_orders] ([id], [customer_id], [status], [total_amount], [payment_status], [order_datetime], [scheduled_datetime], [created_at], [updated_at], [city_name], [area_name]) VALUES (3, 1, N'Order Confirmed', CAST(50.00 AS Decimal(10, 2)), N'unpaid', CAST(N'2026-04-03T05:17:57.2200000' AS DateTime2), CAST(N'2026-04-16T17:21:00.0000000' AS DateTime2), CAST(N'2026-04-02T23:17:57.1990000' AS DateTime2), CAST(N'2026-04-02T23:17:57.3140000' AS DateTime2), NULL, NULL)
INSERT [dbo].[service_orders] ([id], [customer_id], [status], [total_amount], [payment_status], [order_datetime], [scheduled_datetime], [created_at], [updated_at], [city_name], [area_name]) VALUES (4, 1, N'Order Confirmed', CAST(50.00 AS Decimal(10, 2)), N'unpaid', CAST(N'2026-04-04T22:09:24.2600000' AS DateTime2), CAST(N'2026-04-16T10:00:00.0000000' AS DateTime2), CAST(N'2026-04-04T16:09:24.2400000' AS DateTime2), CAST(N'2026-04-04T16:25:09.1050000' AS DateTime2), NULL, NULL)
INSERT [dbo].[service_orders] ([id], [customer_id], [status], [total_amount], [payment_status], [order_datetime], [scheduled_datetime], [created_at], [updated_at], [city_name], [area_name]) VALUES (5, 1, N'Order Confirmed', CAST(50.00 AS Decimal(10, 2)), N'paid', CAST(N'2026-04-04T22:10:11.5833333' AS DateTime2), CAST(N'2026-04-13T10:12:00.0000000' AS DateTime2), CAST(N'2026-04-04T16:10:11.5790000' AS DateTime2), CAST(N'2026-04-04T16:31:15.6550000' AS DateTime2), NULL, NULL)
INSERT [dbo].[service_orders] ([id], [customer_id], [status], [total_amount], [payment_status], [order_datetime], [scheduled_datetime], [created_at], [updated_at], [city_name], [area_name]) VALUES (6, 1, N'Pending', CAST(50.00 AS Decimal(10, 2)), N'unpaid', CAST(N'2026-04-04T23:06:36.9333333' AS DateTime2), CAST(N'2026-04-08T11:07:00.0000000' AS DateTime2), CAST(N'2026-04-04T17:06:36.9100000' AS DateTime2), CAST(N'2026-04-04T17:06:37.0230000' AS DateTime2), NULL, NULL)
INSERT [dbo].[service_orders] ([id], [customer_id], [status], [total_amount], [payment_status], [order_datetime], [scheduled_datetime], [created_at], [updated_at], [city_name], [area_name]) VALUES (7, 1, N'Pending', CAST(50.00 AS Decimal(10, 2)), N'unpaid', CAST(N'2026-04-04T23:44:08.5333333' AS DateTime2), CAST(N'2026-04-09T11:43:00.0000000' AS DateTime2), CAST(N'2026-04-04T17:44:08.5100000' AS DateTime2), CAST(N'2026-04-04T17:44:08.6550000' AS DateTime2), NULL, NULL)
INSERT [dbo].[service_orders] ([id], [customer_id], [status], [total_amount], [payment_status], [order_datetime], [scheduled_datetime], [created_at], [updated_at], [city_name], [area_name]) VALUES (8, 1, N'Pending', CAST(50.00 AS Decimal(10, 2)), N'unpaid', CAST(N'2026-04-04T23:49:45.6466667' AS DateTime2), CAST(N'2026-04-17T11:49:00.0000000' AS DateTime2), CAST(N'2026-04-04T17:49:45.6410000' AS DateTime2), CAST(N'2026-04-04T17:49:45.7770000' AS DateTime2), NULL, NULL)
INSERT [dbo].[service_orders] ([id], [customer_id], [status], [total_amount], [payment_status], [order_datetime], [scheduled_datetime], [created_at], [updated_at], [city_name], [area_name]) VALUES (9, 1, N'Order Confirmed', CAST(50.00 AS Decimal(10, 2)), N'paid', CAST(N'2026-04-05T00:01:36.2966667' AS DateTime2), CAST(N'2026-04-08T12:01:00.0000000' AS DateTime2), CAST(N'2026-04-04T18:01:36.2650000' AS DateTime2), CAST(N'2026-04-04T18:13:23.6180000' AS DateTime2), NULL, NULL)
INSERT [dbo].[service_orders] ([id], [customer_id], [status], [total_amount], [payment_status], [order_datetime], [scheduled_datetime], [created_at], [updated_at], [city_name], [area_name]) VALUES (10, 2, N'Pending', CAST(50.00 AS Decimal(10, 2)), N'unpaid', CAST(N'2026-04-05T00:15:57.4633333' AS DateTime2), CAST(N'2026-04-09T12:15:00.0000000' AS DateTime2), CAST(N'2026-04-04T18:15:57.4590000' AS DateTime2), CAST(N'2026-04-04T18:15:57.5790000' AS DateTime2), NULL, NULL)
INSERT [dbo].[service_orders] ([id], [customer_id], [status], [total_amount], [payment_status], [order_datetime], [scheduled_datetime], [created_at], [updated_at], [city_name], [area_name]) VALUES (11, 2, N'Order Confirmed', CAST(50.00 AS Decimal(10, 2)), N'unpaid', CAST(N'2026-04-05T00:16:57.0333333' AS DateTime2), CAST(N'2026-04-23T12:16:00.0000000' AS DateTime2), CAST(N'2026-04-04T18:16:57.0280000' AS DateTime2), CAST(N'2026-04-04T18:34:38.7880000' AS DateTime2), NULL, NULL)
INSERT [dbo].[service_orders] ([id], [customer_id], [status], [total_amount], [payment_status], [order_datetime], [scheduled_datetime], [created_at], [updated_at], [city_name], [area_name]) VALUES (12, 1, N'Order Confirmed', CAST(50.00 AS Decimal(10, 2)), N'unpaid', CAST(N'2026-04-05T00:36:23.7866667' AS DateTime2), CAST(N'2026-04-27T12:38:00.0000000' AS DateTime2), CAST(N'2026-04-04T18:36:23.7550000' AS DateTime2), CAST(N'2026-04-04T19:22:59.2270000' AS DateTime2), NULL, NULL)
INSERT [dbo].[service_orders] ([id], [customer_id], [status], [total_amount], [payment_status], [order_datetime], [scheduled_datetime], [created_at], [updated_at], [city_name], [area_name]) VALUES (13, 5, N'Pending', CAST(50.00 AS Decimal(10, 2)), N'unpaid', CAST(N'2026-04-05T01:25:22.2200000' AS DateTime2), CAST(N'2026-04-22T13:24:00.0000000' AS DateTime2), CAST(N'2026-04-04T19:25:22.2140000' AS DateTime2), CAST(N'2026-04-04T19:25:22.3530000' AS DateTime2), NULL, NULL)
INSERT [dbo].[service_orders] ([id], [customer_id], [status], [total_amount], [payment_status], [order_datetime], [scheduled_datetime], [created_at], [updated_at], [city_name], [area_name]) VALUES (14, 1, N'Pending', CAST(5000.00 AS Decimal(10, 2)), N'unpaid', CAST(N'2026-04-06T01:08:54.6800000' AS DateTime2), CAST(N'2026-04-17T13:08:00.0000000' AS DateTime2), CAST(N'2026-04-05T19:08:54.6510000' AS DateTime2), CAST(N'2026-04-05T19:08:54.9500000' AS DateTime2), NULL, NULL)
INSERT [dbo].[service_orders] ([id], [customer_id], [status], [total_amount], [payment_status], [order_datetime], [scheduled_datetime], [created_at], [updated_at], [city_name], [area_name]) VALUES (15, 1, N'Order Confirmed', CAST(15000.00 AS Decimal(10, 2)), N'paid', CAST(N'2026-04-06T01:09:46.5433333' AS DateTime2), CAST(N'2026-04-25T13:09:00.0000000' AS DateTime2), CAST(N'2026-04-05T19:09:46.5350000' AS DateTime2), CAST(N'2026-04-05T19:11:10.9050000' AS DateTime2), NULL, NULL)
INSERT [dbo].[service_orders] ([id], [customer_id], [status], [total_amount], [payment_status], [order_datetime], [scheduled_datetime], [created_at], [updated_at], [city_name], [area_name]) VALUES (16, 1, N'Pending', CAST(50.00 AS Decimal(10, 2)), N'unpaid', CAST(N'2026-04-10T21:16:25.5600000' AS DateTime2), CAST(N'2026-04-15T09:15:00.0000000' AS DateTime2), CAST(N'2026-04-10T15:16:25.4650000' AS DateTime2), CAST(N'2026-04-10T15:16:25.8470000' AS DateTime2), NULL, NULL)
INSERT [dbo].[service_orders] ([id], [customer_id], [status], [total_amount], [payment_status], [order_datetime], [scheduled_datetime], [created_at], [updated_at], [city_name], [area_name]) VALUES (17, 1, N'Order Confirmed', CAST(2500.00 AS Decimal(10, 2)), N'paid', CAST(N'2026-04-10T21:17:55.8800000' AS DateTime2), CAST(N'2026-04-16T09:17:00.0000000' AS DateTime2), CAST(N'2026-04-10T15:17:55.7910000' AS DateTime2), CAST(N'2026-04-10T15:22:23.4800000' AS DateTime2), NULL, NULL)
INSERT [dbo].[service_orders] ([id], [customer_id], [status], [total_amount], [payment_status], [order_datetime], [scheduled_datetime], [created_at], [updated_at], [city_name], [area_name]) VALUES (18, 1, N'Order Confirmed', CAST(600.00 AS Decimal(10, 2)), N'unpaid', CAST(N'2026-04-10T22:19:25.4433333' AS DateTime2), CAST(N'2026-04-14T10:18:00.0000000' AS DateTime2), CAST(N'2026-04-10T16:19:25.3580000' AS DateTime2), CAST(N'2026-04-10T16:22:51.1860000' AS DateTime2), N'Dhaka Division', NULL)
INSERT [dbo].[service_orders] ([id], [customer_id], [status], [total_amount], [payment_status], [order_datetime], [scheduled_datetime], [created_at], [updated_at], [city_name], [area_name]) VALUES (19, 1, N'Pending', CAST(800.00 AS Decimal(10, 2)), N'unpaid', CAST(N'2026-04-11T01:58:04.8833333' AS DateTime2), CAST(N'2026-04-24T13:57:00.0000000' AS DateTime2), CAST(N'2026-04-10T19:58:04.8650000' AS DateTime2), CAST(N'2026-04-10T19:58:04.9800000' AS DateTime2), N'Dhaka Division', NULL)
SET IDENTITY_INSERT [dbo].[service_orders] OFF
GO
SET IDENTITY_INSERT [dbo].[service_provider_offerings] ON 

INSERT [dbo].[service_provider_offerings] ([id], [service_provider_id], [sub_service_id], [price_charged], [rating], [created_at], [updated_at]) VALUES (1, 1, 1, CAST(50.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(N'2026-04-02T07:12:27.9590000' AS DateTime2), CAST(N'2026-04-02T07:12:27.9590000' AS DateTime2))
INSERT [dbo].[service_provider_offerings] ([id], [service_provider_id], [sub_service_id], [price_charged], [rating], [created_at], [updated_at]) VALUES (2, 1, 2, CAST(50.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(N'2026-04-02T22:27:44.3130000' AS DateTime2), CAST(N'2026-04-02T22:27:44.3130000' AS DateTime2))
INSERT [dbo].[service_provider_offerings] ([id], [service_provider_id], [sub_service_id], [price_charged], [rating], [created_at], [updated_at]) VALUES (3, 1, 3, CAST(50.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(N'2026-04-02T23:17:57.3060000' AS DateTime2), CAST(N'2026-04-02T23:17:57.3060000' AS DateTime2))
INSERT [dbo].[service_provider_offerings] ([id], [service_provider_id], [sub_service_id], [price_charged], [rating], [created_at], [updated_at]) VALUES (4, 1, 4, CAST(50.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(N'2026-04-04T16:09:24.4140000' AS DateTime2), CAST(N'2026-04-04T16:09:24.4140000' AS DateTime2))
INSERT [dbo].[service_provider_offerings] ([id], [service_provider_id], [sub_service_id], [price_charged], [rating], [created_at], [updated_at]) VALUES (5, 1, 5, CAST(50.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(N'2026-04-04T16:10:11.6770000' AS DateTime2), CAST(N'2026-04-04T16:10:11.6770000' AS DateTime2))
INSERT [dbo].[service_provider_offerings] ([id], [service_provider_id], [sub_service_id], [price_charged], [rating], [created_at], [updated_at]) VALUES (6, 2, 6, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(N'2026-04-04T16:17:20.6770000' AS DateTime2), CAST(N'2026-04-04T16:17:20.6770000' AS DateTime2))
INSERT [dbo].[service_provider_offerings] ([id], [service_provider_id], [sub_service_id], [price_charged], [rating], [created_at], [updated_at]) VALUES (7, 2, 7, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(N'2026-04-04T16:17:20.7280000' AS DateTime2), CAST(N'2026-04-04T16:17:20.7280000' AS DateTime2))
INSERT [dbo].[service_provider_offerings] ([id], [service_provider_id], [sub_service_id], [price_charged], [rating], [created_at], [updated_at]) VALUES (8, 3, 7, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(N'2026-04-04T16:28:24.4780000' AS DateTime2), CAST(N'2026-04-04T16:28:24.4780000' AS DateTime2))
INSERT [dbo].[service_provider_offerings] ([id], [service_provider_id], [sub_service_id], [price_charged], [rating], [created_at], [updated_at]) VALUES (9, 3, 5, CAST(50.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(N'2026-04-04T16:29:36.0730000' AS DateTime2), CAST(N'2026-04-04T16:29:36.0730000' AS DateTime2))
INSERT [dbo].[service_provider_offerings] ([id], [service_provider_id], [sub_service_id], [price_charged], [rating], [created_at], [updated_at]) VALUES (10, 1, 8, CAST(50.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(N'2026-04-04T17:06:37.0160000' AS DateTime2), CAST(N'2026-04-04T17:06:37.0160000' AS DateTime2))
INSERT [dbo].[service_provider_offerings] ([id], [service_provider_id], [sub_service_id], [price_charged], [rating], [created_at], [updated_at]) VALUES (11, 1, 9, CAST(50.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(N'2026-04-04T17:44:08.6450000' AS DateTime2), CAST(N'2026-04-04T17:44:08.6450000' AS DateTime2))
INSERT [dbo].[service_provider_offerings] ([id], [service_provider_id], [sub_service_id], [price_charged], [rating], [created_at], [updated_at]) VALUES (12, 1, 10, CAST(50.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(N'2026-04-04T17:49:45.7660000' AS DateTime2), CAST(N'2026-04-04T17:49:45.7660000' AS DateTime2))
INSERT [dbo].[service_provider_offerings] ([id], [service_provider_id], [sub_service_id], [price_charged], [rating], [created_at], [updated_at]) VALUES (13, 3, 4, CAST(50.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(N'2026-04-04T18:13:23.6680000' AS DateTime2), CAST(N'2026-04-04T18:13:23.6680000' AS DateTime2))
INSERT [dbo].[service_provider_offerings] ([id], [service_provider_id], [sub_service_id], [price_charged], [rating], [created_at], [updated_at]) VALUES (14, 1, 11, CAST(50.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(N'2026-04-04T18:15:57.5700000' AS DateTime2), CAST(N'2026-04-04T18:15:57.5700000' AS DateTime2))
INSERT [dbo].[service_provider_offerings] ([id], [service_provider_id], [sub_service_id], [price_charged], [rating], [created_at], [updated_at]) VALUES (15, 3, 3, CAST(50.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(N'2026-04-04T19:22:55.4790000' AS DateTime2), CAST(N'2026-04-04T19:22:55.4790000' AS DateTime2))
INSERT [dbo].[service_provider_offerings] ([id], [service_provider_id], [sub_service_id], [price_charged], [rating], [created_at], [updated_at]) VALUES (16, 1, 12, CAST(50.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(N'2026-04-04T19:25:22.3410000' AS DateTime2), CAST(N'2026-04-04T19:25:22.3410000' AS DateTime2))
INSERT [dbo].[service_provider_offerings] ([id], [service_provider_id], [sub_service_id], [price_charged], [rating], [created_at], [updated_at]) VALUES (17, 1, 13, CAST(5000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(N'2026-04-05T19:08:54.9390000' AS DateTime2), CAST(N'2026-04-05T19:08:54.9390000' AS DateTime2))
INSERT [dbo].[service_provider_offerings] ([id], [service_provider_id], [sub_service_id], [price_charged], [rating], [created_at], [updated_at]) VALUES (18, 1, 14, CAST(15000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(N'2026-04-05T19:09:46.6390000' AS DateTime2), CAST(N'2026-04-05T19:09:46.6390000' AS DateTime2))
INSERT [dbo].[service_provider_offerings] ([id], [service_provider_id], [sub_service_id], [price_charged], [rating], [created_at], [updated_at]) VALUES (19, 3, 14, CAST(15000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(N'2026-04-05T19:10:55.3190000' AS DateTime2), CAST(N'2026-04-05T19:10:55.3190000' AS DateTime2))
INSERT [dbo].[service_provider_offerings] ([id], [service_provider_id], [sub_service_id], [price_charged], [rating], [created_at], [updated_at]) VALUES (20, 1, 15, CAST(2500.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(N'2026-04-10T15:17:56.4460000' AS DateTime2), CAST(N'2026-04-10T15:17:56.4460000' AS DateTime2))
INSERT [dbo].[service_provider_offerings] ([id], [service_provider_id], [sub_service_id], [price_charged], [rating], [created_at], [updated_at]) VALUES (21, 3, 15, CAST(2500.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(N'2026-04-10T15:21:36.3810000' AS DateTime2), CAST(N'2026-04-10T15:21:36.3810000' AS DateTime2))
INSERT [dbo].[service_provider_offerings] ([id], [service_provider_id], [sub_service_id], [price_charged], [rating], [created_at], [updated_at]) VALUES (22, 1, 16, CAST(600.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(N'2026-04-10T16:19:25.6730000' AS DateTime2), CAST(N'2026-04-10T16:19:25.6730000' AS DateTime2))
INSERT [dbo].[service_provider_offerings] ([id], [service_provider_id], [sub_service_id], [price_charged], [rating], [created_at], [updated_at]) VALUES (23, 1, 17, CAST(800.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(N'2026-04-10T19:58:04.9720000' AS DateTime2), CAST(N'2026-04-10T19:58:04.9720000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[service_provider_offerings] OFF
GO
SET IDENTITY_INSERT [dbo].[service_providers] ON 

INSERT [dbo].[service_providers] ([id], [full_name], [email], [phone], [address], [city], [rating], [nid], [service_area_id], [created_at], [updated_at], [region]) VALUES (1, N'System Provider', N'provider@example.com', N'00000000', N'N/A', N'Default City', CAST(5.00 AS Decimal(3, 2)), N'NID-1775113947', 1, CAST(N'2026-04-02T07:12:27.9230000' AS DateTime2), CAST(N'2026-04-10T19:53:41.0240000' AS DateTime2), NULL)
INSERT [dbo].[service_providers] ([id], [full_name], [email], [phone], [address], [city], [rating], [nid], [service_area_id], [created_at], [updated_at], [region]) VALUES (2, N'John Doe', N'johndoe@gmail.com', N'01456789234', N'xyz', N'Dhaka', CAST(5.00 AS Decimal(3, 2)), N'1307255', 1, CAST(N'2026-04-04T16:17:20.5110000' AS DateTime2), CAST(N'2026-04-04T16:17:20.5110000' AS DateTime2), N'Dhaka')
INSERT [dbo].[service_providers] ([id], [full_name], [email], [phone], [address], [city], [rating], [nid], [service_area_id], [created_at], [updated_at], [region]) VALUES (3, N'Abc XYZ', N'abc@example.com', N'01334567891', N'xyz', N'Sylhet', CAST(5.00 AS Decimal(3, 2)), N'1307256', 1, CAST(N'2026-04-04T16:28:24.4160000' AS DateTime2), CAST(N'2026-04-04T16:28:24.4160000' AS DateTime2), N'Sylhet')
SET IDENTITY_INSERT [dbo].[service_providers] OFF
GO
SET IDENTITY_INSERT [dbo].[sub_services] ON 

INSERT [dbo].[sub_services] ([id], [service_name], [description], [category_id], [created_at], [updated_at]) VALUES (1, N'beauty', N'Auto generated service', 1, CAST(N'2026-04-02T07:12:27.8830000' AS DateTime2), CAST(N'2026-04-02T07:12:27.8830000' AS DateTime2))
INSERT [dbo].[sub_services] ([id], [service_name], [description], [category_id], [created_at], [updated_at]) VALUES (2, N'maintenance', N'Auto generated service', 1, CAST(N'2026-04-02T22:27:44.2150000' AS DateTime2), CAST(N'2026-04-02T22:27:44.2150000' AS DateTime2))
INSERT [dbo].[sub_services] ([id], [service_name], [description], [category_id], [created_at], [updated_at]) VALUES (3, N'premium pest control', N'Auto generated service', 1, CAST(N'2026-04-02T23:17:57.2740000' AS DateTime2), CAST(N'2026-04-02T23:17:57.2740000' AS DateTime2))
INSERT [dbo].[sub_services] ([id], [service_name], [description], [category_id], [created_at], [updated_at]) VALUES (4, N'kitchen cleaning', N'Auto generated service', 1, CAST(N'2026-04-04T16:09:24.3380000' AS DateTime2), CAST(N'2026-04-04T16:09:24.3380000' AS DateTime2))
INSERT [dbo].[sub_services] ([id], [service_name], [description], [category_id], [created_at], [updated_at]) VALUES (5, N'tv repair', N'Auto generated service', 1, CAST(N'2026-04-04T16:10:11.6130000' AS DateTime2), CAST(N'2026-04-04T16:10:11.6130000' AS DateTime2))
INSERT [dbo].[sub_services] ([id], [service_name], [description], [category_id], [created_at], [updated_at]) VALUES (6, N'Home Cleaning', N'', 2, CAST(N'2026-04-04T16:17:20.6560000' AS DateTime2), CAST(N'2026-04-04T16:17:20.6560000' AS DateTime2))
INSERT [dbo].[sub_services] ([id], [service_name], [description], [category_id], [created_at], [updated_at]) VALUES (7, N'TV Repair', N'', 3, CAST(N'2026-04-04T16:17:20.7180000' AS DateTime2), CAST(N'2026-04-04T16:17:20.7180000' AS DateTime2))
INSERT [dbo].[sub_services] ([id], [service_name], [description], [category_id], [created_at], [updated_at]) VALUES (8, N'hair care', N'Auto generated service', 1, CAST(N'2026-04-04T17:06:36.9750000' AS DateTime2), CAST(N'2026-04-04T17:06:36.9750000' AS DateTime2))
INSERT [dbo].[sub_services] ([id], [service_name], [description], [category_id], [created_at], [updated_at]) VALUES (9, N'washing machine repair', N'Auto generated service', 1, CAST(N'2026-04-04T17:44:08.5850000' AS DateTime2), CAST(N'2026-04-04T17:44:08.5850000' AS DateTime2))
INSERT [dbo].[sub_services] ([id], [service_name], [description], [category_id], [created_at], [updated_at]) VALUES (10, N'renovation consultancy', N'Auto generated service', 1, CAST(N'2026-04-04T17:49:45.7010000' AS DateTime2), CAST(N'2026-04-04T17:49:45.7010000' AS DateTime2))
INSERT [dbo].[sub_services] ([id], [service_name], [description], [category_id], [created_at], [updated_at]) VALUES (11, N'oven repair', N'Auto generated service', 1, CAST(N'2026-04-04T18:15:57.5180000' AS DateTime2), CAST(N'2026-04-04T18:15:57.5180000' AS DateTime2))
INSERT [dbo].[sub_services] ([id], [service_name], [description], [category_id], [created_at], [updated_at]) VALUES (12, N'regular car wash', N'Auto generated service', 1, CAST(N'2026-04-04T19:25:22.2750000' AS DateTime2), CAST(N'2026-04-04T19:25:22.2750000' AS DateTime2))
INSERT [dbo].[sub_services] ([id], [service_name], [description], [category_id], [created_at], [updated_at]) VALUES (13, N'home makeover', N'Auto generated service', 1, CAST(N'2026-04-05T19:08:54.8140000' AS DateTime2), CAST(N'2026-04-05T19:08:54.8140000' AS DateTime2))
INSERT [dbo].[sub_services] ([id], [service_name], [description], [category_id], [created_at], [updated_at]) VALUES (14, N'tourist bus rental', N'Auto generated service', 1, CAST(N'2026-04-05T19:09:46.5790000' AS DateTime2), CAST(N'2026-04-05T19:09:46.5790000' AS DateTime2))
INSERT [dbo].[sub_services] ([id], [service_name], [description], [category_id], [created_at], [updated_at]) VALUES (15, N'ac repair', N'Auto generated service', 1, CAST(N'2026-04-10T15:17:56.2800000' AS DateTime2), CAST(N'2026-04-10T15:17:56.2800000' AS DateTime2))
INSERT [dbo].[sub_services] ([id], [service_name], [description], [category_id], [created_at], [updated_at]) VALUES (16, N'electrical repair', N'Auto generated service', 1, CAST(N'2026-04-10T16:19:25.5750000' AS DateTime2), CAST(N'2026-04-10T16:19:25.5750000' AS DateTime2))
INSERT [dbo].[sub_services] ([id], [service_name], [description], [category_id], [created_at], [updated_at]) VALUES (17, N'nail extension', N'Auto generated service', 1, CAST(N'2026-04-10T19:58:04.9270000' AS DateTime2), CAST(N'2026-04-10T19:58:04.9270000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[sub_services] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__customer__AB6E6164D657A977]    Script Date: 4/11/2026 2:32:46 AM ******/
ALTER TABLE [dbo].[customers] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__failed_j__7F427931464D13D1]    Script Date: 4/11/2026 2:32:46 AM ******/
ALTER TABLE [dbo].[failed_jobs] ADD UNIQUE NONCLUSTERED 
(
	[uuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__personal__CA90DA7A29D30CA4]    Script Date: 4/11/2026 2:32:46 AM ******/
ALTER TABLE [dbo].[personal_access_tokens] ADD UNIQUE NONCLUSTERED 
(
	[token] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [personal_access_tokens_tokenable_index]    Script Date: 4/11/2026 2:32:46 AM ******/
CREATE NONCLUSTERED INDEX [personal_access_tokens_tokenable_index] ON [dbo].[personal_access_tokens]
(
	[tokenable_type] ASC,
	[tokenable_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [ratings_reviews_customer_order_unique]    Script Date: 4/11/2026 2:32:46 AM ******/
ALTER TABLE [dbo].[ratings_reviews] ADD  CONSTRAINT [ratings_reviews_customer_order_unique] UNIQUE NONCLUSTERED 
(
	[customer_id] ASC,
	[service_order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [service_areas_city_area_unique]    Script Date: 4/11/2026 2:32:46 AM ******/
ALTER TABLE [dbo].[service_areas] ADD  CONSTRAINT [service_areas_city_area_unique] UNIQUE NONCLUSTERED 
(
	[city_name] ASC,
	[area_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [spo_provider_service_unique]    Script Date: 4/11/2026 2:32:46 AM ******/
ALTER TABLE [dbo].[service_provider_offerings] ADD  CONSTRAINT [spo_provider_service_unique] UNIQUE NONCLUSTERED 
(
	[service_provider_id] ASC,
	[sub_service_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__service___AB6E616444F4D798]    Script Date: 4/11/2026 2:32:46 AM ******/
ALTER TABLE [dbo].[service_providers] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__service___DF97D0F41DEB8647]    Script Date: 4/11/2026 2:32:46 AM ******/
ALTER TABLE [dbo].[service_providers] ADD UNIQUE NONCLUSTERED 
(
	[nid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [sub_services_category_service_unique]    Script Date: 4/11/2026 2:32:46 AM ******/
ALTER TABLE [dbo].[sub_services] ADD  CONSTRAINT [sub_services_category_service_unique] UNIQUE NONCLUSTERED 
(
	[category_id] ASC,
	[service_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__users__AB6E61648DEEEA5F]    Script Date: 4/11/2026 2:32:46 AM ******/
ALTER TABLE [dbo].[users] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[customers] ADD  DEFAULT (getdate()) FOR [date_registered]
GO
ALTER TABLE [dbo].[customers] ADD  DEFAULT ('user') FOR [role]
GO
ALTER TABLE [dbo].[failed_jobs] ADD  DEFAULT (getdate()) FOR [failed_at]
GO
ALTER TABLE [dbo].[notifications] ADD  DEFAULT ((0)) FOR [is_read]
GO
ALTER TABLE [dbo].[notifications] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[notifications] ADD  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[order_confirmations] ADD  DEFAULT ('pending') FOR [confirmation_status]
GO
ALTER TABLE [dbo].[order_confirmations] ADD  DEFAULT (getdate()) FOR [confirmed_at]
GO
ALTER TABLE [dbo].[order_items] ADD  DEFAULT ((1)) FOR [quantity]
GO
ALTER TABLE [dbo].[order_items] ADD  DEFAULT ('pending') FOR [item_status]
GO
ALTER TABLE [dbo].[payments] ADD  DEFAULT (getdate()) FOR [payment_datetime]
GO
ALTER TABLE [dbo].[payments] ADD  DEFAULT ((0.00)) FOR [payable_amount]
GO
ALTER TABLE [dbo].[ratings_reviews] ADD  DEFAULT (CONVERT([date],getdate())) FOR [review_date]
GO
ALTER TABLE [dbo].[service_orders] ADD  DEFAULT ('pending') FOR [status]
GO
ALTER TABLE [dbo].[service_orders] ADD  DEFAULT ((0.00)) FOR [total_amount]
GO
ALTER TABLE [dbo].[service_orders] ADD  DEFAULT ('unpaid') FOR [payment_status]
GO
ALTER TABLE [dbo].[service_orders] ADD  DEFAULT (getdate()) FOR [order_datetime]
GO
ALTER TABLE [dbo].[service_provider_offerings] ADD  DEFAULT ((0.00)) FOR [rating]
GO
ALTER TABLE [dbo].[service_providers] ADD  DEFAULT ((0.00)) FOR [rating]
GO
ALTER TABLE [dbo].[notifications]  WITH CHECK ADD  CONSTRAINT [FK_notifications_order] FOREIGN KEY([service_order_id])
REFERENCES [dbo].[service_orders] ([id])
GO
ALTER TABLE [dbo].[notifications] CHECK CONSTRAINT [FK_notifications_order]
GO
ALTER TABLE [dbo].[notifications]  WITH CHECK ADD  CONSTRAINT [notifications_customer_id_foreign] FOREIGN KEY([customer_id])
REFERENCES [dbo].[customers] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[notifications] CHECK CONSTRAINT [notifications_customer_id_foreign]
GO
ALTER TABLE [dbo].[order_confirmations]  WITH CHECK ADD  CONSTRAINT [FK_order_confirmations_order] FOREIGN KEY([service_order_id])
REFERENCES [dbo].[service_orders] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[order_confirmations] CHECK CONSTRAINT [FK_order_confirmations_order]
GO
ALTER TABLE [dbo].[order_items]  WITH CHECK ADD  CONSTRAINT [order_items_offering_id_foreign] FOREIGN KEY([service_provider_offering_id])
REFERENCES [dbo].[service_provider_offerings] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[order_items] CHECK CONSTRAINT [order_items_offering_id_foreign]
GO
ALTER TABLE [dbo].[order_items]  WITH CHECK ADD  CONSTRAINT [order_items_service_order_id_foreign] FOREIGN KEY([service_order_id])
REFERENCES [dbo].[service_orders] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[order_items] CHECK CONSTRAINT [order_items_service_order_id_foreign]
GO
ALTER TABLE [dbo].[payments]  WITH CHECK ADD  CONSTRAINT [payments_service_order_id_foreign] FOREIGN KEY([service_order_id])
REFERENCES [dbo].[service_orders] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[payments] CHECK CONSTRAINT [payments_service_order_id_foreign]
GO
ALTER TABLE [dbo].[ratings_reviews]  WITH CHECK ADD  CONSTRAINT [ratings_reviews_customer_id_foreign] FOREIGN KEY([customer_id])
REFERENCES [dbo].[customers] ([id])
GO
ALTER TABLE [dbo].[ratings_reviews] CHECK CONSTRAINT [ratings_reviews_customer_id_foreign]
GO
ALTER TABLE [dbo].[ratings_reviews]  WITH CHECK ADD  CONSTRAINT [ratings_reviews_order_id_foreign] FOREIGN KEY([service_order_id])
REFERENCES [dbo].[service_orders] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ratings_reviews] CHECK CONSTRAINT [ratings_reviews_order_id_foreign]
GO
ALTER TABLE [dbo].[ratings_reviews]  WITH CHECK ADD  CONSTRAINT [ratings_reviews_provider_id_foreign] FOREIGN KEY([service_provider_id])
REFERENCES [dbo].[service_providers] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ratings_reviews] CHECK CONSTRAINT [ratings_reviews_provider_id_foreign]
GO
ALTER TABLE [dbo].[service_orders]  WITH CHECK ADD  CONSTRAINT [service_orders_customer_id_foreign] FOREIGN KEY([customer_id])
REFERENCES [dbo].[customers] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[service_orders] CHECK CONSTRAINT [service_orders_customer_id_foreign]
GO
ALTER TABLE [dbo].[service_provider_offerings]  WITH CHECK ADD  CONSTRAINT [spo_provider_id_foreign] FOREIGN KEY([service_provider_id])
REFERENCES [dbo].[service_providers] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[service_provider_offerings] CHECK CONSTRAINT [spo_provider_id_foreign]
GO
ALTER TABLE [dbo].[service_provider_offerings]  WITH CHECK ADD  CONSTRAINT [spo_sub_service_id_foreign] FOREIGN KEY([sub_service_id])
REFERENCES [dbo].[sub_services] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[service_provider_offerings] CHECK CONSTRAINT [spo_sub_service_id_foreign]
GO
ALTER TABLE [dbo].[service_providers]  WITH CHECK ADD  CONSTRAINT [service_providers_service_area_id_foreign] FOREIGN KEY([service_area_id])
REFERENCES [dbo].[service_areas] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[service_providers] CHECK CONSTRAINT [service_providers_service_area_id_foreign]
GO
ALTER TABLE [dbo].[sub_services]  WITH CHECK ADD  CONSTRAINT [sub_services_category_id_foreign] FOREIGN KEY([category_id])
REFERENCES [dbo].[categories] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[sub_services] CHECK CONSTRAINT [sub_services_category_id_foreign]
GO
ALTER TABLE [dbo].[order_confirmations]  WITH CHECK ADD CHECK  (([confirmation_status]='cancelled' OR [confirmation_status]='confirmed' OR [confirmation_status]='pending'))
GO
USE [master]
GO
ALTER DATABASE [serviqo_s_df] SET  READ_WRITE 
GO
