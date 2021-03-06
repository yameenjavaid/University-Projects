USE [jjasek_a]
GO
/****** Object:  Table [dbo].[ReservationList]    Script Date: 10.05.2018 10:52:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReservationList](
	[ReservationListID] [bigint] IDENTITY(1,1) NOT NULL,
	[ReservationID] [bigint] NOT NULL,
	[EventID] [bigint] NOT NULL,
	[ReservedNormalSeats] [bigint] NOT NULL,
	[ReservedStudentSeats] [bigint] NOT NULL,
 CONSTRAINT [PK_RESERVATIONLIST] PRIMARY KEY CLUSTERED 
(
	[ReservationListID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ReservationList]  WITH CHECK ADD  CONSTRAINT [ReservationList_fk0] FOREIGN KEY([ReservationID])
REFERENCES [dbo].[Reservation] ([ReservationID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[ReservationList] CHECK CONSTRAINT [ReservationList_fk0]
GO
ALTER TABLE [dbo].[ReservationList]  WITH CHECK ADD  CONSTRAINT [ReservationList_fk1] FOREIGN KEY([EventID])
REFERENCES [dbo].[Event] ([EventID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[ReservationList] CHECK CONSTRAINT [ReservationList_fk1]
GO
ALTER TABLE [dbo].[ReservationList]  WITH CHECK ADD  CONSTRAINT [CK_ReservationList] CHECK  (([ReservedNormalSeats]>=(0) AND [ReservedStudentSeats]>=(0) AND ([ReservedNormalSeats]+[ReservedStudentSeats])>(0)))
GO
ALTER TABLE [dbo].[ReservationList] CHECK CONSTRAINT [CK_ReservationList]
GO
