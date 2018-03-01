/******
Author: Ashish Kumar
Date: 24/02/2018
Purpose: Test
/******

USE [Optimus Information]
GO
ALTER TABLE [dbo].[Projects] DROP CONSTRAINT [FK__Projects__dept_i__31EC6D26]
GO
ALTER TABLE [dbo].[Employee_Project] DROP CONSTRAINT [FK__Employee___proj___35BCFE0A]
GO
ALTER TABLE [dbo].[Employee_Project] DROP CONSTRAINT [FK__Employee___emp_i__36B12243]
GO
ALTER TABLE [dbo].[Employee] DROP CONSTRAINT [FK__Employee__dept_i__2F10007B]
GO
/****** Object:  Table [dbo].[Projects]    Script Date: 27-02-2018 11:41:09 ******/
DROP TABLE [dbo].[Projects]
GO
/****** Object:  Table [dbo].[Employee_Project]    Script Date: 27-02-2018 11:41:09 ******/
DROP TABLE [dbo].[Employee_Project]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 27-02-2018 11:41:09 ******/
DROP TABLE [dbo].[Employee]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 27-02-2018 11:41:09 ******/
DROP TABLE [dbo].[Departments]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 27-02-2018 11:41:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Departments](
	[dept_id] [int] NOT NULL,
	[dept_name] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[dept_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 27-02-2018 11:41:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Employee](
	[emp_id] [int] NOT NULL,
	[first_name] [varchar](20) NULL,
	[last_name] [varchar](20) NULL,
	[mobile] [numeric](18, 0) NULL,
	[dept_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[emp_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Employee_Project]    Script Date: 27-02-2018 11:41:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee_Project](
	[proj_id] [int] NULL,
	[emp_id] [int] NULL,
	[work_date] [date] NULL,
	[work_hrs] [numeric](18, 0) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Projects]    Script Date: 27-02-2018 11:41:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Projects](
	[proj_id] [int] NOT NULL,
	[proj_name] [varchar](20) NULL,
	[dept_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[proj_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Departments] ([dept_id], [dept_name]) VALUES (101, N'HR')
GO
INSERT [dbo].[Departments] ([dept_id], [dept_name]) VALUES (102, N'Development')
GO
INSERT [dbo].[Departments] ([dept_id], [dept_name]) VALUES (103, N'Testing')
GO
INSERT [dbo].[Employee] ([emp_id], [first_name], [last_name], [mobile], [dept_id]) VALUES (1111, N'Ashish', N'Kumar', CAST(8298610675 AS Numeric(18, 0)), 102)
GO
INSERT [dbo].[Employee] ([emp_id], [first_name], [last_name], [mobile], [dept_id]) VALUES (1112, N'Akshay', N'Kumar', CAST(8244430675 AS Numeric(18, 0)), 103)
GO
INSERT [dbo].[Employee] ([emp_id], [first_name], [last_name], [mobile], [dept_id]) VALUES (1113, N'Abhishek', N'Kumar', CAST(8222111111 AS Numeric(18, 0)), 103)
GO
INSERT [dbo].[Employee] ([emp_id], [first_name], [last_name], [mobile], [dept_id]) VALUES (1114, N'Ravish', N'Kumar', CAST(8298555675 AS Numeric(18, 0)), 102)
GO
INSERT [dbo].[Employee] ([emp_id], [first_name], [last_name], [mobile], [dept_id]) VALUES (1115, N'Suraj', N'Kumar', CAST(8292222675 AS Numeric(18, 0)), 102)
GO
INSERT [dbo].[Employee] ([emp_id], [first_name], [last_name], [mobile], [dept_id]) VALUES (1116, N'James', N'Kumar', CAST(8298633335 AS Numeric(18, 0)), 103)
GO
INSERT [dbo].[Employee] ([emp_id], [first_name], [last_name], [mobile], [dept_id]) VALUES (1117, N'Robert', N'Kumar', CAST(8558610675 AS Numeric(18, 0)), 103)
GO
INSERT [dbo].[Employee] ([emp_id], [first_name], [last_name], [mobile], [dept_id]) VALUES (1118, N'Umang', N'Kumar', CAST(8298610675 AS Numeric(18, 0)), 102)
GO
INSERT [dbo].[Employee] ([emp_id], [first_name], [last_name], [mobile], [dept_id]) VALUES (1119, N'Nihal', N'Kumar', CAST(8298666675 AS Numeric(18, 0)), 103)
GO
INSERT [dbo].[Employee] ([emp_id], [first_name], [last_name], [mobile], [dept_id]) VALUES (1120, N'Shubham', N'Kumar', CAST(8278610675 AS Numeric(18, 0)), 103)
GO
INSERT [dbo].[Employee] ([emp_id], [first_name], [last_name], [mobile], [dept_id]) VALUES (1121, N'Harshit', N'Kumar', CAST(8298617775 AS Numeric(18, 0)), 102)
GO
INSERT [dbo].[Employee_Project] ([proj_id], [emp_id], [work_date], [work_hrs]) VALUES (11, 1111, CAST(0xE63D0B00 AS Date), CAST(8 AS Numeric(18, 0)))
GO
INSERT [dbo].[Employee_Project] ([proj_id], [emp_id], [work_date], [work_hrs]) VALUES (11, 1112, CAST(0xE73D0B00 AS Date), CAST(7 AS Numeric(18, 0)))
GO
INSERT [dbo].[Employee_Project] ([proj_id], [emp_id], [work_date], [work_hrs]) VALUES (12, 1113, CAST(0xE53D0B00 AS Date), CAST(6 AS Numeric(18, 0)))
GO
INSERT [dbo].[Employee_Project] ([proj_id], [emp_id], [work_date], [work_hrs]) VALUES (12, 1114, CAST(0xE33D0B00 AS Date), CAST(9 AS Numeric(18, 0)))
GO
INSERT [dbo].[Employee_Project] ([proj_id], [emp_id], [work_date], [work_hrs]) VALUES (13, 1115, CAST(0xE23D0B00 AS Date), CAST(10 AS Numeric(18, 0)))
GO
INSERT [dbo].[Employee_Project] ([proj_id], [emp_id], [work_date], [work_hrs]) VALUES (13, 1116, CAST(0xE13D0B00 AS Date), CAST(12 AS Numeric(18, 0)))
GO
INSERT [dbo].[Employee_Project] ([proj_id], [emp_id], [work_date], [work_hrs]) VALUES (13, 1117, CAST(0xE63D0B00 AS Date), CAST(3 AS Numeric(18, 0)))
GO
INSERT [dbo].[Employee_Project] ([proj_id], [emp_id], [work_date], [work_hrs]) VALUES (14, 1118, CAST(0xDE3D0B00 AS Date), CAST(6 AS Numeric(18, 0)))
GO
INSERT [dbo].[Employee_Project] ([proj_id], [emp_id], [work_date], [work_hrs]) VALUES (14, 1119, CAST(0xDC3D0B00 AS Date), CAST(5 AS Numeric(18, 0)))
GO
INSERT [dbo].[Employee_Project] ([proj_id], [emp_id], [work_date], [work_hrs]) VALUES (15, 1120, CAST(0xDB3D0B00 AS Date), CAST(8 AS Numeric(18, 0)))
GO
INSERT [dbo].[Employee_Project] ([proj_id], [emp_id], [work_date], [work_hrs]) VALUES (15, 1121, CAST(0xDA3D0B00 AS Date), CAST(9 AS Numeric(18, 0)))
GO
INSERT [dbo].[Employee_Project] ([proj_id], [emp_id], [work_date], [work_hrs]) VALUES (16, 1116, CAST(0xD93D0B00 AS Date), CAST(8 AS Numeric(18, 0)))
GO
INSERT [dbo].[Employee_Project] ([proj_id], [emp_id], [work_date], [work_hrs]) VALUES (16, 1113, CAST(0xD83D0B00 AS Date), CAST(10 AS Numeric(18, 0)))
GO
INSERT [dbo].[Employee_Project] ([proj_id], [emp_id], [work_date], [work_hrs]) VALUES (17, 1111, CAST(0xD73D0B00 AS Date), CAST(11 AS Numeric(18, 0)))
GO
INSERT [dbo].[Employee_Project] ([proj_id], [emp_id], [work_date], [work_hrs]) VALUES (17, 1112, CAST(0xD63D0B00 AS Date), CAST(7 AS Numeric(18, 0)))
GO
INSERT [dbo].[Employee_Project] ([proj_id], [emp_id], [work_date], [work_hrs]) VALUES (17, 1115, CAST(0xD53D0B00 AS Date), CAST(6 AS Numeric(18, 0)))
GO
INSERT [dbo].[Projects] ([proj_id], [proj_name], [dept_id]) VALUES (11, N'Aptus', 102)
GO
INSERT [dbo].[Projects] ([proj_id], [proj_name], [dept_id]) VALUES (12, N'Machine Opti', 103)
GO
INSERT [dbo].[Projects] ([proj_id], [proj_name], [dept_id]) VALUES (13, N'AI', 102)
GO
INSERT [dbo].[Projects] ([proj_id], [proj_name], [dept_id]) VALUES (14, N'Website A', 103)
GO
INSERT [dbo].[Projects] ([proj_id], [proj_name], [dept_id]) VALUES (15, N'Mob D', 103)
GO
INSERT [dbo].[Projects] ([proj_id], [proj_name], [dept_id]) VALUES (16, N'VR', 102)
GO
INSERT [dbo].[Projects] ([proj_id], [proj_name], [dept_id]) VALUES (17, N'VRDXS', 102)
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD FOREIGN KEY([dept_id])
REFERENCES [dbo].[Departments] ([dept_id])
GO
ALTER TABLE [dbo].[Employee_Project]  WITH CHECK ADD FOREIGN KEY([emp_id])
REFERENCES [dbo].[Employee] ([emp_id])
GO
ALTER TABLE [dbo].[Employee_Project]  WITH CHECK ADD FOREIGN KEY([proj_id])
REFERENCES [dbo].[Projects] ([proj_id])
GO
ALTER TABLE [dbo].[Projects]  WITH CHECK ADD FOREIGN KEY([dept_id])
REFERENCES [dbo].[Departments] ([dept_id])
GO
