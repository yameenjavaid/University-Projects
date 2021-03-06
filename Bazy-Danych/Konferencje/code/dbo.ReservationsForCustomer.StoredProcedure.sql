USE [jjasek_a]
GO
/****** Object:  StoredProcedure [dbo].[ReservationsForCustomer]    Script Date: 10.05.2018 10:52:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ReservationsForCustomer] (@CusID bigint)
AS BEGIN
	SELECT ReservationID, PurchaseDate, CancelDate, ReservationStatus, ClientNote FROM Reservation
	WHERE CustomerID = @CusID
END
GO
