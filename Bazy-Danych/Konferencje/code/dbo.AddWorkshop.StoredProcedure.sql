USE [jjasek_a]
GO
/****** Object:  StoredProcedure [dbo].[AddWorkshop]    Script Date: 10.05.2018 10:52:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddWorkshop](
	@ConferenceDayID bigint,
	@Price money,
	@BegTime time,
	@EndTime time,
	@Title nvarchar(255),
	@Description nvarchar(1000),
	@AvailableSeats bigint,
	@Address	bigint)
AS BEGIN
	INSERT INTO Event(Title, Description, AddressID, AvailableSeats)
	VALUES(@Title, @Description, @Address, @AvailableSeats);
	INSERT INTO Workshop VALUES(SCOPE_IDENTITY(), @ConferenceDayID, @Price, @BegTime, @EndTime)
END
GO
