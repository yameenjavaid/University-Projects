USE [jjasek_a]
GO
/****** Object:  Table [dbo].[ceny]    Script Date: 10.05.2018 10:52:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ceny](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[okresy_id] [int] NOT NULL,
	[pokoje_id] [int] NOT NULL,
	[cena] [decimal](6, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [ceny_FKIndex1]    Script Date: 10.05.2018 10:52:20 ******/
CREATE NONCLUSTERED INDEX [ceny_FKIndex1] ON [dbo].[ceny]
(
	[pokoje_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ceny_FKIndex2]    Script Date: 10.05.2018 10:52:20 ******/
CREATE NONCLUSTERED INDEX [ceny_FKIndex2] ON [dbo].[ceny]
(
	[okresy_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ceny]  WITH CHECK ADD FOREIGN KEY([okresy_id])
REFERENCES [dbo].[okresy] ([id])
GO
ALTER TABLE [dbo].[ceny]  WITH CHECK ADD FOREIGN KEY([pokoje_id])
REFERENCES [dbo].[pokoje] ([id])
GO
