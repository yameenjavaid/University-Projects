USE [jjasek_a]
GO
/****** Object:  StoredProcedure [dbo].[RemoveConference]    Script Date: 10.05.2018 10:52:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RemoveConference](
	@ConferenceID bigint)
AS BEGIN
	DECLARE @I bigint
	DECLARE cur CURSOR LOCAL FOR
			SELECT EventID
			FROM ConferenceDay
			WHERE ConferenceID=@ConferenceID
	OPEN cur;
	FETCH NEXT FROM cur INTO @I;
	WHILE @@FETCH_STATUS=0
	BEGIN
		EXEC [dbo].RemoveEvent @I;
		FETCH NEXT FROM cur INTO @I;
	END
	CLOSE cur;
	DEALLOCATE cur;
	DELETE FROM Conference WHERE ConferenceID = @ConferenceID
END

GO
