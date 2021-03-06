USE [jjasek_a]
GO
/****** Object:  UserDefinedFunction [dbo].[funPriceForReservation]    Script Date: 10.05.2018 10:52:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[funPriceForReservation](@ResID bigint)
RETURNS money
AS BEGIN
	DECLARE @ret money
	SET @ret = (SELECT ISNULL(SUM(dbo.funPriceForReservationList(ReservationList.ReservationListID)),0)
				FROM Reservation
				LEFT JOIN ReservationList ON Reservation.ReservationID = ReservationList.ReservationID
				WHERE Reservation.ReservationID = @ResID)
	RETURN @ret
END
GO
