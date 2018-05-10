USE [jjasek_a]
GO
/****** Object:  StoredProcedure [dbo].[RemoveConferenceDayPrice]    Script Date: 10.05.2018 10:52:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RemoveConferenceDayPrice](
	@ConferenceDayID bigint,
	@PriceDateLimit date)
AS BEGIN
	DELETE FROM ConferenceDayPrice WHERE ConferenceDayID=@ConferenceDayID AND PriceDateLimit=@PriceDateLimit
END
GO
