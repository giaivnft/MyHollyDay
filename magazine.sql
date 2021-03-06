USE [master]
GO
/****** Object:  Database [Magazine]    Script Date: 22-Apr-19 10:01:40 AM ******/
CREATE DATABASE [Magazine]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Magazine', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Magazine.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Magazine_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Magazine_log.ldf' , SIZE = 816KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Magazine] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Magazine].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Magazine] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Magazine] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Magazine] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Magazine] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Magazine] SET ARITHABORT OFF 
GO
ALTER DATABASE [Magazine] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Magazine] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Magazine] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Magazine] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Magazine] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Magazine] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Magazine] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Magazine] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Magazine] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Magazine] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Magazine] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Magazine] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Magazine] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Magazine] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Magazine] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Magazine] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Magazine] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Magazine] SET RECOVERY FULL 
GO
ALTER DATABASE [Magazine] SET  MULTI_USER 
GO
ALTER DATABASE [Magazine] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Magazine] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Magazine] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Magazine] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Magazine] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Magazine', N'ON'
GO
USE [Magazine]
GO
/****** Object:  Table [dbo].[Academy_info]    Script Date: 22-Apr-19 10:01:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Academy_info](
	[academic_id] [varchar](50) NOT NULL,
	[academic_year_from] [datetime] NULL,
	[academic_year_to] [datetime] NULL,
 CONSTRAINT [PK__Academy___CE79C974AC8F6E13] PRIMARY KEY CLUSTERED 
(
	[academic_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 22-Apr-19 10:01:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Admin](
	[admin_id] [varchar](50) NOT NULL,
	[admin_password] [varchar](50) NULL,
	[admin_name] [nvarchar](50) NULL,
	[admin_email] [nvarchar](50) NULL,
	[admin_phone] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[admin_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Article]    Script Date: 22-Apr-19 10:01:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Article](
	[article_id] [int] IDENTITY(1,1) NOT NULL,
	[student_id] [varchar](50) NULL,
	[period_id] [int] NULL,
	[article_tittle] [varchar](100) NULL,
	[arrticle_content] [nvarchar](max) NULL,
	[article_post_date] [datetime] NULL,
	[article_public_date] [datetime] NULL,
	[article_avatar_img] [varchar](100) NULL CONSTRAINT [df_avatar]  DEFAULT ('~/img/default.jpg'),
	[article_status] [varchar](20) NULL CONSTRAINT [DF__Article__article__164452B1]  DEFAULT ('Waiting'),
 CONSTRAINT [PK__Article__CC36F66052BF1609] PRIMARY KEY CLUSTERED 
(
	[article_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Faculty]    Script Date: 22-Apr-19 10:01:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Faculty](
	[faculty_id] [varchar](50) NOT NULL,
	[faculty_name] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[faculty_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[File_post]    Script Date: 22-Apr-19 10:01:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[File_post](
	[file_id] [int] IDENTITY(1,1) NOT NULL,
	[article_id] [int] NULL,
	[file_url] [varchar](500) NULL,
	[time_post] [datetime] NULL,
	[file_status] [varchar](20) NULL,
	[time_public] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[file_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Magazine_period]    Script Date: 22-Apr-19 10:01:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Magazine_period](
	[period_id] [int] IDENTITY(1,1) NOT NULL,
	[academic_id] [varchar](50) NULL,
	[period_name] [nvarchar](100) NULL,
	[closure_post_date] [datetime] NULL,
	[manager_set_name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[period_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Marketing_coordinator]    Script Date: 22-Apr-19 10:01:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Marketing_coordinator](
	[coordinator_id] [varchar](50) NOT NULL,
	[faculty_id] [varchar](50) NULL,
	[coor_password] [varchar](50) NULL,
	[coor_name] [nvarchar](50) NULL,
	[coor_email] [varchar](50) NULL,
	[coor_phone] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[coordinator_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Marketing_Manager]    Script Date: 22-Apr-19 10:01:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Marketing_Manager](
	[manager_id] [varchar](50) NOT NULL,
	[manager_password] [varchar](50) NULL,
	[manager_name] [varchar](50) NULL,
	[manager_email] [varchar](50) NULL,
	[manager_phone] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[manager_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Review]    Script Date: 22-Apr-19 10:01:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Review](
	[review_id] [int] IDENTITY(1,1) NOT NULL,
	[article_id] [int] NULL,
	[display_code] [int] NULL DEFAULT ('0'),
	[review_content] [nvarchar](max) NULL,
	[review_name] [nvarchar](50) NULL,
	[review_date] [datetime] NULL,
	[rating] [float] NULL DEFAULT ('0'),
PRIMARY KEY CLUSTERED 
(
	[review_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Student]    Script Date: 22-Apr-19 10:01:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Student](
	[student_id] [varchar](50) NOT NULL,
	[faculty_id] [varchar](50) NULL,
	[student_password] [varchar](50) NULL,
	[student_name] [nvarchar](50) NULL,
	[student_email] [nvarchar](50) NULL,
	[student_phone] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[student_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[CoordinatorHomePage]    Script Date: 22-Apr-19 10:01:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CoordinatorHomePage]
AS
SELECT DISTINCT 
                         dbo.Marketing_coordinator.coordinator_id, dbo.Marketing_coordinator.faculty_id, dbo.Marketing_coordinator.coor_name, dbo.Marketing_coordinator.coor_email, dbo.Student.student_id, dbo.Student.student_password, 
                         dbo.Student.faculty_id AS Expr1, dbo.Student.student_name, dbo.Student.student_email, dbo.Student.student_phone, dbo.File_post.file_id, dbo.File_post.article_id, dbo.File_post.file_url, dbo.File_post.time_post, 
                         dbo.File_post.file_status, dbo.File_post.time_public, dbo.Faculty.faculty_id AS Expr2, dbo.Faculty.faculty_name, dbo.Article.article_id AS Expr3, dbo.Article.student_id AS Expr4, dbo.Article.period_id, dbo.Article.article_tittle, 
                         dbo.Article.arrticle_content, dbo.Article.article_public_date, dbo.Article.article_post_date, dbo.Article.article_avatar_img, dbo.Article.article_status
FROM            dbo.Marketing_coordinator INNER JOIN
                         dbo.Faculty ON dbo.Marketing_coordinator.faculty_id = dbo.Faculty.faculty_id INNER JOIN
                         dbo.Student ON dbo.Faculty.faculty_id = dbo.Student.faculty_id INNER JOIN
                         dbo.Article INNER JOIN
                         dbo.File_post ON dbo.Article.article_id = dbo.File_post.article_id ON dbo.Student.student_id = dbo.Article.student_id

GO
/****** Object:  View [dbo].[ManagerPage]    Script Date: 22-Apr-19 10:01:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ManagerPage]
AS
SELECT DISTINCT 
                         dbo.File_post.file_id, dbo.File_post.article_id, dbo.File_post.file_url, dbo.File_post.time_post, dbo.File_post.time_public, dbo.File_post.file_status, dbo.Faculty.faculty_id, dbo.Faculty.faculty_name, 
                         dbo.Article.article_id AS Expr1, dbo.Article.student_id, dbo.Article.period_id, dbo.Article.article_tittle, dbo.Article.arrticle_content, dbo.Article.article_post_date, dbo.Article.article_public_date, dbo.Article.article_avatar_img, 
                         dbo.Article.article_status, dbo.Marketing_coordinator.coordinator_id, dbo.Marketing_coordinator.faculty_id AS Expr2, dbo.Marketing_coordinator.coor_name, dbo.Marketing_coordinator.coor_email, 
                         dbo.Student.student_id AS Expr3, dbo.Student.faculty_id AS Expr4, dbo.Student.student_password, dbo.Student.student_name, dbo.Student.student_email, dbo.Student.student_phone
FROM            dbo.Marketing_coordinator INNER JOIN
                         dbo.Faculty ON dbo.Marketing_coordinator.faculty_id = dbo.Faculty.faculty_id INNER JOIN
                         dbo.Student ON dbo.Faculty.faculty_id = dbo.Student.faculty_id INNER JOIN
                         dbo.Article INNER JOIN
                         dbo.File_post ON dbo.Article.article_id = dbo.File_post.article_id ON dbo.Student.student_id = dbo.Article.student_id

GO
/****** Object:  View [dbo].[StudentPostFile]    Script Date: 22-Apr-19 10:01:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[StudentPostFile]
AS
SELECT DISTINCT 
                         dbo.File_post.file_id, dbo.File_post.article_id, dbo.File_post.file_url, dbo.File_post.time_post, dbo.File_post.file_status, dbo.File_post.time_public, dbo.Article.student_id, dbo.Article.period_id, dbo.Article.article_tittle, 
                         dbo.Article.arrticle_content, dbo.Faculty.faculty_name, dbo.Article.article_avatar_img, dbo.Article.article_status, dbo.Article.article_post_date, dbo.Article.article_public_date, dbo.Student.student_name, 
                         dbo.Student.student_email, dbo.Magazine_period.closure_post_date, dbo.Magazine_period.period_name, dbo.Review.display_code, dbo.Review.review_content, dbo.Review.review_name, dbo.Review.review_date, 
                         dbo.Review.rating, dbo.Student.student_id AS Expr1, dbo.Article.article_id AS Expr2, dbo.Magazine_period.period_id AS Expr3, dbo.Review.review_id, dbo.Magazine_period.academic_id, dbo.Review.article_id AS Expr4
FROM            dbo.Marketing_coordinator INNER JOIN
                         dbo.Faculty ON dbo.Marketing_coordinator.faculty_id = dbo.Faculty.faculty_id INNER JOIN
                         dbo.Student ON dbo.Faculty.faculty_id = dbo.Student.faculty_id INNER JOIN
                         dbo.Review INNER JOIN
                         dbo.Academy_info INNER JOIN
                         dbo.File_post INNER JOIN
                         dbo.Article ON dbo.File_post.article_id = dbo.Article.article_id INNER JOIN
                         dbo.Magazine_period ON dbo.Article.period_id = dbo.Magazine_period.period_id ON dbo.Academy_info.academic_id = dbo.Magazine_period.academic_id ON dbo.Review.article_id = dbo.Article.article_id ON 
                         dbo.Student.student_id = dbo.Article.student_id CROSS JOIN
                         dbo.Admin CROSS JOIN
                         dbo.Marketing_Manager

GO
INSERT [dbo].[Academy_info] ([academic_id], [academic_year_from], [academic_year_to]) VALUES (N'NH2018', CAST(N'2018-01-01 00:00:00.000' AS DateTime), CAST(N'2019-01-01 00:00:00.000' AS DateTime))
INSERT [dbo].[Academy_info] ([academic_id], [academic_year_from], [academic_year_to]) VALUES (N'NH2019', CAST(N'2019-01-01 00:00:00.000' AS DateTime), CAST(N'2020-01-01 00:00:00.000' AS DateTime))
INSERT [dbo].[Admin] ([admin_id], [admin_password], [admin_name], [admin_email], [admin_phone]) VALUES (N'admin01', N'202cb962ac59075b964b07152d234b70', N'Robin', N'robin@fpt.edu.vn', N'09091181111')
INSERT [dbo].[Admin] ([admin_id], [admin_password], [admin_name], [admin_email], [admin_phone]) VALUES (N'admin02', N'202cb962ac59075b964b07152d234b70', N'Kane', N'kane@fpt.edu.vn', N'0908212441')
SET IDENTITY_INSERT [dbo].[Article] ON 

INSERT [dbo].[Article] ([article_id], [student_id], [period_id], [article_tittle], [arrticle_content], [article_post_date], [article_public_date], [article_avatar_img], [article_status]) VALUES (1, N'vinhttgcs', 1, N'Post for Magazine No.1', N'Example content', CAST(N'2019-03-11 16:40:00.000' AS DateTime), NULL, N'~/img/default.jpg', N'Waiting')
INSERT [dbo].[Article] ([article_id], [student_id], [period_id], [article_tittle], [arrticle_content], [article_post_date], [article_public_date], [article_avatar_img], [article_status]) VALUES (3, N'giaidvgcs', 1, N'[Magazine No.1]BakcLogTest', N'No thing', CAST(N'2019-04-22 06:39:47.507' AS DateTime), NULL, N'~/img/2019_04_22_39_47khucxuong.png', N'Waiting')
SET IDENTITY_INSERT [dbo].[Article] OFF
INSERT [dbo].[Faculty] ([faculty_id], [faculty_name]) VALUES (N'GBS', N'Business')
INSERT [dbo].[Faculty] ([faculty_id], [faculty_name]) VALUES (N'GCS', N'Information Technology')
INSERT [dbo].[Faculty] ([faculty_id], [faculty_name]) VALUES (N'GGD', N'Graphic Design')
SET IDENTITY_INSERT [dbo].[File_post] ON 

INSERT [dbo].[File_post] ([file_id], [article_id], [file_url], [time_post], [file_status], [time_public]) VALUES (1, 1, N'~/Attachment/Product backlog.docx', CAST(N'2019-03-11 16:40:00.000' AS DateTime), N'Editing', NULL)
INSERT [dbo].[File_post] ([file_id], [article_id], [file_url], [time_post], [file_status], [time_public]) VALUES (3, 3, N'~/Attachment/[giaidvgcs][[Magazine No.1]BakcLogTest[Product backlog.docx', CAST(N'2019-04-22 06:39:47.563' AS DateTime), N'Editing', NULL)
SET IDENTITY_INSERT [dbo].[File_post] OFF
SET IDENTITY_INSERT [dbo].[Magazine_period] ON 

INSERT [dbo].[Magazine_period] ([period_id], [academic_id], [period_name], [closure_post_date], [manager_set_name]) VALUES (1, N'NH2019', N'Magazine No.1', CAST(N'2019-05-01 00:00:00.000' AS DateTime), N'manager01')
SET IDENTITY_INSERT [dbo].[Magazine_period] OFF
INSERT [dbo].[Marketing_coordinator] ([coordinator_id], [faculty_id], [coor_password], [coor_name], [coor_email], [coor_phone]) VALUES (N'coor01', N'GCS', N'202cb962ac59075b964b07152d234b70', N'Dr.Josh', N'josh@fpt.edu.vn', N'0909113112')
INSERT [dbo].[Marketing_coordinator] ([coordinator_id], [faculty_id], [coor_password], [coor_name], [coor_email], [coor_phone]) VALUES (N'coor02', N'GBS', N'202cb962ac59075b964b07152d234b70', N'Dr.Long', N'long@fpt.edu.vn', N'0910211244')
INSERT [dbo].[Marketing_coordinator] ([coordinator_id], [faculty_id], [coor_password], [coor_name], [coor_email], [coor_phone]) VALUES (N'coor03', N'GGD', N'202cb962ac59075b964b07152d234b70', N'Dr.Lady Giga', N'ladygiga@fpt.edu.vn', N'0912412412')
INSERT [dbo].[Marketing_Manager] ([manager_id], [manager_password], [manager_name], [manager_email], [manager_phone]) VALUES (N'manager01', N'202cb962ac59075b964b07152d234b70', N'Dr.Hawaii', N'hawaii@fpt.edu.vn', N'0901989765')
SET IDENTITY_INSERT [dbo].[Review] ON 

INSERT [dbo].[Review] ([review_id], [article_id], [display_code], [review_content], [review_name], [review_date], [rating]) VALUES (1, 1, 0, N'I will check it tonight!', N'Dr.Josh', CAST(N'2019-03-12 12:20:00.000' AS DateTime), 3)
SET IDENTITY_INSERT [dbo].[Review] OFF
INSERT [dbo].[Student] ([student_id], [faculty_id], [student_password], [student_name], [student_email], [student_phone]) VALUES (N'giaidvgcs', N'GCS', N'202cb962ac59075b964b07152d234b70', N'Giai Dung', N'giaidung@gmail.com', N'0797753036')
INSERT [dbo].[Student] ([student_id], [faculty_id], [student_password], [student_name], [student_email], [student_phone]) VALUES (N'lamntk4@gmail.com', N'GGD', N'202cb962ac59075b964b07152d234b70', N'Lam Truong', N'lamntk4@gmail.com', N'0385902206')
INSERT [dbo].[Student] ([student_id], [faculty_id], [student_password], [student_name], [student_email], [student_phone]) VALUES (N'thanhhhgcs ', N'GBS', N'202cb962ac59075b964b07152d234b70', N'Thanh Ho', N'thanhdeptrai18@gmail.com', N'0389959970 ')
INSERT [dbo].[Student] ([student_id], [faculty_id], [student_password], [student_name], [student_email], [student_phone]) VALUES (N'vinhttgcs', N'GCS', N'202cb962ac59075b964b07152d234b70', N'Vinh Tran', N'vinhtien904@gmail.com', N'0906200508')
ALTER TABLE [dbo].[Article]  WITH CHECK ADD  CONSTRAINT [A_Maga] FOREIGN KEY([period_id])
REFERENCES [dbo].[Magazine_period] ([period_id])
GO
ALTER TABLE [dbo].[Article] CHECK CONSTRAINT [A_Maga]
GO
ALTER TABLE [dbo].[Article]  WITH CHECK ADD  CONSTRAINT [A_S] FOREIGN KEY([student_id])
REFERENCES [dbo].[Student] ([student_id])
GO
ALTER TABLE [dbo].[Article] CHECK CONSTRAINT [A_S]
GO
ALTER TABLE [dbo].[File_post]  WITH CHECK ADD  CONSTRAINT [F_A] FOREIGN KEY([article_id])
REFERENCES [dbo].[Article] ([article_id])
GO
ALTER TABLE [dbo].[File_post] CHECK CONSTRAINT [F_A]
GO
ALTER TABLE [dbo].[Magazine_period]  WITH CHECK ADD  CONSTRAINT [Maga_Aca] FOREIGN KEY([academic_id])
REFERENCES [dbo].[Academy_info] ([academic_id])
GO
ALTER TABLE [dbo].[Magazine_period] CHECK CONSTRAINT [Maga_Aca]
GO
ALTER TABLE [dbo].[Marketing_coordinator]  WITH CHECK ADD  CONSTRAINT [Mar_F] FOREIGN KEY([faculty_id])
REFERENCES [dbo].[Faculty] ([faculty_id])
GO
ALTER TABLE [dbo].[Marketing_coordinator] CHECK CONSTRAINT [Mar_F]
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [R_A] FOREIGN KEY([article_id])
REFERENCES [dbo].[Article] ([article_id])
GO
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [R_A]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [S_F] FOREIGN KEY([faculty_id])
REFERENCES [dbo].[Faculty] ([faculty_id])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [S_F]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Article"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 225
            End
            DisplayFlags = 280
            TopColumn = 5
         End
         Begin Table = "Faculty"
            Begin Extent = 
               Top = 6
               Left = 263
               Bottom = 102
               Right = 433
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "File_post"
            Begin Extent = 
               Top = 6
               Left = 471
               Bottom = 136
               Right = 641
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "Marketing_coordinator"
            Begin Extent = 
               Top = 6
               Left = 679
               Bottom = 176
               Right = 849
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Student"
            Begin Extent = 
               Top = 6
               Left = 887
               Bottom = 136
               Right = 1071
            End
            DisplayFlags = 280
            TopColumn = 2
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 28
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
  ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CoordinatorHomePage'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'       Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CoordinatorHomePage'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CoordinatorHomePage'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Article"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 225
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Faculty"
            Begin Extent = 
               Top = 6
               Left = 263
               Bottom = 102
               Right = 433
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "File_post"
            Begin Extent = 
               Top = 6
               Left = 471
               Bottom = 136
               Right = 641
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "Marketing_coordinator"
            Begin Extent = 
               Top = 6
               Left = 679
               Bottom = 136
               Right = 849
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "Student"
            Begin Extent = 
               Top = 6
               Left = 887
               Bottom = 136
               Right = 1071
            End
            DisplayFlags = 280
            TopColumn = 2
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 10
         Width = 284
         Width = 1500
         Width = 1500
         Width = 2010
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ManagerPage'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ManagerPage'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ManagerPage'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Marketing_coordinator"
            Begin Extent = 
               Top = 120
               Left = 38
               Bottom = 298
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Faculty"
            Begin Extent = 
               Top = 6
               Left = 715
               Bottom = 102
               Right = 885
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Student"
            Begin Extent = 
               Top = 138
               Left = 944
               Bottom = 268
               Right = 1128
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "Review"
            Begin Extent = 
               Top = 187
               Left = 467
               Bottom = 317
               Right = 637
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Academy_info"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 119
               Right = 236
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "File_post"
            Begin Extent = 
               Top = 6
               Left = 923
               Bottom = 136
               Right = 1093
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Article"
            Begin Extent = 
               Top = 4
               Left = 500
               Bottom = 134
               Right = 687
            End
            ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'StudentPostFile'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Magazine_period"
            Begin Extent = 
               Top = 102
               Left = 715
               Bottom = 232
               Right = 906
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Admin"
            Begin Extent = 
               Top = 6
               Left = 274
               Bottom = 136
               Right = 452
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Marketing_Manager"
            Begin Extent = 
               Top = 196
               Left = 251
               Bottom = 326
               Right = 442
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 31
         Width = 284
         Width = 1500
         Width = 1500
         Width = 2295
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1935
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'StudentPostFile'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'StudentPostFile'
GO
USE [master]
GO
ALTER DATABASE [Magazine] SET  READ_WRITE 
GO
