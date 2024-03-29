IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserDetails_AspNetUsers]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserDetails]'))
ALTER TABLE [dbo].[UserDetails] DROP CONSTRAINT [FK_UserDetails_AspNetUsers]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Reservations_OwnerAssets]') AND parent_object_id = OBJECT_ID(N'[dbo].[Reservations]'))
ALTER TABLE [dbo].[Reservations] DROP CONSTRAINT [FK_Reservations_OwnerAssets]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Reservations_Locations]') AND parent_object_id = OBJECT_ID(N'[dbo].[Reservations]'))
ALTER TABLE [dbo].[Reservations] DROP CONSTRAINT [FK_Reservations_Locations]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OwnerAssets_UserDetails]') AND parent_object_id = OBJECT_ID(N'[dbo].[OwnerAssets]'))
ALTER TABLE [dbo].[OwnerAssets] DROP CONSTRAINT [FK_OwnerAssets_UserDetails]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins] DROP CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]'))
ALTER TABLE [dbo].[AspNetUserClaims] DROP CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 5/6/2020 9:51:36 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserDetails]') AND type in (N'U'))
DROP TABLE [dbo].[UserDetails]
GO
/****** Object:  Table [dbo].[Reservations]    Script Date: 5/6/2020 9:51:36 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Reservations]') AND type in (N'U'))
DROP TABLE [dbo].[Reservations]
GO
/****** Object:  Table [dbo].[OwnerAssets]    Script Date: 5/6/2020 9:51:36 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OwnerAssets]') AND type in (N'U'))
DROP TABLE [dbo].[OwnerAssets]
GO
/****** Object:  Table [dbo].[Locations]    Script Date: 5/6/2020 9:51:36 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Locations]') AND type in (N'U'))
DROP TABLE [dbo].[Locations]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 5/6/2020 9:51:36 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUsers]') AND type in (N'U'))
DROP TABLE [dbo].[AspNetUsers]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 5/6/2020 9:51:36 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
DROP TABLE [dbo].[AspNetUserRoles]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 5/6/2020 9:51:36 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type in (N'U'))
DROP TABLE [dbo].[AspNetUserLogins]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 5/6/2020 9:51:36 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type in (N'U'))
DROP TABLE [dbo].[AspNetUserClaims]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 5/6/2020 9:51:36 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetRoles]') AND type in (N'U'))
DROP TABLE [dbo].[AspNetRoles]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 5/6/2020 9:51:36 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[__MigrationHistory]') AND type in (N'U'))
DROP TABLE [dbo].[__MigrationHistory]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 5/6/2020 9:51:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[__MigrationHistory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 5/6/2020 9:51:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 5/6/2020 9:51:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 5/6/2020 9:51:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 5/6/2020 9:51:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 5/6/2020 9:51:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUsers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Locations]    Script Date: 5/6/2020 9:51:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Locations]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Locations](
	[LocationId] [int] IDENTITY(1,1) NOT NULL,
	[LocationName] [varchar](50) NOT NULL,
	[Address] [varchar](100) NOT NULL,
	[City] [varchar](100) NOT NULL,
	[State] [char](2) NOT NULL,
	[ZipCode] [char](5) NOT NULL,
	[ReservationLimit] [tinyint] NOT NULL,
 CONSTRAINT [PK_Locations] PRIMARY KEY CLUSTERED 
(
	[LocationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OwnerAssets]    Script Date: 5/6/2020 9:51:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OwnerAssets]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[OwnerAssets](
	[OwnerAssetId] [int] IDENTITY(1,1) NOT NULL,
	[AssetName] [varchar](50) NOT NULL,
	[OwnerId] [nvarchar](128) NOT NULL,
	[AssetPhoto] [varchar](50) NULL,
	[SpecialNotes] [varchar](300) NULL,
	[IsActive] [bit] NOT NULL,
	[DateAdded] [date] NOT NULL,
 CONSTRAINT [PK_OwnerAssets] PRIMARY KEY CLUSTERED 
(
	[OwnerAssetId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Reservations]    Script Date: 5/6/2020 9:51:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Reservations]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Reservations](
	[ReservationId] [int] IDENTITY(1,1) NOT NULL,
	[OwnerAssetId] [int] NOT NULL,
	[LocationId] [int] NOT NULL,
	[ReservationDate] [date] NOT NULL,
 CONSTRAINT [PK_Reservations] PRIMARY KEY CLUSTERED 
(
	[ReservationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 5/6/2020 9:51:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserDetails]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserDetails](
	[UserId] [nvarchar](128) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_UserDetails] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202004271946393_InitialCreate', N'Reservations.UI.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5CDB6EE336107D2FD07F10F4D416A9954B77B10DEC2EB24ED206DD5CB04E8ABE2D688976849528AD44651314FDB23EF493FA0B1D4AD48D175D6CC57616058A581C9E190E879CE170B8FFFDF3EFF8EDA3EF190F388ADD804CCC83D1BE696062078E4B961333A18B1FDF986F7FF9F69BF199E33F1A7FE474478C0E7A927862DE531A1E5B566CDF631FC523DFB5A3200E16746407BE859CC03ADCDFFFD93A38B0304098806518E30F09A1AE8FD31FF0731A101B873441DE65E0602FE6DFA16596A21A57C8C771886C3C313FE018470F88821CF1E8EE6294F5308D13CF4520CD0C7B0BD340840434A539BE8BF18C460159CE42F880BCDBA71003DD027931E663382EC9BB0E67FF900DC72A3BE6507612D3C0EF097870C4F56389DD57D2B259E80F3478069AA64F6CD4A91627E68583D34F1F020F1420323C9E7A11239E9897058B9338BCC27494771C6590E711C07D09A24FA32AE29ED1B9DF5E614F87A37DF6DF9E314D3C9A447842704223E4ED1937C9DC73EDDFF1D36DF00993C9D1C17C71F4E6D56BE41CBDFE091FBDAA8E14C60A74B50FF0E9260A421C816C78518CDF34AC7A3F4BEC5874ABF4C9B402B6044BC3342ED1E37B4C96F41E16CDE11BD338771FB1937FE1C675475C5849D0894609FCBC4A3C0FCD3D5CB45B8D3CD9FF1BB81EBE7A3D08D72BF4E02ED3A917F8C3C289605D7DC05EB6D8EEDD305B5EB5F9FEC8C9CEA3C067BFEBF695B57E9C054964B3C1045A925B142D31AD4B37B64AE3ED64D20C6A78B3CE5177DFB499A4B2792B49D980565909398B4DAF865CDEE7E5DBD9E24EC210262F352DA6912683533BAC9180B0670874A5091D7435210243FB9A77C4331FB9DE005B62072E10912CDCC8C7C528DF05608088F496F906C531EC08CE6F28BE6F101DFE1C40F419B693080C7546911F3E3BB79BFB80E0ABC49F33FBDF1CAFC1A6E6F64B708E6C1A446784F55A1BEF7D607F0A127A469C5344F11DB57340F6F3D6F5BB030C22CE896DE3383E0763C6CE3480803B07BC20F4E8B0371CDBA4B61D924C3DE4FAEA9844D84E3FE6A4655CA2A69062130D992A3E6912F57DB0744937517352BDA81945ABA89CACAFA80CAC9BA49C522F684AD02A67463558C497CED0F0215F0ABBFB31DF7ACE5BB71754D438831D12FF8A098E601B736E10A53822E50C74D937B6112CA4D3C7983EBB6F4A39FD81BC6468562BAD867413187E35A4B0BBBF1A5231E1F383EBB0A8A4C341282706F84EF4EA3356FB9A1324DBF472A80D73D3CC37B307E896CB491C07B69BAE02450A8C2730EAF2430C67B46733B2D1881911181818BACB5C1E7C81B199A2515D9353EC618A8D133B4B114E516C234756230CC8E92158EE511582959991BA703F483CC1D271C43A2176088A61A5BA84CACBC225B61B22AF554B42CF8E2E8C8DBDE021B69CE21013C6B055135D98AB13214C80828F30296D1A1A5B158B6B36444DD4AA9BF3B610B69C77293FB1119B6C899D3576C9E3B76731CC668D6DC0389B55D245006D526F1B06CACF2A5D0D403CB8EC9A810A27268D81F2906A23065AD7D8160CB4AE921767A0D911B5EBFC0BE7D55D33CFFA4179F36EBD515D5BB0CD9A3E76CC34B3D813FA50E88123D93C4FE7AC113F52C5E10CE4E4E7B39887BAA28930F019A6F5944D19EF2AE350AB194434A226C0D2D05A40F975A004242DA81EC2E5B9BC46E97814D10336CFBB35C2F2BD5F80ADD8808C5DBD16AD10EA2F4F45E3EC74FA284656588364E49D0E0B151C8541889B577DE01D94A2CBCBCA8AE9120BF789862B03E393D1A0A096C855A3A47C30836B2937CD762DA902B23E21D95A5A12C2278D96F2C10CAE256EA3ED4A5204053DC282B5545477E1032DB63CD351789BA26D6C651553FCC3D8D294568D2F5118BA645929B5E25F8C59566735FD71D6BFF8C8CF302C3B56D42015D2169C6810A125165A8135487AEE46313D4514CD11CBF34C1D5F2253FA56CDF69FB3ACBA4F7912733F9053B3BF790FF5257ECDDFCA0109C7398751FA2CAA4953E90A1B50773758F91BF250A4C8DE4F032FF1893EC8D2F7CEEEF0AAFDB32F32C2D812E4978228496352A85B577FA7C99117C6801355C431AB4F961E42A7F23C0AAD2A5D1799EA51F24455154597BCDADAE4E9029ADE1326C68BFDE7AB15E179D6172F52A902F04F3D312A750E1258A5AD3B6ABD14A58A596FE98E28D49B542185A61E5256AB4A6A42561B56C2D368544DD19D835C475245975BBB232B2A4AAAD08AE615B015328B6DDD511545275560457377ECB20245DC4877D883694F316BB9B0ECB0BB9E0FD3603CCFAE388C0BACDCE957812A9F7B62F15B7B098C7FDF498BD29EF8D6B2A82CCFB19E456930F43B50ED46BCBE01355EE3EB316BD7DCB54DBEE99A5F8FD7CF6E9FD53AA4439F4852702F0E7FC2216FCC0F5CED8F6CA4135846621AB91AC1C13FC514FB2346309A7DF6A69E8BD9769E135C22E22E704CB3D20EF370FFE05078A3B33BEF65AC38763CC58155F768A63E671BA8D2220F28B2EF5124D74CACF1A6A40495D2D117C4C18F13F3AFB4D7719AD9607FA59FF78C8BF88EB89F1368B88D126CFC2DD7800E5363DFE1554721E8DF2FE2B94477955FFCF931EBBA675C47B09C8E8D7D41D1AB4C7FFD11452F69B2AE6B48B3F2D38A97BBDA6AEF1594A8C26A59FD79C2DCA5833C4DC8A5FCCE478FDFF7154DF9FC602D44C51383A1F00651A1EE09C12A58DAE7030EFCA4E9F3817E83553F27584534ED530297F407131F1274DF86F29E5BF4438A43D326B6A454CFAD85D86B55656EDB3749F5DA6B2D74B926BB07DCA075D7EB85282FAC9E7930D7A928571E0C7B9B76FFEC35CABB52965C06EDDBAD46DE640172C3E5D2575577BC0395728ACA9FED57176FDAD67459E01D2FD1EC5743BC63C6C6DDFCF62B85376D6CBA04F18E1B5BAF7AE01DB3B56DF9CF2D5B5A6717BAF5EA5EB95049739BA3CA22B755EF66297738FECF0330822CA2CC1E5DAACBC59A4A5D5B1896247AA6FA3A3591B1B47024BE124533DB7E63E50EBF71B09CA699ADA6BAB38937DFFF1B79739A66DE9A9AC96DD41D2BAB1655B5E02DFB585329D54BAA33AE8DA4A5ACBD2D666DBC9A7F4965C58328A5B67A34B7CB2FA78A7810950CB9747A540DCB17C5E03B2BFF6623F8EFD85D9610EC5F7024D8AE79CD82E6822C82DC790B12E5244286E61253E4804B3D89A8BB4036856696804E5F8DA7493D760D32C7CE05B94E6898501832F6E75E2DE1C5828026FE6969745DE6F1759896480C310410D36589FB6BF22E713DA790FB5C9113D240B0E882A77BD95C5296F65D3E15485701E908C4D5570445B7D80F3D008BAFC90C3DE0556403F37B8F97C87E2A33803A90F689A8AB7D7CEAA26584FC986394FDE127D8B0E33FFEF23F5ED9F834BA540000, N'6.2.0-61023')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'8d6622e5-3ed7-4749-9929-41af92fba632', N'Admin')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'014a53da-129c-4fa3-aad1-41b2a183fe2e', N'Customer')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'6c12132b-33be-40d8-9a31-48e279176020', N'Employee')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'8540440b-0460-4a08-8d0a-b61d128e88b0', N'014a53da-129c-4fa3-aad1-41b2a183fe2e')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'94ba3840-ab4e-4eed-8cb2-00f2a6269a7d', N'014a53da-129c-4fa3-aad1-41b2a183fe2e')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'b4cbb69e-4559-48db-bd2d-081d482a4946', N'014a53da-129c-4fa3-aad1-41b2a183fe2e')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'c855aa02-8725-46e2-a007-20a1d4e334aa', N'014a53da-129c-4fa3-aad1-41b2a183fe2e')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'e515708a-9275-4d91-98ac-d390752d98ee', N'014a53da-129c-4fa3-aad1-41b2a183fe2e')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'fb38aac8-2db0-4a3c-8066-42906ed60c58', N'014a53da-129c-4fa3-aad1-41b2a183fe2e')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'6eb6a6b9-efca-4cd1-8180-96524c19504b', N'6c12132b-33be-40d8-9a31-48e279176020')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'0129c723-c4f1-464c-8734-2b2cc6391594', N'8d6622e5-3ed7-4749-9929-41af92fba632')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'0129c723-c4f1-464c-8734-2b2cc6391594', N'admin@reservations.com', 0, N'ALyfVXTq6zVwFEHlbBk2/VV+tV93Xyjg+mZ9Jd/xYYUN9UTBMfzUIVdtYbgAG5QCNw==', N'2e273075-702f-4f6d-ae73-d4aa6983fa3c', NULL, 0, 0, NULL, 1, 0, N'admin@reservations.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'67df1250-8c90-4cc7-90b0-81f41c81fc0c', N'customer2@customer.com', 0, N'AI84BiqC78Oq0CIAs+odW7WSb3SNLDTPravmnw9WcyX9aVQ4f6Prprd5XnsCJ7U/sg==', N'de3e8633-9db6-4949-a834-5beba1d11b71', NULL, 0, 0, NULL, 1, 0, N'customer2@customer.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'6eb6a6b9-efca-4cd1-8180-96524c19504b', N'employee@reservations.com', 0, N'AHvnuk1Vwg+Tnv+stQ0W+ddcOKxmulOhxlhs7j9Cg8TsqVy5qiBM6VChYkGqmm9+7w==', N'dc867580-7e6c-4c19-8663-8947b8683fa5', NULL, 0, 0, NULL, 1, 0, N'employee@reservations.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'8540440b-0460-4a08-8d0a-b61d128e88b0', N'amy@customer.com', 0, N'ANuvBtRyCgX6+cTLYiFBXsfwKusyfvqzCn15hSYEdH83hYVTnGObCpu3SWO60CMGog==', N'286d9483-5257-4004-b8d5-bc773b3ba438', NULL, 0, 0, NULL, 1, 0, N'amy@customer.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'94ba3840-ab4e-4eed-8cb2-00f2a6269a7d', N'tonystark@reservations.com', 0, N'AFnOtEmguxNd6ovBDYpSxIlpPiAQ/W3VqEa1itQEvh1GGtKjiWnAAwDJ5xQreEcEbA==', N'9f6f174d-0187-4f04-9474-db93c3bbeaab', NULL, 0, 0, NULL, 1, 0, N'tonystark@reservations.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'b4cbb69e-4559-48db-bd2d-081d482a4946', N'dexter@reservations.com', 0, N'AA7aCWdelQH+j9z9BoyDuTTxSAHGyk4Vs2hjDIjFHrJyCT+/d/DcxEh1ILdqwCr7Xg==', N'a4ba85f1-aaba-474c-ae0c-a2dc7437f75d', NULL, 0, 0, NULL, 1, 0, N'dexter@reservations.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'c855aa02-8725-46e2-a007-20a1d4e334aa', N'customer1@customer.com', 0, N'AKEB3+BmuJB4OsJs0phZkpQZKX3ZqROupXV+RlHAPbm0Slup+gzD12+mSdxV3omXuA==', N'10417fa5-0d8c-4f17-9ccf-2685eb5629a1', NULL, 0, 0, NULL, 1, 0, N'customer1@customer.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'e515708a-9275-4d91-98ac-d390752d98ee', N'rforeman@customer.com', 0, N'AFRYfoQ/TKDr0WJliz0BRYTq+PB8eZ5QWp5RqOfkkkB7osksPtlZTZDEwF8NDkd3og==', N'dd2eac13-5068-42af-922e-5baca12710b8', NULL, 0, 0, NULL, 1, 0, N'rforeman@customer.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'fb38aac8-2db0-4a3c-8066-42906ed60c58', N'lucifer@customer.com', 0, N'AHmS/jnTcrXHFAM2+Trt92C2eJ9s0OEtcyamSrB+r8OUposkeyAaThwCr5aOdYGvtA==', N'3eb570ec-ce29-465f-a19e-d643f10c28b9', NULL, 0, 0, NULL, 1, 0, N'lucifer@customer.com')
SET IDENTITY_INSERT [dbo].[Locations] ON 

INSERT [dbo].[Locations] ([LocationId], [LocationName], [Address], [City], [State], [ZipCode], [ReservationLimit]) VALUES (1, N'McCarthy Forest', N'123 Uphill Ln.', N'Midgar', N'PL', N'98765', 20)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [Address], [City], [State], [ZipCode], [ReservationLimit]) VALUES (2, N'Shaded Woods', N'456 Undead way.', N'Majula', N'PL', N'98667', 30)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [Address], [City], [State], [ZipCode], [ReservationLimit]) VALUES (3, N'Ghoughs Armory', N'334 Light Ln.', N'Oolacile', N'PL', N'98321', 20)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [Address], [City], [State], [ZipCode], [ReservationLimit]) VALUES (4, N'Tommy''s Warehouse', N'687 Pickles Ave.', N'Midgar', N'PL', N'98765', 15)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [Address], [City], [State], [ZipCode], [ReservationLimit]) VALUES (5, N'Shinra Complex', N'999 Endgame Ln.', N'Midgar', N'PL', N'98765', 40)
SET IDENTITY_INSERT [dbo].[Locations] OFF
SET IDENTITY_INSERT [dbo].[OwnerAssets] ON 

INSERT [dbo].[OwnerAssets] ([OwnerAssetId], [AssetName], [OwnerId], [AssetPhoto], [SpecialNotes], [IsActive], [DateAdded]) VALUES (1, N'The Reds', N'e515708a-9275-4d91-98ac-d390752d98ee', N'c990e4ad-907a-4103-afa8-0623faad18c3.jpg', N'Im Red Foreman, I dont play games but hear I am. Make this as exciting as possible.', 1, CAST(0x09410B00 AS Date))
INSERT [dbo].[OwnerAssets] ([OwnerAssetId], [AssetName], [OwnerId], [AssetPhoto], [SpecialNotes], [IsActive], [DateAdded]) VALUES (2, N'Shadow Squad', N'0129c723-c4f1-464c-8734-2b2cc6391594', N'noImage.jpeg', N'Here for the Tournaments', 1, CAST(0x09410B00 AS Date))
INSERT [dbo].[OwnerAssets] ([OwnerAssetId], [AssetName], [OwnerId], [AssetPhoto], [SpecialNotes], [IsActive], [DateAdded]) VALUES (3, N'99', N'8540440b-0460-4a08-8d0a-b61d128e88b0', N'noImage.jpeg', N'99th Precinct needing to blow off some steam', 1, CAST(0x09410B00 AS Date))
INSERT [dbo].[OwnerAssets] ([OwnerAssetId], [AssetName], [OwnerId], [AssetPhoto], [SpecialNotes], [IsActive], [DateAdded]) VALUES (4, N'Double Agents', N'b4cbb69e-4559-48db-bd2d-081d482a4946', N'noImage.jpeg', NULL, 0, CAST(0x08410B00 AS Date))
INSERT [dbo].[OwnerAssets] ([OwnerAssetId], [AssetName], [OwnerId], [AssetPhoto], [SpecialNotes], [IsActive], [DateAdded]) VALUES (10, N'Demons', N'fb38aac8-2db0-4a3c-8066-42906ed60c58', N'noImage.jpeg', N'Names Lucifer, God given im afraid.', 1, CAST(0xFD400B00 AS Date))
INSERT [dbo].[OwnerAssets] ([OwnerAssetId], [AssetName], [OwnerId], [AssetPhoto], [SpecialNotes], [IsActive], [DateAdded]) VALUES (14, N'Lab Rats', N'b4cbb69e-4559-48db-bd2d-081d482a4946', N'noImage.jpeg', NULL, 0, CAST(0x0D410B00 AS Date))
INSERT [dbo].[OwnerAssets] ([OwnerAssetId], [AssetName], [OwnerId], [AssetPhoto], [SpecialNotes], [IsActive], [DateAdded]) VALUES (15, N'Test', N'0129c723-c4f1-464c-8734-2b2cc6391594', N'noImage.jpeg', NULL, 1, CAST(0x0D410B00 AS Date))
INSERT [dbo].[OwnerAssets] ([OwnerAssetId], [AssetName], [OwnerId], [AssetPhoto], [SpecialNotes], [IsActive], [DateAdded]) VALUES (16, N'another test', N'0129c723-c4f1-464c-8734-2b2cc6391594', N'44e90a61-6f2a-4294-b079-8e9ba520bc3f.jpg', NULL, 0, CAST(0x0D410B00 AS Date))
INSERT [dbo].[OwnerAssets] ([OwnerAssetId], [AssetName], [OwnerId], [AssetPhoto], [SpecialNotes], [IsActive], [DateAdded]) VALUES (17, N'and another test', N'8540440b-0460-4a08-8d0a-b61d128e88b0', N'be2d21c4-12d0-4e50-ad3b-417b42d62e43.gif', NULL, 0, CAST(0x0D410B00 AS Date))
INSERT [dbo].[OwnerAssets] ([OwnerAssetId], [AssetName], [OwnerId], [AssetPhoto], [SpecialNotes], [IsActive], [DateAdded]) VALUES (18, N'another test again', N'0129c723-c4f1-464c-8734-2b2cc6391594', N'0bd4da33-88f8-4e59-b481-ae9f9fedb011.jpg', NULL, 0, CAST(0x0D410B00 AS Date))
SET IDENTITY_INSERT [dbo].[OwnerAssets] OFF
SET IDENTITY_INSERT [dbo].[Reservations] ON 

INSERT [dbo].[Reservations] ([ReservationId], [OwnerAssetId], [LocationId], [ReservationDate]) VALUES (2, 1, 2, CAST(0x17410B00 AS Date))
INSERT [dbo].[Reservations] ([ReservationId], [OwnerAssetId], [LocationId], [ReservationDate]) VALUES (3, 2, 1, CAST(0x3D410B00 AS Date))
INSERT [dbo].[Reservations] ([ReservationId], [OwnerAssetId], [LocationId], [ReservationDate]) VALUES (4, 10, 5, CAST(0x31410B00 AS Date))
INSERT [dbo].[Reservations] ([ReservationId], [OwnerAssetId], [LocationId], [ReservationDate]) VALUES (5, 3, 3, CAST(0x1C410B00 AS Date))
INSERT [dbo].[Reservations] ([ReservationId], [OwnerAssetId], [LocationId], [ReservationDate]) VALUES (6, 1, 1, CAST(0x0C410B00 AS Date))
INSERT [dbo].[Reservations] ([ReservationId], [OwnerAssetId], [LocationId], [ReservationDate]) VALUES (7, 14, 1, CAST(0x1E410B00 AS Date))
INSERT [dbo].[Reservations] ([ReservationId], [OwnerAssetId], [LocationId], [ReservationDate]) VALUES (8, 4, 3, CAST(0x26410B00 AS Date))
INSERT [dbo].[Reservations] ([ReservationId], [OwnerAssetId], [LocationId], [ReservationDate]) VALUES (10, 10, 1, CAST(0x93410B00 AS Date))
SET IDENTITY_INSERT [dbo].[Reservations] OFF
INSERT [dbo].[UserDetails] ([UserId], [FirstName], [LastName]) VALUES (N'0129c723-c4f1-464c-8734-2b2cc6391594', N'Jacob', N'Boyke')
INSERT [dbo].[UserDetails] ([UserId], [FirstName], [LastName]) VALUES (N'8540440b-0460-4a08-8d0a-b61d128e88b0', N'Amy', N'Santiago')
INSERT [dbo].[UserDetails] ([UserId], [FirstName], [LastName]) VALUES (N'94ba3840-ab4e-4eed-8cb2-00f2a6269a7d', N'Tony ', N'Stark')
INSERT [dbo].[UserDetails] ([UserId], [FirstName], [LastName]) VALUES (N'b4cbb69e-4559-48db-bd2d-081d482a4946', N'Dexter', N'Morgan')
INSERT [dbo].[UserDetails] ([UserId], [FirstName], [LastName]) VALUES (N'e515708a-9275-4d91-98ac-d390752d98ee', N'Red ', N'Foreman')
INSERT [dbo].[UserDetails] ([UserId], [FirstName], [LastName]) VALUES (N'fb38aac8-2db0-4a3c-8066-42906ed60c58', N'Lucifer', N'Morningstar')
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]'))
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]'))
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OwnerAssets_UserDetails]') AND parent_object_id = OBJECT_ID(N'[dbo].[OwnerAssets]'))
ALTER TABLE [dbo].[OwnerAssets]  WITH CHECK ADD  CONSTRAINT [FK_OwnerAssets_UserDetails] FOREIGN KEY([OwnerId])
REFERENCES [dbo].[UserDetails] ([UserId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OwnerAssets_UserDetails]') AND parent_object_id = OBJECT_ID(N'[dbo].[OwnerAssets]'))
ALTER TABLE [dbo].[OwnerAssets] CHECK CONSTRAINT [FK_OwnerAssets_UserDetails]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Reservations_Locations]') AND parent_object_id = OBJECT_ID(N'[dbo].[Reservations]'))
ALTER TABLE [dbo].[Reservations]  WITH CHECK ADD  CONSTRAINT [FK_Reservations_Locations] FOREIGN KEY([LocationId])
REFERENCES [dbo].[Locations] ([LocationId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Reservations_Locations]') AND parent_object_id = OBJECT_ID(N'[dbo].[Reservations]'))
ALTER TABLE [dbo].[Reservations] CHECK CONSTRAINT [FK_Reservations_Locations]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Reservations_OwnerAssets]') AND parent_object_id = OBJECT_ID(N'[dbo].[Reservations]'))
ALTER TABLE [dbo].[Reservations]  WITH CHECK ADD  CONSTRAINT [FK_Reservations_OwnerAssets] FOREIGN KEY([OwnerAssetId])
REFERENCES [dbo].[OwnerAssets] ([OwnerAssetId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Reservations_OwnerAssets]') AND parent_object_id = OBJECT_ID(N'[dbo].[Reservations]'))
ALTER TABLE [dbo].[Reservations] CHECK CONSTRAINT [FK_Reservations_OwnerAssets]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserDetails_AspNetUsers]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserDetails]'))
ALTER TABLE [dbo].[UserDetails]  WITH CHECK ADD  CONSTRAINT [FK_UserDetails_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserDetails_AspNetUsers]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserDetails]'))
ALTER TABLE [dbo].[UserDetails] CHECK CONSTRAINT [FK_UserDetails_AspNetUsers]
GO
