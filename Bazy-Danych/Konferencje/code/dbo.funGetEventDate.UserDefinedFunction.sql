USE [jjasek_a]
GO
/****** Object:  UserDefinedFunction [dbo].[funGetEventDate]    Script Date: 10.05.2018 10:52:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[funGetEventDate]
(
	-- Add the parameters for the function here
	@EventID BigInt
)
RETURNS Date
AS
BEGIN
	-- Declare the return variable here
	Declare @workshop Bit
	SET @workshop = dbo.funIsWorkshop(@EventID)
	IF @workshop = 1
		RETURN (SELECT CD.Date FROM Workshop W JOIN ConferenceDay CD ON W.ConferenceDayID = CD.ConferenceID WHERE W.EventID = @EventID)
	 
	RETURN (SELECT CD.Date FROM ConferenceDay CD WHERE CD.EventID = @EventID)
END 
GO
