/******
Author: Ashish Kumar
Date: 24/02/2018
Purpose: Test
/******

USE [SQL Test New]
GO
/****** Object:  Table [dbo].[Train_Details]    Script Date: 27-02-2018 11:45:00 ******/
DROP TABLE [dbo].[Train_Details]
GO
/****** Object:  Table [dbo].[Station_Details]    Script Date: 27-02-2018 11:45:00 ******/
DROP TABLE [dbo].[Station_Details]
GO
/****** Object:  Table [dbo].[Journey_Details]    Script Date: 27-02-2018 11:45:00 ******/
DROP TABLE [dbo].[Journey_Details]
GO
/****** Object:  Table [dbo].[Journey_Details]    Script Date: 27-02-2018 11:45:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Journey_Details](
	[train_id] [int] NULL,
	[station_id] [int] NULL,
	[distance] [numeric](18, 0) NULL,
	[Schedule_Arrival(GMT)] [datetime] NULL,
	[Departure(GMT)] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Station_Details]    Script Date: 27-02-2018 11:45:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Station_Details](
	[station_id] [int] NULL,
	[station_name] [varchar](20) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Train_Details]    Script Date: 27-02-2018 11:45:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Train_Details](
	[train_id] [int] NULL,
	[train_name] [varchar](20) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Journey_Details] ([train_id], [station_id], [distance], [Schedule_Arrival(GMT)], [Departure(GMT)]) VALUES (11404, 101, CAST(0 AS Numeric(18, 0)), NULL, CAST(0x00009FE300317040 AS DateTime))
GO
INSERT [dbo].[Journey_Details] ([train_id], [station_id], [distance], [Schedule_Arrival(GMT)], [Departure(GMT)]) VALUES (11404, 103, CAST(750 AS Numeric(18, 0)), CAST(0x00009FE3009C8E20 AS DateTime), NULL)
GO
INSERT [dbo].[Journey_Details] ([train_id], [station_id], [distance], [Schedule_Arrival(GMT)], [Departure(GMT)]) VALUES (22505, 101, CAST(0 AS Numeric(18, 0)), NULL, CAST(0x00009FE30041EB00 AS DateTime))
GO
INSERT [dbo].[Journey_Details] ([train_id], [station_id], [distance], [Schedule_Arrival(GMT)], [Departure(GMT)]) VALUES (22505, 102, CAST(225 AS Numeric(18, 0)), CAST(0x00009FE3005AA320 AS DateTime), CAST(0x00009FE30062E080 AS DateTime))
GO
INSERT [dbo].[Journey_Details] ([train_id], [station_id], [distance], [Schedule_Arrival(GMT)], [Departure(GMT)]) VALUES (22505, 104, CAST(150 AS Numeric(18, 0)), CAST(0x00009FE300761A60 AS DateTime), CAST(0x00009FE3008116E0 AS DateTime))
GO
INSERT [dbo].[Journey_Details] ([train_id], [station_id], [distance], [Schedule_Arrival(GMT)], [Departure(GMT)]) VALUES (22505, 103, CAST(100 AS Numeric(18, 0)), CAST(0x00009FE3008C1360 AS DateTime), NULL)
GO
INSERT [dbo].[Journey_Details] ([train_id], [station_id], [distance], [Schedule_Arrival(GMT)], [Departure(GMT)]) VALUES (33606, 102, CAST(0 AS Numeric(18, 0)), NULL, CAST(0x00009FE300B12790 AS DateTime))
GO
INSERT [dbo].[Journey_Details] ([train_id], [station_id], [distance], [Schedule_Arrival(GMT)], [Departure(GMT)]) VALUES (33606, 104, CAST(150 AS Numeric(18, 0)), CAST(0x00009FE300DBBA00 AS DateTime), CAST(0x00009FE300E297D0 AS DateTime))
GO
INSERT [dbo].[Journey_Details] ([train_id], [station_id], [distance], [Schedule_Arrival(GMT)], [Departure(GMT)]) VALUES (33606, 103, CAST(100 AS Numeric(18, 0)), CAST(0x00009FE3011DA500 AS DateTime), NULL)
GO
INSERT [dbo].[Station_Details] ([station_id], [station_name]) VALUES (101, N'Delhi')
GO
INSERT [dbo].[Station_Details] ([station_id], [station_name]) VALUES (102, N'Aligarh')
GO
INSERT [dbo].[Station_Details] ([station_id], [station_name]) VALUES (103, N'Lucknow')
GO
INSERT [dbo].[Station_Details] ([station_id], [station_name]) VALUES (104, N'Kanpur')
GO
INSERT [dbo].[Train_Details] ([train_id], [train_name]) VALUES (11404, N'Shatabdi')
GO
INSERT [dbo].[Train_Details] ([train_id], [train_name]) VALUES (22505, N'Rajdhani')
GO
INSERT [dbo].[Train_Details] ([train_id], [train_name]) VALUES (33606, N'Passenger')
GO
