USE [jjasek_a]
GO
/****** Object:  Table [dbo].[okresy]    Script Date: 10.05.2018 10:52:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[okresy](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nazwa] [varchar](20) NULL,
	[data_od] [date] NULL,
	[data_do] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
