USE [jjasek_a]
GO
/****** Object:  UserDefinedFunction [dbo].[tabFunGetAttendedWorkshopsList]    Script Date: 10.05.2018 10:52:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION [dbo].[tabFunGetAttendedWorkshopsList]
(	
	-- Add the parameters for the function here
	@ParticipantID BigInt

)
RETURNS TABLE 
AS
RETURN 
(
	SELECT W.EventID, W.ConferenceDayID, W.BeginTime, W.EndTime, W.Price
	FROM Workshop W
	JOIN ReservationList RL ON RL.EventID = W.EventID
	JOIN ReservationListDetails RLD ON RLD.ReservationListID = RL.ReservationListID
	WHERE RLD.ParticipantID = @ParticipantID
)
GO
