USE [jjasek_a]
GO
/****** Object:  StoredProcedure [dbo].[Ewaluacja]    Script Date: 10.05.2018 10:52:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Ewaluacja](@pid int, @bdate date, @edate date)
AS BEGIN
		SELECT TOP 1 p2.id AS [Id pokoju], p2.nazwa AS [Nazwa pok], @bdate AS [Pobyt Od], @edate AS [Pobyt Do], (DATEDIFF(d, @bdate, @edate) + 1) AS [Liczba dni],
				(SELECT SUM(dbo.liczbaDniWOkresie(o1.data_od, o1.data_do, @bdate, @edate) * c1.cena)
					FROM pokoje p1
					JOIN ceny c1 ON p1.id = c1.pokoje_id
					JOIN okresy o1 ON o1.id = c1.okresy_id
					WHERE p1.id = @pid)  AS wartosc
		FROM pokoje p2
		WHERE p2.id = @pid
END
GO
