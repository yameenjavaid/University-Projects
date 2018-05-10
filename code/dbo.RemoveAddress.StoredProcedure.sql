USE [jjasek_a]
GO
/****** Object:  StoredProcedure [dbo].[RemoveAddress]    Script Date: 10.05.2018 10:52:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RemoveAddress](
	@AddressID bigint)
AS BEGIN
	DELETE FROM Address WHERE Address.AddressID = @AddressID
END
GO
