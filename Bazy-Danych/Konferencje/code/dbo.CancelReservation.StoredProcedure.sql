USE [jjasek_a]
GO
/****** Object:  StoredProcedure [dbo].[CancelReservation]    Script Date: 10.05.2018 10:52:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CancelReservation](
	@ReservationID bigint,
	@CancelDate datetime2)
AS BEGIN
	UPDATE Reservation
	SET CancelDate = @CancelDate, ReservationStatus = 'Canceled'
	WHERE ReservationID = @ReservationID

	DELETE FROM ReservationListDetails WHERE ReservationListDetails.ReservationListID IN(
		SELECT RLD.ReservationListID
		FROM Reservation R
		LEFT JOIN ReservationList RL ON R.ReservationID = RL.ReservationID
		LEFT JOIN ReservationListDetails RLD ON RLD.ReservationListID = RL.ReservationListID
		WHERE R.ReservationID = @ReservationID)
	
	DELETE FROM ReservationList WHERE ReservationList.ReservationListID IN(
		SELECT RL.ReservationListID
		FROM Reservation R
		LEFT JOIN ReservationList RL ON R.ReservationID = RL.ReservationID
		WHERE R.ReservationID = @ReservationID)
END
GO
