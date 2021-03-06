USE [jjasek_a]
GO
/****** Object:  View [dbo].[CustomersWithPayments]    Script Date: 10.05.2018 10:52:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CustomersWithPayments]
AS
	SELECT C.CustomerID, R.ReservationID, (dbo.funPriceForReservation(R.ReservationID) - ISNULL(SUM(P.Amount),0)) AS Amount
	FROM Customer C
	JOIN Reservation R ON R.CustomerID = C.CustomerID
	LEFT JOIN Payment P ON P.ReservationID = R.ReservationID
	GROUP BY C.CustomerID, R.ReservationID
GO
