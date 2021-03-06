USE [jjasek_a]
GO
/****** Object:  StoredProcedure [dbo].[EventsForConference]    Script Date: 10.05.2018 10:52:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EventsForConference](
	@ConferenceID bigint)
AS BEGIN
	SELECT E.Title, E.Description, CD.Date, E.AvailableSeats, A.BuildingNumber, A.StreetName, A.City
	FROM Conference C
	INNER JOIN ConferenceDay CD ON CD.ConferenceID = C.ConferenceID
	INNER JOIN Event E ON E.EventID = CD.EventID
	INNER JOIN Address A ON A.AddressID = E.AddressID
	WHERE C.ConferenceID = @ConferenceID
	UNION
	SELECT E2.Title, E2.Description, CD2.Date, E2.AvailableSeats, A2.BuildingNumber, A2.StreetName, A2.City
	FROM Conference C2
	INNER JOIN ConferenceDay CD2 ON CD2.ConferenceID = C2.ConferenceID
	INNER JOIN Workshop W ON W.ConferenceDayID = CD2.EventID
	INNER JOIN Event E2 ON E2.EventID = W.EventID
	INNER JOIN Address A2 ON A2.AddressID = E2.AddressID
	WHERE C2.ConferenceID = @ConferenceID
END
GO
