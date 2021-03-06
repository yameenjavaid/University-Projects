USE [jjasek_a]
GO
/****** Object:  Table [dbo].[Workshop]    Script Date: 10.05.2018 10:52:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Workshop](
	[EventID] [bigint] NOT NULL,
	[ConferenceDayID] [bigint] NOT NULL,
	[Price] [money] NOT NULL,
	[BeginTime] [time](7) NOT NULL,
	[EndTime] [time](7) NOT NULL,
 CONSTRAINT [PK_WORKSHOP] PRIMARY KEY CLUSTERED 
(
	[EventID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IX_Workshop]    Script Date: 10.05.2018 10:52:20 ******/
CREATE NONCLUSTERED INDEX [IX_Workshop] ON [dbo].[Workshop]
(
	[ConferenceDayID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Workshop]  WITH CHECK ADD  CONSTRAINT [FK_WorkshopOrder] FOREIGN KEY([ConferenceDayID])
REFERENCES [dbo].[ConferenceDay] ([EventID])
GO
ALTER TABLE [dbo].[Workshop] CHECK CONSTRAINT [FK_WorkshopOrder]
GO
ALTER TABLE [dbo].[Workshop]  WITH CHECK ADD  CONSTRAINT [Workshop_fk0] FOREIGN KEY([EventID])
REFERENCES [dbo].[Event] ([EventID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Workshop] CHECK CONSTRAINT [Workshop_fk0]
GO
ALTER TABLE [dbo].[Workshop]  WITH CHECK ADD  CONSTRAINT [CK_Workshop] CHECK  (([BeginTime]<[EndTime]))
GO
ALTER TABLE [dbo].[Workshop] CHECK CONSTRAINT [CK_Workshop]
GO
ALTER TABLE [dbo].[Workshop]  WITH CHECK ADD  CONSTRAINT [CK_Workshop_Price] CHECK  (([Price]>=(0)))
GO
ALTER TABLE [dbo].[Workshop] CHECK CONSTRAINT [CK_Workshop_Price]
GO
