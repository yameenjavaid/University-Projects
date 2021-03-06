USE [jjasek_a]
GO
/****** Object:  Table [dbo].[CustomerTaxpayerDetails]    Script Date: 10.05.2018 10:52:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerTaxpayerDetails](
	[CustomerID] [bigint] NOT NULL,
	[TaxpayerNumber] [nvarchar](50) NOT NULL,
	[TaxpayerNumberType] [nvarchar](100) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CustomerTaxpayerDetails]  WITH CHECK ADD  CONSTRAINT [FK_CustomerTaxpayerDetails_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[CustomerTaxpayerDetails] CHECK CONSTRAINT [FK_CustomerTaxpayerDetails_Customer]
GO
