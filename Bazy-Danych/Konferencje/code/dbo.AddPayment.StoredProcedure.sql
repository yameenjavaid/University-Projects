USE [jjasek_a]
GO
/****** Object:  StoredProcedure [dbo].[AddPayment]    Script Date: 10.05.2018 10:52:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddPayment](
	@ReservationID bigint,
	@Title nvarchar(255),
	@Amount money,
	@SenderName nvarchar(200),
	@SenderAccountNumber nvarchar(100),
	@ReceivedDate datetime2)
AS BEGIN
	INSERT INTO Payment VALUES(@ReservationID, @Title, @Amount, @SenderName, @SenderAccountNumber, @ReceivedDate)
END
GO
