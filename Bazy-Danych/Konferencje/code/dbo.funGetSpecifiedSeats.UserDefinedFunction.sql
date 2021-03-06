USE [jjasek_a]
GO
/****** Object:  UserDefinedFunction [dbo].[funGetSpecifiedSeats]    Script Date: 10.05.2018 10:52:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[funGetSpecifiedSeats]
(
	-- Add the parameters for the function here
	@ReservationListID BigInt,
	@Type nvarchar(50)
)
RETURNS BigInt
AS
BEGIN
	-- Declare the return variable here
	DECLARE @SpecifiedSeats BigInt

	-- Add the T-SQL statements to compute the return value here
	SELECT @SpecifiedSeats = (SELECT COUNT(Rl.ParticipantID) FROM dbo.ReservationListDetails RL WHERE RL.ReservationListID = @ReservationListID AND RL.ReservationType = @Type)

	-- Return the result of the function
	RETURN @SpecifiedSeats

END
GO
