USE [data_warehouse]
GO
/****** Object:  Table [dbo].[Actual_Dim]    Script Date: 10/29/2024 9:45:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Actual_Dim](
	[actual_id] [int] NOT NULL,
	[actualDeparture] [datetime] NULL,
	[actualArrival] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[actual_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Airline_Dim]    Script Date: 10/29/2024 9:45:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Airline_Dim](
	[IATA_code] [varchar](50) NOT NULL,
	[airline_name] [varchar](255) NULL,
	[country] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[IATA_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Destination_Dim]    Script Date: 10/29/2024 9:45:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Destination_Dim](
	[descity_id] [int] NOT NULL,
	[desairport_id] [int] NULL,
	[descity_name] [varchar](255) NULL,
	[desairport_name] [varchar](255) NULL,
	[DesGeocoded_City] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[descity_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fare_fact]    Script Date: 10/29/2024 9:45:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fare_fact](
	[fare_id] [int] NOT NULL,
	[flight_id] [int] NULL,
	[fare] [float] NULL,
	[passengers] [int] NULL,
	[farelow_id] [int] NULL,
	[farelg_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[fare_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Farelg_Dim]    Script Date: 10/29/2024 9:45:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Farelg_Dim](
	[farelg_id] [int] NOT NULL,
	[carrier_lg] [varchar](255) NULL,
	[large_ms] [float] NULL,
	[fare_lg] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[farelg_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Farelow_Dim]    Script Date: 10/29/2024 9:45:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Farelow_Dim](
	[farelow_id] [int] NOT NULL,
	[carrier_low] [varchar](100) NULL,
	[lf_ms] [float] NULL,
	[fare_low] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[farelow_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Flight_Dim]    Script Date: 10/29/2024 9:45:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Flight_Dim](
	[flight_id] [int] NOT NULL,
	[flight_number] [varchar](100) NULL,
	[tailNumber] [varchar](50) NULL,
	[aircraftType] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[flight_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Origin_Dim]    Script Date: 10/29/2024 9:45:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Origin_Dim](
	[origincity_id] [int] NOT NULL,
	[originairport_id] [int] NULL,
	[origincity_name] [varchar](255) NULL,
	[originairport_name] [varchar](255) NULL,
	[OriginGeocoded_City] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[origincity_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Route_fact]    Script Date: 10/29/2024 9:45:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Route_fact](
	[route_id] [int] NOT NULL,
	[descity_id] [int] NULL,
	[time_id] [int] NULL,
	[flight_id] [int] NULL,
	[origincity_id] [int] NULL,
	[distance] [float] NULL,
	[delayReason] [varchar](100) NULL,
	[cancelled] [bit] NULL,
	[diverted] [bit] NULL,
	[delayArrival] [int] NULL,
	[delayDeparture] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[route_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Schedule_Dim]    Script Date: 10/29/2024 9:45:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schedule_Dim](
	[schedule_id] [int] NOT NULL,
	[scheduledDeparture] [datetime] NULL,
	[scheduledArrival] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[schedule_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Time_Dim]    Script Date: 10/29/2024 9:45:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Time_Dim](
	[time_id] [int] NOT NULL,
	[taxin] [int] NULL,
	[taxiOut] [int] NULL,
	[schedule_id] [int] NULL,
	[actual_id] [int] NULL,
	[Year] [int] NULL,
	[quarter] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[time_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Fare_fact]  WITH CHECK ADD FOREIGN KEY([farelow_id])
REFERENCES [dbo].[Farelow_Dim] ([farelow_id])
GO
ALTER TABLE [dbo].[Fare_fact]  WITH CHECK ADD FOREIGN KEY([farelg_id])
REFERENCES [dbo].[Farelg_Dim] ([farelg_id])
GO
ALTER TABLE [dbo].[Fare_fact]  WITH CHECK ADD FOREIGN KEY([flight_id])
REFERENCES [dbo].[Flight_Dim] ([flight_id])
GO
ALTER TABLE [dbo].[Route_fact]  WITH CHECK ADD FOREIGN KEY([descity_id])
REFERENCES [dbo].[Destination_Dim] ([descity_id])
GO
ALTER TABLE [dbo].[Route_fact]  WITH CHECK ADD FOREIGN KEY([flight_id])
REFERENCES [dbo].[Flight_Dim] ([flight_id])
GO
ALTER TABLE [dbo].[Route_fact]  WITH CHECK ADD FOREIGN KEY([origincity_id])
REFERENCES [dbo].[Origin_Dim] ([origincity_id])
GO
ALTER TABLE [dbo].[Route_fact]  WITH CHECK ADD FOREIGN KEY([time_id])
REFERENCES [dbo].[Time_Dim] ([time_id])
GO
ALTER TABLE [dbo].[Time_Dim]  WITH NOCHECK ADD FOREIGN KEY([actual_id])
REFERENCES [dbo].[Actual_Dim] ([actual_id])
GO
ALTER TABLE [dbo].[Time_Dim]  WITH NOCHECK ADD FOREIGN KEY([schedule_id])
REFERENCES [dbo].[Schedule_Dim] ([schedule_id])
GO
