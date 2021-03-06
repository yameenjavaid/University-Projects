USE [jjasek_a]
GO
/****** Object:  StoredProcedure [dbo].[AddCorporateCustomer]    Script Date: 10.05.2018 10:52:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddCorporateCustomer](
	@CompanyName nvarchar(500),
	@Representative nvarchar(500),
	@AddressID bigint,
	@PhoneNumber varchar(50),
	@Email varchar(320),
	@Notes nvarchar(1000),
	@TaxpayerNumber nvarchar(50),
	@TaxpayerNumberType nvarchar(100))
AS BEGIN
	DECLARE @CusID bigint
	BEGIN TRANSACTION
		ALTER TABLE Customer DISABLE TRIGGER [trg_Ctr_IU_CheckSpecifiedType];
		INSERT INTO Customer VALUES(@AddressID, @PhoneNumber, @Email, @Notes);
		SET @CusID = SCOPE_IDENTITY();
		INSERT INTO CorporateCustomer VALUES(@CusID, @CompanyName, @Representative);
		INSERT INTO ClientTaxpayerDetails VALUES(@CusID, @TaxpayerNumber, @TaxpayerNumberType);
		ALTER TABLE Customer ENABLE TRIGGER [trg_Ctr_IU_CheckSpecifiedType];
	COMMIT
END
GO
