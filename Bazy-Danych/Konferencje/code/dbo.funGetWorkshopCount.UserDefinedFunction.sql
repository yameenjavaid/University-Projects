USE [jjasek_a]
GO
/****** Object:  UserDefinedFunction [dbo].[funGetWorkshopCount]    Script Date: 10.05.2018 10:52:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[funGetWorkshopCount]
(
	@ParticipantID BigInt,
	@ConferenceDayID BigInt
)
RETURNS BigInt
AS
BEGIN
	-- Declare the return variable here
	DECLARE @WorkshopCount BigInt

	-- Add the T-SQL statements to compute the return value here
	SET @WorkshopCount = (
	SELECT COUNT(W.EventID)
		FROM Workshop W
		JOIN ReservationList RL ON W.EventID = RL.EventID
		JOIN ReservationListDetails RLD ON RLD.ReservationListID = RL.ReservationListID
		WHERE RLD.ParticipantID = @ParticipantID AND W.ConferenceDayID = @ConferenceDayID
	)
	-- Return the result of the function
	RETURN @WorkshopCount

END
GO
