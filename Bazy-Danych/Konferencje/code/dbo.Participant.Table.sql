USE [jjasek_a]
GO
/****** Object:  Table [dbo].[Participant]    Script Date: 10.05.2018 10:52:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Participant](
	[ParticipantID] [bigint] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](255) NOT NULL,
	[LastName] [nvarchar](255) NOT NULL,
	[AddressID] [bigint] NULL,
	[PhoneNumber] [nvarchar](50) NULL,
	[EmailAddress] [varchar](320) NULL,
 CONSTRAINT [PK_PARTICIPANT] PRIMARY KEY CLUSTERED 
(
	[ParticipantID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Participant]  WITH CHECK ADD  CONSTRAINT [Participant_fk0] FOREIGN KEY([AddressID])
REFERENCES [dbo].[Address] ([AddressID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Participant] CHECK CONSTRAINT [Participant_fk0]
GO
