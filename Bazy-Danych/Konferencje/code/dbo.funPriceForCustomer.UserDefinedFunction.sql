USE [jjasek_a]
GO
/****** Object:  UserDefinedFunction [dbo].[funPriceForCustomer]    Script Date: 10.05.2018 10:52:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[funPriceForCustomer](@CusID bigint)
RETURNS money
AS BEGIN
	DECLARE @ret money
	SET @ret = (SELECT ISNULL(SUM(dbo.funPriceForReservation(Reservation.ReservationID)), 0)
				FROM Customer
				LEFT JOIN Reservation ON Reservation.CustomerID = Customer.CustomerID
				WHERE Customer.CustomerID = @CusID)
	RETURN @ret
END
GO
