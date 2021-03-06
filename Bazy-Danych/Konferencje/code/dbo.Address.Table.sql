USE [jjasek_a]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 10.05.2018 10:52:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[AddressID] [bigint] IDENTITY(1,1) NOT NULL,
	[BuildingNumber] [nvarchar](50) NOT NULL,
	[StreetName] [nvarchar](300) NULL,
	[City] [nvarchar](300) NOT NULL,
	[PostalCode] [nvarchar](20) NULL,
	[Region] [nvarchar](200) NULL,
	[Country] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_ADDRESS] PRIMARY KEY CLUSTERED 
(
	[AddressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
