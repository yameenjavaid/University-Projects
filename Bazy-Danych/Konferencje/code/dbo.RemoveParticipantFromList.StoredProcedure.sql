USE [jjasek_a]
GO
/****** Object:  StoredProcedure [dbo].[RemoveParticipantFromList]    Script Date: 10.05.2018 10:52:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RemoveParticipantFromList](
	@ReservationListID bigint,
	@ParticipantID bigint)
AS BEGIN
DELETE FROM ReservationListDetails WHERE ParticipantID = @ParticipantID AND @ReservationListID = ReservationListID
END

GO
