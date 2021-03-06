USE [jjasek_a]
GO
/****** Object:  Table [dbo].[StudentCard]    Script Date: 10.05.2018 10:52:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentCard](
	[StudentCardID] [bigint] IDENTITY(1,1) NOT NULL,
	[ParticipantID] [bigint] NOT NULL,
	[CardNumber] [varchar](255) NOT NULL,
	[EntryDate] [date] NULL,
	[ExpiryDate] [date] NOT NULL,
 CONSTRAINT [PK_STUDENTCARD] PRIMARY KEY CLUSTERED 
(
	[StudentCardID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_StudentCard]    Script Date: 10.05.2018 10:52:20 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_StudentCard] ON [dbo].[StudentCard]
(
	[CardNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[StudentCard]  WITH CHECK ADD  CONSTRAINT [StudentCard_fk0] FOREIGN KEY([ParticipantID])
REFERENCES [dbo].[Participant] ([ParticipantID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[StudentCard] CHECK CONSTRAINT [StudentCard_fk0]
GO
ALTER TABLE [dbo].[StudentCard]  WITH CHECK ADD  CONSTRAINT [CK_StudentCard] CHECK  (([EntryDate]<[ExpiryDate]))
GO
ALTER TABLE [dbo].[StudentCard] CHECK CONSTRAINT [CK_StudentCard]
GO
