USE [master]
GO
/****** Object:  Database [DBYTeAspMVC]    Script Date: 11/3/2022 10:58:23 PM ******/
CREATE DATABASE [DBYTeAspMVC]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DBYTeAspMVC', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\DBYTeAspMVC.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DBYTeAspMVC_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\DBYTeAspMVC_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [DBYTeAspMVC] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBYTeAspMVC].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBYTeAspMVC] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBYTeAspMVC] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBYTeAspMVC] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBYTeAspMVC] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBYTeAspMVC] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBYTeAspMVC] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [DBYTeAspMVC] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBYTeAspMVC] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBYTeAspMVC] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBYTeAspMVC] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBYTeAspMVC] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBYTeAspMVC] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBYTeAspMVC] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBYTeAspMVC] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBYTeAspMVC] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DBYTeAspMVC] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBYTeAspMVC] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBYTeAspMVC] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBYTeAspMVC] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBYTeAspMVC] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBYTeAspMVC] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [DBYTeAspMVC] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBYTeAspMVC] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DBYTeAspMVC] SET  MULTI_USER 
GO
ALTER DATABASE [DBYTeAspMVC] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBYTeAspMVC] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBYTeAspMVC] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBYTeAspMVC] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DBYTeAspMVC] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DBYTeAspMVC] SET QUERY_STORE = OFF
GO
USE [DBYTeAspMVC]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 11/3/2022 10:58:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
/****** Object:  Table [dbo].[Bookings]    Script Date: 11/3/2022 10:58:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bookings](
	[IdBooking] [int] IDENTITY(1,1) NOT NULL,
	[Day] [nvarchar](255) NULL,
	[Time] [nvarchar](255) NULL,
	[Reason] [nvarchar](255) NULL,
	[Status] [int] NOT NULL,
	[IdUser] [int] NOT NULL,
	[IdDoctor] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Bookings] PRIMARY KEY CLUSTERED 
(
	[IdBooking] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doctors]    Script Date: 11/3/2022 10:58:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctors](
	[IdDoctor] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](255) NOT NULL,
	[FullName] [nvarchar](255) NOT NULL,
	[Password] [nvarchar](255) NOT NULL,
	[Specialist] [nvarchar](255) NULL,
	[Image] [nvarchar](255) NULL,
	[Describe] [nvarchar](max) NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Doctors] PRIMARY KEY CLUSTERED 
(
	[IdDoctor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Numbers]    Script Date: 11/3/2022 10:58:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Numbers](
	[IdNumber] [int] IDENTITY(1,1) NOT NULL,
	[Image] [nvarchar](255) NOT NULL,
	[NumberInt] [int] NOT NULL,
	[Day] [nvarchar](max) NULL,
	[IdUser] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Numbers] PRIMARY KEY CLUSTERED 
(
	[IdNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Posts]    Script Date: 11/3/2022 10:58:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts](
	[IdPost] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
	[Image] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Created] [nvarchar](max) NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Posts] PRIMARY KEY CLUSTERED 
(
	[IdPost] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 11/3/2022 10:58:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[IdRole] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_dbo.Roles] PRIMARY KEY CLUSTERED 
(
	[IdRole] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Services]    Script Date: 11/3/2022 10:58:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Services](
	[IdService] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Image] [nvarchar](255) NULL,
	[Content] [nvarchar](max) NULL,
	[Price] [int] NOT NULL,
	[Created] [nvarchar](max) NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Services] PRIMARY KEY CLUSTERED 
(
	[IdService] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 11/3/2022 10:58:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[IdUser] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](255) NOT NULL,
	[FullName] [nvarchar](255) NOT NULL,
	[Password] [nvarchar](255) NOT NULL,
	[PhoneNumber] [nvarchar](255) NULL,
	[Address] [nvarchar](255) NULL,
	[Gender] [nvarchar](max) NULL,
	[Status] [int] NOT NULL,
	[IdRole] [int] NOT NULL,
	[Created] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Users] PRIMARY KEY CLUSTERED 
(
	[IdUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202210270915371_new-database', N'YTeAspMVC.Migrations.Configuration', 0x1F8B0800000000000400ED5DDB6EE4B8117D0F907F10F494045EB7EDC1021BA37B179EF63830B2BEC0ED1D244F035AA2DBC2EAD291D88E8D205FB60FF9A4FC424851A2785593BA75CF66E1179B541D165917164B2CF9BFBFFC67FEC35B127BAF302FA22C5DF8A7C727BE07D3200BA374BDF0B7E8F99BEFFC1FBEFFFDEFE69FC2E4CDFB5C3FF7813C8729D362E1BF20B4399FCD8AE00526A0384EA220CF8AEC191D0759320361363B3B39F9F3ECF4740631848FB13C6FFEB04D5194C0F20FFCE7324B03B8415B10DF64218C8BAA1DF7AC4A54EF1624B0D880002EFCBF3FC28B6273F379794C9FF5BD8B3802988F158C9F7D0FA4698600C25C9EFF54C015CAB374BDDAE006103FBE6F207EEE19C405ACB83F6F1EB79DC8C91999C8AC21ACA1826D81B2C411F0F443B5323399BCD3FAFA6CE5F0DA7DC26B8CDEC9ACCBF55BF81FB3EC672C57DF93C73A5FC639794E5DDDE38AE6C8633D474C0DB0B6909F236FB98DD136878B146E510EE223EF7EFB1447C15FE1FB63F6334C17E9368E79D63073B84F68C04DF779B681397A7F80CF15C3D72163792692CF647A46AD92D2995DA7E8C399EFDD6256C0530C991E70ABB042590EFF0253980304C37B8010CC530205CB9554989086BC04EFF56058EFCAA16FC0DB8F305DA397857FF6EDB7BE7715BDC1B06EA918F8298DB0BD6122946FE1AE311EB1D58C3EC803040551C0918759E165DF16BBE4D38E711D622BCFFB625C660116BD23CA2D788DD6A5E2C87A50A13DC0B8EC2E5EA20D754FC7B4EB4BA59A78EE5779963C6431A3625D5F1E41BE8608F394E9FB57D9360F1CB8A2EBA4E189746839123A147EC45E1D37F359E3815AFD52BD600E6E8992ECCB2BD50CBB3B253B4D1BCE277D4A40140F60C98E2675851F27BF4D3FF23D288A7F667938FDC8AB0D0C709411156874CF799D80F5F8DBC0252C823C7A6A1B08FFBAAF8DC0E8E81A57D6CF01D72ECDE4806B87D8C9E5516FECE0F008C1BEDC1D65D6DDD9D96CCDBFB9BAAFD0D5DDBF6429BCDD264F8D7C47F342176198C3A2187D1CAC7861EB74F6E8EB14CB221EA91FC63287C4CA869F6F37BF6C1984CA3E591FA2DA72443558CF10EDFB425D58C30ED7AC44C47C9F6B744E05AAE183749490C2AA34AD0A175C57AFA0BC366F873D8A92EC6B97AA1976DFA7444F36FE4E3554F8E668F2749A787AFD3C477B9A63182FD9E958EF7EF4B53072D9E3E81C4027FBA216EF605D84605FB6459975B72C9B7D6A38BB9A280C6BD533FD6EB2D38BCB6AA671F09DB4EC3E23C751072D2304FBD232CAACBB9651BAA9B4EC3142F11EBCF79E360D9A04D8D03712237BFDD162D2DE31B8B5BDAD60FE1A056E8EBDA2D997D53196DD0D8F91FECA3CFC5ED26DCB2C45306D4B1E0EA3FDF7B985C89C0CB51BC870567851145910950A26BC51680E9422239FD2D0DB91F3A322683286580ED800A30D3639CCC0C23F556667066527B40694BD9B1451FFA4A062438539B10D1063FD28B0E9472952AD3A4A836803E2F65949644EEF36C8E2B361E49E4BB821C99314B52F40DFF1D930929FDAB546F319A720ED7A23A6214C0236E4241AF1D20385BDC618DEB44DA52FDAF9D8494B971A76D215EDD4FB8D3D819EF007479350B5A7C846A475D2619744F5801A1DB153BA4E0AA2197922F5D02CE2C12B0777D833895277F26B24494FCDF6EE43970D6CD78B811C873A0D3BE1E8D2094E6AA1CEB8DFC0836B050D5448488729605E318003FCCB8F659CF7A63B95E30955A784A20AE5648913D015444A46BD898BE40D43511A1182EEB63A04C31D0719A04A6A28E4DA778632314BC02BE48664AE0C40E4A923D7E6AB64629236D0116BD310327175F4D1D19B0E549CAAC802E05E7D704F19DE59CBDABB3B9C65CC7302578C607700CBC134FCCAA7467196162B20BDFA51E7DF12945984651CD395AEB6CC5C1F888D336F21F9ACCEDA1862EC0C3238769981B5CC591756EC5AB40ED3E553A0EA6C4D7BE6AE5D9363B4F2052D33D5EC933D265A9F469993677DF319BDB65C35CC6786FBCDF31BB0D9106D6A28AB166F452F3B2FBF59B9DF034E28C62C2834D78119B76C246CEA600DA55E928E08E1559417E81220F004C8597C1926CA63C296667099F550D2AEA50AAA76A43501F99DED9CDA7BC99A7DBF22BEC2B34A48C450A69C541356293D72DD1CC420375F255E66F13649775C4E6EC32A5F9EF12865833D3DBDFFCB03D0167B84FA722F8F51B7D9A3D4C91B1EA56EB347A9C3747159F5A17B1B4A1DAB8838A64C02B1484949948050D145C92BC8BA6DA5F9F5DEDB4BF1AB59B9EBBD8970B86535215537B37898AAC91EA3B966C5C334ADF648CDB5291EA969753002EEC6A760085CBB831AD32CB3B0D8B4C9C1BDB02B9B828F61AD6319F89E0CCA14303898932EBEB230263DD9B87EEED76A46C26D42018CEFB0C7633706792CD6688F53DF08E461EAB6E9774A7AA41535489FCE30A3B0F7363C0C6B3C18B3AE4F2DBD0CBBD21B77D336119A45A3D35DD37DB456A4017600EE92178FC3354F17ACBAB9BD3D291B3D36F652B5D20CDD154D4F36AE07507DBFC9EFEF491C3429D74B1C65FECE5D1C7A32B338689A5014872E75D88652DD2512CF73C84DA4C3C58DD52D1F3574AC3AC6DB68BEEA2894A5827B696D9D3576575C23A55977598A5A545F43E6BA0DCBDEA18CA9BFECEE8CA06F75A343289A2BAB5235FD5FEBBE92EA941F61A3B394A794DA9C5769C6DDDF7750F28EF411DFC3CBF31A8524E7B87A2F104C8EC903C7AB7FC4CB382AC55C3F7003D2E81916885E8CF3CF4E4ECFA48F441CCE071B664511C69A34ADE6AB0DA2B826FF7E42449678E7F5BDEEB504E92BC8831790AB37EB1A4CD72F240C85297E10612854F1025CB9BEBDBE7E5022282F95AFF181F56DE1FFAB2439F7AEFFF685521D797739369673EFC4FB77EF4F26D80F5D17EE5B0FEEFA15814E66325441FF28462214B6DA285FA7BAD5C180E5B2D4C180D502FBA12C51B8E03B14A85C3E5FE3FE21016F7F1CDB57B815A277B29921AAC27FB39711ED4553A53D946E4B45D943C18A35D8931A8C4E53F9EA35FB1D8ED6E9F5D85CA5DBF50ECBE05ADCDBC9EE87AAB31DC5F69D3D79B7CAD92EFAA489753B69F644419F5B216B274D1AA2AA74142D1AC0CFBB5568765ABE21CA2547593EA1427230231CC7B435F58DBDACB3BBF39E30E8D3660CA7AF173C54DB9DE8802015FCF55215A1A8AFCBEE24E96D1788A1D4B56F395FCFF23D29EF3559BDDE74F579E6BB935F71415EAF02BCE9656EB877344A11959BBC0FBCACAEB7ACA5EF96B9D4E21DBCA48D975E0E4CD0962572BDAAE2AC1465C042B8A96ADF1CF469CFE56E6A09812C2B6D3D5B5B391B7D19B8F0C3A70CCB968616C69A1C7DB15B4BAD9B0EDD5030A52D8433D6C1E980F5F526FA12B9960A391DB4A1EC475B3E67AC9ED3016B6B6CB48575C6BA3A1D6C5589675772D75671A7036F2AF5F6548FA7A9BF6B2D5392CC40285A39B0723BA5806A8F131BA49ECE7D52A281F237480FA6664E29936B9D90D5120C5317A75E0AC17B10F7AF41F0DE5744EB0682FCA3901406C2EEC39EB94E9FB37A139438AA1F910EAC371081106F4D17398A9E41807037F61345A98E9F41BC85E45DD2130CAFD3BB2DDA6C119E324C9E62E10E2CD94CDBC62F8BFF449EE77765BAA918620A98CD084F01DEA51FB7511C32BEAF34C76D0304D9A5ABFC0B9125227998F53B43BACD524BA06AF95870F108934D8CC18ABB74055E6117DEB0EAFD08D72078AFEFF69841760B425CF6F96504D639488A0AA3A1C77F621D0E93B7EFFF07B643993C21670000, N'6.4.4')
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202211031129006_up', N'YTeAspMVC.Migrations.Configuration', 0x1F8B0800000000000400ED1DD96EE4B8F13D40FE41D0531278DDB6070B2446F72E3CED7160647DC0ED1D244F035AA2DBC2EAE8486CC746902FCB433E29BF105294289E6A5257F74C167EB14955B18A75B058AA92FFFBEFFFCC7F7C4B62EF15E64594A50BFFF4F8C4F7601A646194AE17FE163D7FF747FFC71F7EFB9BF9A73079F33ED7CF7D20CF61C8B458F82F086DCE67B322788109288E9328C8B3227B46C74196CC4098CDCE4E4EFE343B3D9D418CC2C7B83C6FFEB04D5194C0F20FFCE7324B03B8415B10DF64218C8B6A1CCFAC4AACDE2D4860B101015CF87F7B8417C5E6E6F3F2983EEB7B177104301D2B183FFB1E48D30C0184A93CFFB9802B9467E97AB5C103207E7CDF40FCDC33880B58517FDE3C6ECBC8C9196164D600D6A8826D81B2C411E1E9876A67663278A7FDF5D9CEE1BDFB84F718BD13AECBFD5BF81FB3EC172C57DF93D73A5FC639794EDDDDE30AE6C86333474C0DB0B6909F236FB98DD136878B146E510EE223EF7EFB1447C15FE0FB63F60B4C17E9368E79D23071784E18C043F779B681397A7F80CF15C1D72123792682CF647806AD8252CEAE53F4E1CCF76E3129E029864C0FB85D58A12C877F8629CC0182E13D4008E6294105CB9D54889096BC04EFF56258EFCAA56FC0DB4F305DA397857FF6FDF7BE7715BDC1B01EA908F8398DB0BD6120946FE1AE351EB1D58CBEC803040551C0919759E16DDF16BBE4D38EE33AC4569EF7C571990558F48E586EC16BB42E1547D6830ADB038CCBE9E225DA50F7744CA7BE54AA8979BFCAB3E4218B19149BFAF208F2354498A64C3FBFCAB679E04015DD270D4D64424B9130A1D023CEEAA899CF1A0FD4EA97EA0D73704B14645F5EA926D8DD29D969DA703EE95302A278004B7634A92BFC38F96DFA95EF4151FC23CBC3E9575E6D6080A38CA840A37BCEEB04ACC73F062E6111E4D153DB42F8D77D1D044647D7B8B27E0EB8766926075C3BC44E2E8F7A6307874700F6E5EE28B1EECECEE668FED5D57D85AEEEFE254BE1ED36796AE43B9A17BA08C31C16C5E8EB60C50B5BD9D9A3AF532C8B78A47E3896392456363CBFDDFCB265102AFB647D886A4B11D5603D4174EE0B75610D39DCB01211F373AED13915A8860E3251A21476A51955A8E0A67A05E5B5793B9C5114645FA7544DB0FB39257AB2F14FAAA1C2374793A76C62F6FA798EF634C7305EB2D3B5DEFDEA6B61E4B2C7D139804EF6452DDEC1BA08C0BE6C8B12EB6E5936E7D47076355118D6AA67FAD364A71797D54CE3E03B69D97D46AEA30E5A4600F6A5659458772DA3705369D96384E23D78EF3D1D1A3409B0A16F2446F6FAA3C5A4BD63706B7B5BC1FC350ADC1C7B05B32FAB6324BB1B1E03FDC63CFC5ED26DCB2C45306D4B1E0EA3FDF7B985C8BE3543BD288A2C884A1D145E3A34774E91904F69E8ED480B52D69BA422E61FDB68B4C156890958F8A70A7766A4EC12D72065AF2F45AC7F50B0625B8639311F1063152AB0778852A41A7E9406D106C4ED5C49604EAF3FC8E6B365E4994BB821F99514B56F40DFF5D932922BDBB547F319A720ED7A23662A4C0236A42D1AF1D23B87BDC6185EC64DA52F5A7EECA4A5CB1E3BE98A96F57E6B4FA027FCDDD22454ED45B311699D97D825513D428D8ED8295D2705D1AC3C917A6836F1E09583BB0F9A44A9BB1C3692A4176B7BF7A14B18B6EBC5408E4365C34E38BA8C83935AA81CF75B7870ADA0810A89FA3004CC2B02F01DE0F263190ABEE92EEE98A1EA22515421942C718274059192746FE222F9C050944644414F5B1D064319848CA0CA7B28E0DAD78A3230CBD12BE0867CAF8C80C85307AE4D69C9C024B3A003D6662A64E0EA76A48337DDB938559105C0BD1DE19E32BCD696B5777738CB88E704AE18C1EE009643D3D02B5F2C452E2D76407A3BA4F2DF12945984651CD195AEB670AE0FC4C6E15BC84FAB5C1B438C9D4106472E33B0169E7561C5AE4DEBC02E9F2555B9359D99BB4E4D8ED0CA17B470AA39277B305ADF4699936773F319AD6CAE06E6334309F4FC066C36449B1AC86AC45BD17AE8E5772BF752E184E2980585A6629851CB56C2A60ED6509A25198B105E4579812E01024F80DCC59761A23C261C690697592F259D5AAAA06A475A0390DFD9C9A92D5DD69CFB15F015E62A2111439995524D5885F448453A88416EAE365E66F1364977D42FB7E12ADFAFF158CA017B785A22CC23A023F618EAFA5F1E473D668FA54EDEF058EA317B2C75982E6EAB3E746FC352C72A221E53268158A4A4244A40A8E8A2E41564DDB6D2FCFAECEDA5F81557EE7A6F021C6E5B4D98AAE22D1E4D35648FA3A9C4E2D134A3F6989ACA2A1E5333EA60045C51A86008DCB8831AD344B4B0D974C8C1BDB0AA4EC1C7B0D1B10C7C4F06650A181CCC49175F5918931E6C5C3FF7AD9A9150702820E327ECF1B1A2421E171BB4C753170DF268EAB1E94F4A7AA51535489FCE306361AF7678346CF060CCBABEB5F432EC4A6FDC4DDB0468168D4E774D256BAD98063801B83A301E0F373C5DB0EAE6F6F6A46CF4DAD84BD54A337457343DD8B81E40F5FD26BFBF2771D0A45C2F7194F93B7771E8C1CCE2A06942511CBAD4611B96AADC48BCCF2137910E17375685406AE8584D8C77D07CD551284B05F7D2DA3A6BECAEB84648B3EEB214B5A8BE86CC751B2E7B8732A6FEB2F21A41DFEA418750345776A51AFABFD67D25D5293FC25667294F29B539AFD28CBB3F01A1E41DE923BE87B7E7350A49CE71F55E20981C93078E577F8F9771548AB97EE006A4D1332C10AD9DF3CF4E4ECFA4EF481CCE371D664511C69A34ADE6C30EA2B826FFC44244B67867855FF77683F415E4C10BC8D5E2BB06A7EB471486C2297E336128AC62015CB9BFBD3E905062505E2A5FE30BEBDBC2FF670972EE5DFFF50B853AF2EE726C2CE7DE89F7AFDE5F55B05FBAEEEDB75EDCF543039DCC64A89EFF518C44E87DB551BE4EADAD8321963B570743ACF6E00F6589420DF05048E50EFB1AEFEF12F0F6FBB17D855BAF7A279B19A271FC577B19D15E348DDC43E9B6D4B73D145AB14D7B5283D1692ADFE0667FC2D156BE1E87AB5480EFB00DAEFDBF9DEC7EA856DC516CDFD993776BAEEDA24F9A58B793664F14F4B9F5BA76D2A4211A4F47D1A201FCBC5B1367A7ED1BA2A37294ED139A280733C2714C5BD302D9CB3ABB3BEF09833E6DC670FA96C243B5DD892E08524F602F5511FAFEBA9C4E87A8B77DFBFA7AF6F14909B0C91AF7A66BD43317517EC59D79BD3AF1A697B9A10069946E2A37791F787F5D6F594BDF387369CA3B78491BAB5F0E4CD096BD72BDDAE3AC1465C08EB8A99AE01CF469CF7D6F6A2F812C2B6D635B5B5F1B7D2BB8F0C3A70CCB968616C6E61C7DD75B4BD39B0EBBA1734ADB11676C88D321D6379EE87BE55A5AE574A80DFD3FDA3E3A631B9D0EB1B6D946DB61676CB0D3A1AD5AF2EC7AEFDA5AEF74C89B96BD3D35E6691AF15AFB95243310BA570EACEF4EE9A4DA23638334D6B933251A285F4A7A30CD734ABF5C2B43565B304C839C5A1D82CF20EEDF88E0B3AF88D60D0AF24F45521808A70F7BE63A7DCEEA4350A2A87E44BAB0DE4004427C345DE4287A0601C2D3D84F14A53A7E06F11692974A4F30BC4EEFB668B3459865983CC542312C394CDBD62FBB00459AE77765DEA91882054C6684598077E9C76D14878CEE2BCD75DB80829CD2552286C8129184CCFA9D61BACD524B44D5F6B1E0E211269B18232BEED21578855D68C3AAF7135C83E0BD2EF23123D92D0871DBE7971158E720292A1C0D3CFE13EB7098BCFDF03F7021A8474D670000, N'6.4.4')
GO
SET IDENTITY_INSERT [dbo].[Doctors] ON 

INSERT [dbo].[Doctors] ([IdDoctor], [Email], [FullName], [Password], [Specialist], [Image], [Describe], [Status]) VALUES (1, N'vietthanh@gmail.com', N'TS. BS. Phạm Việt Thanh', N'123456', N'Tim mạch', N'638031116196717948bs.jpg', N' Bác sĩ tận tình chu đáo, luôn giúp đỡ bệnh nhân, chăm sóc tốt nhất', 1)
INSERT [dbo].[Doctors] ([IdDoctor], [Email], [FullName], [Password], [Specialist], [Image], [Describe], [Status]) VALUES (2, N'bichhai@gmail.com', N'BS. CKI. Nguyễn Bích Hải', N'123456', N'Tai mũi họng', N'638031117216713768hinh-the-bac-hai.jpg', N' Bác sĩ tận tình chu đáo, luôn giúp đỡ bệnh nhân, chăm sóc tốt nhất', 1)
INSERT [dbo].[Doctors] ([IdDoctor], [Email], [FullName], [Password], [Specialist], [Image], [Describe], [Status]) VALUES (3, N'dung@gmail.com', N'BS. CKI. Nguyễn Kim Dung', N'123456', N'Da liễu', N'638031117790828046bs-kimdung.jpg', N'Bác sĩ tận tình chu đáo, luôn giúp đỡ bệnh nhân, chăm sóc tốt nhất', 1)
SET IDENTITY_INSERT [dbo].[Doctors] OFF
GO
SET IDENTITY_INSERT [dbo].[Posts] ON 

INSERT [dbo].[Posts] ([IdPost], [Title], [Image], [Description], [Created], [Status]) VALUES (1, N'Cách xử lý tai nạn thường gặp', N'638031074471741956Bong-gân-600x400.jpg', N'<p>B&aacute;c sĩ hướng dẫn xử l&yacute; c&aacute;c t&igrave;nh huống tai nạn thường gặp:&nbsp;</p>

<ul>
	<li><a href="https://khamdinhkydanang.com/xu-tri-khi-tre-bi-hoc-di-vat/">Xử tr&iacute; khi bị h&oacute;c dị vật&nbsp;</a></li>
	<li><a href="https://khamdinhkydanang.com/xu-tri-khi-di-vat-roi-vao-mat/">Xử tr&iacute; khi bị dị vật rơi v&agrave;o mắt&nbsp;</a></li>
</ul>

<p><img alt="" src="https://khamdinhkydanang.com/wp-content/uploads/2019/09/Tr%E1%BA%BB-h%C3%B3c-d%E1%BB%8B-v%E1%BA%ADt-1024x614.jpg" /></p>

<ul>
	<li><a href="https://khamdinhkydanang.com/xu-tri-khi-bi-ran-can/">Xử tr&iacute; khi bị rắn cắn&nbsp;</a></li>
	<li><a href="https://khamdinhkydanang.com/xu-tri-khi-bi-ong-dot/">Xử tr&iacute; khi bị ong đốt&nbsp;</a></li>
	<li><a href="https://khamdinhkydanang.com/xu-ly-nhanh-khi-bi-ret-can/">C&aacute;ch xử l&yacute; khi bị rết cắn&nbsp;</a></li>
	<li><a href="https://khamdinhkydanang.com/xu-tri-khi-bi-cho-can/">Xử tr&iacute; khi bị ch&oacute; cắn&nbsp;</a></li>
	<li><a href="https://khamdinhkydanang.com/xu-tri-khi-bi-con-trung-dot/">Xử tr&iacute; khi bị c&ocirc;n tr&ugrave;ng đốt&nbsp;</a></li>
</ul>

<p><img alt="" src="https://khamdinhkydanang.com/wp-content/uploads/2021/04/Ch%C3%B3-c%E1%BA%AFn.jpg" /></p>

<ul>
	<li><a href="https://khamdinhkydanang.com/xu-ly-nhanh-khi-bi-tut-huyet-ap/">C&aacute;ch xử l&yacute; khi bị tụt huyết &aacute;p&nbsp;</a></li>
	<li><a href="https://khamdinhkydanang.com/xu-ly-nhanh-khi-bi-tang-huyet-ap-dot-ngot/">C&aacute;ch xử l&yacute; khi bị tăng huyết &aacute;p đột ngột&nbsp;</a></li>
	<li><a href="https://khamdinhkydanang.com/cach-xu-ly-khi-phat-hien-nguoi-than-co-dau-heu-dot-quy/">C&aacute;ch xử l&yacute; khi thấy người th&acirc;n c&oacute; dấu hiệu đột quỵ</a></li>
</ul>

<p><img alt="" src="https://khamdinhkydanang.com/wp-content/uploads/2019/09/T%C4%83ng-huy%E1%BA%BFt-%C3%A1p-%C4%91%E1%BB%99t-ng%E1%BB%99t-1024x615.jpg" /></p>

<ul>
	<li><a href="https://khamdinhkydanang.com/xu-ly-vet-thuong-ho/">C&aacute;ch xử l&yacute; vết thương hở&nbsp;</a></li>
	<li><a href="https://khamdinhkydanang.com/xu-tri-khi-bi-bong-gan/">Xử tr&iacute; khi bị bong g&acirc;n&nbsp;</a></li>
	<li><a href="https://khamdinhkydanang.com/xu-tri-vet-bong-nhe/">Xử tr&iacute; khi bị bỏng&nbsp;</a></li>
	<li><a href="https://khamdinhkydanang.com/cach-xu-ly-chan-thuong-lat-co-chan-tai-nha/">C&aacute;ch xử l&yacute; khi bị lật cổ ch&acirc;n&nbsp;</a></li>
</ul>

<p><img alt="" src="https://khamdinhkydanang.com/wp-content/uploads/2019/09/X%E1%BB%AD-tr%C3%AD-v%E1%BA%BFt-th%C6%B0%C6%A1ng-h%E1%BB%9F-1024x615.jpg" /></p>

<ul>
	<li><a href="https://khamdinhkydanang.com/xu-tri-khi-be-bi-ngo-doc-thuc-pham/">Xử tr&iacute; khi bị ngộ độc thực phẩm&nbsp;</a></li>
	<li><a href="https://khamdinhkydanang.com/xu-ly-khi-be-bi-tieu-chay-cap/">C&aacute;ch xử l&yacute; khi trẻ em bị ti&ecirc;u chảy cấp&nbsp;</a></li>
</ul>

<p><img alt="" src="https://khamdinhkydanang.com/wp-content/uploads/2021/03/Ng%E1%BB%99-%C4%91%E1%BB%8Dc-th%E1%BB%B1c-ph%E1%BA%A9m-%E1%BB%9F-tr%E1%BA%BB-em.jpg" /></p>

<ul>
	<li><a href="https://khamdinhkydanang.com/xu-tri-khi-bi-dau-rang/">Xử tr&iacute; khi bị đau răng&nbsp;</a></li>
</ul>

<p><img alt="" src="https://khamdinhkydanang.com/wp-content/uploads/2019/08/B%C3%A1c-s%C4%A9-R%C4%83ng-H%C3%A0m-M%E1%BA%B7t-Qu%E1%BA%A3ng-Nam.jpg" /></p>
', N'11/3/2022 9:24:07 PM', 1)
INSERT [dbo].[Posts] ([IdPost], [Title], [Image], [Description], [Created], [Status]) VALUES (2, N'Danh sách bác sĩ Tai mũi họng', N'638031075642313169Nội-soi-tai-mũi-họng-Đà-Nẵng-600x314.jpg', N'<p><img alt="" src="https://khamdinhkydanang.com/wp-content/uploads/2018/05/N%E1%BB%99i-soi-tai-m%C5%A9i-h%E1%BB%8Dng-%C4%90%C3%A0-N%E1%BA%B5ng-1024x535.jpg" /></p>

<p>Nội dung cập nhập th&ocirc;ng tin li&ecirc;n hệ b&aacute;c sĩ Tai Mũi Họng tại c&aacute;c tỉnh th&agrave;nh để qu&yacute; kh&aacute;ch tra cứu nhanh khi cần.</p>

<p><strong>B&Aacute;C SĨ TAI MŨI HỌNG TẠI C&Aacute;C TH&Agrave;NH PHỐ TRỰC THUỘC TRUNG ƯƠNG</strong></p>

<p><a href="https://khamdinhkydanang.com/danh-ba-bac-si-tai-mui-hong-tp-ho-chi-minh/">B&aacute;c sĩ Tai Mũi Họng tại TP. Hồ Ch&iacute; Minh</a><br />
<a href="https://khamdinhkydanang.com/bac-si-tai-mui-hong-ha-noi/">B&aacute;c sĩ Tai Mũi Họng tại H&agrave; Nội</a><br />
<a href="https://khamdinhkydanang.com/dia-chi-kham-tai-mui-hong-da-nang/">B&aacute;c sĩ Tai Mũi Họng tại Đ&agrave; Nẵng</a><br />
<a href="https://khamdinhkydanang.com/bac-si-tai-mui-hong-hai-phong/">B&aacute;c sĩ Tai Mũi Họng tại TP Hải Ph&ograve;ng</a><br />
<a href="https://khamdinhkydanang.com/bac-si-tai-mui-hong-tai-can-tho/">B&aacute;c sĩ Tai Mũi Họng tại TP Cần Thơ</a></p>

<p><strong>B&Aacute;C SĨ TAI MŨI HỌNG TẠI C&Aacute;C TỈNH T&Acirc;Y BẮC BỘ</strong></p>

<p><a href="https://khamdinhkydanang.com/bac-si-tai-mui-hong-hoa-binh/">B&aacute;c sĩ Tai Mũi Họng tại H&ograve;a B&igrave;nh</a><br />
<a href="https://khamdinhkydanang.com/bac-si-tai-mui-hong-tai-son-la/">B&aacute;c sĩ Tai Mũi Họng tại Sơn La</a><br />
<a href="https://khamdinhkydanang.com/bac-si-tai-mui-hong-tai-dien-bien/">B&aacute;c sĩ Tai Mũi Họng tại Điện Bi&ecirc;n</a><br />
<a href="https://khamdinhkydanang.com/bac-si-tai-mui-hong-tai-lai-chau/">B&aacute;c sĩ Tai Mũi Họng tại Lai Ch&acirc;u</a><br />
<a href="https://khamdinhkydanang.com/bac-si-tai-mui-hong-tai-lao-cai/">B&aacute;c sĩ Tai Mũi Họng tại L&agrave;o Cai</a><br />
<a href="https://khamdinhkydanang.com/bac-si-tai-mui-hong-tai-yen-bai/">B&aacute;c sĩ Tai Mũi Họng tại Y&ecirc;n B&aacute;i</a></p>

<p><strong>B&Aacute;C SĨ TAI MŨI HỌNG TẠI C&Aacute;C TỈNH Đ&Ocirc;NG BẮC BỘ</strong></p>

<p><a href="https://khamdinhkydanang.com/bac-si-tai-mui-hong-phu-tho/">B&aacute;c sĩ Tai Mũi Họng tại Ph&uacute; Thọ</a><br />
B&aacute;c sĩ Tai Mũi Họng tại H&agrave; Giang<br />
<a href="https://khamdinhkydanang.com/bac-si-tai-mui-hong-tai-tuyen-quang/">B&aacute;c sĩ Tai Mũi Họng tại Tuy&ecirc;n Quang</a><br />
<a href="https://khamdinhkydanang.com/bac-si-tai-mui-hong-tai-cao-bang/">B&aacute;c sĩ Tai Mũi Họng tại Cao Bằng</a><br />
<a href="https://khamdinhkydanang.com/bac-si-tai-mui-hong-bac-kan/">B&aacute;c sĩ Tai Mũi Họng tại Bắc Kạn</a><br />
<a href="https://khamdinhkydanang.com/bac-si-tai-mui-hong-thai-nguyen/">B&aacute;c sĩ Tai Mũi Họng tại Th&aacute;i Nguy&ecirc;n</a><br />
B&aacute;c sĩ Tai Mũi Họng tại Lạng Sơn<br />
B&aacute;c sĩ Tai Mũi Họng tại Bắc Giang<br />
B&aacute;c sĩ Tai Mũi Họng tại Quảng Ninh</p>

<p>&nbsp;</p>

<p><a href="https://khamdinhkydanang.com/dieu-tri-buou-co-basedow/" target="_blank" title="ĐIỀU TRỊ BƯỚU CỔ"><img alt="ĐIỀU TRỊ BƯỚU CỔ" src="https://khamdinhkydanang.com/wp-content/uploads/2020/06/101552379_695115731030969_4943321660489990144_n.jpg" /></a></p>

<p><ins><iframe frameborder="0" height="60" id="aswift_5" name="aswift_5" scrolling="no" src="https://googleads.g.doubleclick.net/pagead/ads?client=ca-pub-5704141987475174&amp;output=html&amp;h=60&amp;adk=3610105686&amp;adf=3390337069&amp;pi=t.aa~a.153145694~rp.3&amp;daaos=1667461642326&amp;w=818&amp;fwrn=4&amp;fwrnh=100&amp;lmt=1667485510&amp;rafmt=1&amp;to=qs&amp;pwprc=7421587486&amp;format=818x60&amp;url=https%3A%2F%2Fkhamdinhkydanang.com%2Ftim-bac-si-tai-mui-hong%2F&amp;fwr=0&amp;pra=3&amp;rpe=1&amp;resp_fmts=3&amp;wgl=1&amp;fa=40&amp;adsid=ChAI8M2NmwYQ3uGZ8b7anPktEjkA_WBv2vbLyyRcl80xuVgiXMdFsGun2rQ8b8lkl16q9vBeJoMleaw08L4zGru9yVuxI0yxQAf0DZQ&amp;uach=WyJXaW5kb3dzIiwiMTAuMC4wIiwieDg2IiwiIiwiMTA2LjAuNTI0OS4xMTkiLFtdLGZhbHNlLG51bGwsIjY0IixbWyJDaHJvbWl1bSIsIjEwNi4wLjUyNDkuMTE5Il0sWyJHb29nbGUgQ2hyb21lIiwiMTA2LjAuNTI0OS4xMTkiXSxbIk5vdDtBPUJyYW5kIiwiOTkuMC4wLjAiXV0sZmFsc2Vd&amp;dt=1667485499240&amp;bpp=1&amp;bdt=676&amp;idt=1&amp;shv=r20221101&amp;mjsv=m202210310101&amp;ptt=9&amp;saldr=aa&amp;abxe=1&amp;cookie=ID%3D993e46bffa30ca45-22a203910bd80099%3AT%3D1667484891%3ART%3D1667484891%3AS%3DALNI_MZ18Mw9APlOhHk6BU11XqepXY4TRw&amp;gpic=UID%3D00000b745d4759de%3AT%3D1667484891%3ART%3D1667484891%3AS%3DALNI_MYDqQYlNadJsIrh7AMFYW2wvejYSA&amp;prev_fmts=0x0%2C263x600%2C818x90&amp;nras=4&amp;correlator=7114753404440&amp;frm=20&amp;pv=1&amp;ga_vid=210352639.1667484891&amp;ga_sid=1667485499&amp;ga_hid=39420722&amp;ga_fc=1&amp;u_tz=420&amp;u_his=1&amp;u_h=768&amp;u_w=1366&amp;u_ah=768&amp;u_aw=1304&amp;u_cd=24&amp;u_sd=1&amp;dmc=8&amp;adx=81&amp;ady=2064&amp;biw=1271&amp;bih=536&amp;scr_x=0&amp;scr_y=0&amp;eid=44759875%2C44759926%2C44759842%2C42531705%2C44773613%2C31070663%2C44770880%2C44775016&amp;oid=2&amp;pvsid=4485539834662439&amp;tmod=45491921&amp;uas=0&amp;nvt=1&amp;ref=https%3A%2F%2Fkhamdinhkydanang.com%2Ftin-tuc%2F&amp;eae=0&amp;fc=1920&amp;brdim=0%2C0%2C0%2C0%2C1304%2C0%2C0%2C0%2C1288%2C536&amp;vis=1&amp;rsz=%7C%7Cs%7C&amp;abl=NS&amp;fu=128&amp;bc=31&amp;jar=2022-11-01-06&amp;ifi=6&amp;uci=a!6&amp;btvi=3&amp;fsb=1&amp;xpc=SAyzMNHyVM&amp;p=https%3A//khamdinhkydanang.com&amp;dtd=11440" width="818"></iframe></ins></p>

<p><strong>B&Aacute;C SĨ TAI MŨI HỌNG TẠI C&Aacute;C TỈNH ĐỒNG BẰNG S&Ocirc;NG HỒNG</strong></p>

<p>B&aacute;c sĩ Tai Mũi Họng tại Bắc Ninh<br />
B&aacute;c sĩ Tai Mũi Họng tại H&agrave; Nam<br />
B&aacute;c sĩ Tai Mũi Họng tại Hải Dương<br />
B&aacute;c sĩ Tai Mũi Họng tại Hưng Y&ecirc;n<br />
B&aacute;c sĩ Tai Mũi Họng tại Nam Định<br />
B&aacute;c sĩ Tai Mũi Họng tại Ninh B&igrave;nh<br />
B&aacute;c sĩ Tai Mũi Họng tại Th&aacute;i B&igrave;nh<br />
B&aacute;c sĩ Tai Mũi Họng tại Vĩnh Ph&uacute;c</p>

<p><strong>B&Aacute;C SĨ TAI MŨI HỌNG TẠI C&Aacute;C TỈNH BẮC TRUNG BỘ</strong></p>

<p>B&aacute;c sĩ Tai Mũi Họng tại Thanh H&oacute;a<br />
B&aacute;c sĩ Tai Mũi Họng tại Nghệ An<br />
B&aacute;c sĩ Tai Mũi Họng tại H&agrave; Tĩnh<br />
B&aacute;c sĩ Tai Mũi Họng tại Quảng B&igrave;nh<br />
B&aacute;c sĩ Tai Mũi Họng tại Quảng Trị<br />
B&aacute;c sĩ Tai Mũi Họng tại Thừa Thi&ecirc;n Huế</p>

<p><strong>B&Aacute;C SĨ TAI MŨI HỌNG TẠI C&Aacute;C TỈNH DUY&Ecirc;N HẢI NAM TRUNG TRUNG BỘ</strong></p>

<p>B&aacute;c sĩ Tai Mũi Họng tại Quảng Nam<br />
B&aacute;c sĩ Tai Mũi Họng tại Quảng Ng&atilde;i<br />
B&aacute;c sĩ Tai Mũi Họng tại B&igrave;nh Định<br />
B&aacute;c sĩ Tai Mũi Họng tại Ph&uacute; Y&ecirc;n<br />
B&aacute;c sĩ Tai Mũi Họng tại Kh&aacute;nh H&ograve;a&nbsp;<br />
B&aacute;c sĩ Tai Mũi Họng tại Ninh Thuận&nbsp;</p>

<p>B&aacute;c sĩ Tai Mũi Họng tại B&igrave;nh Thuận</p>
', N'11/3/2022 9:26:04 PM', 1)
INSERT [dbo].[Posts] ([IdPost], [Title], [Image], [Description], [Created], [Status]) VALUES (3, N'Tác hại của thuốc lá điện tử', N'638031076384763273Thuốc-lá-điện-tử-600x400.jpg', N'<p><img alt="" src="https://khamdinhkydanang.com/wp-content/uploads/2021/04/Thu%E1%BB%91c-l%C3%A1-%C4%91i%E1%BB%87n-t%E1%BB%AD.jpg" /></p>

<p>Thuốc l&aacute; điện tử hầu hết đều chứa nicotin, c&oacute; thể g&acirc;y hại cho n&atilde;o bộ của c&aacute;c bạn trẻ ở độ tuổi thanh thiếu ni&ecirc;n. Th&ecirc;m v&agrave;o đ&oacute;, phơi nhiễm nicotin cấp t&iacute;nh c&oacute; t&aacute;c hại rất lớn, đ&atilde; c&oacute; trường hợp trẻ em v&agrave; người lớn bị ngộ độc khi nuốt, h&iacute;t hay bị văng dịch lỏng trong thuốc l&aacute; điện tử v&agrave;o mắt hoặc d&iacute;nh tr&ecirc;n da.</p>

<p><strong>CẤP CỨU NAM SINH H&Ocirc;N M&Ecirc; V&Igrave; SỬ DỤNG TINH DẦU THUỐC L&Aacute; ĐIỆN TỬ</strong></p>

<p>&nbsp;</p>

<p>Bệnh nh&acirc;n Nam, t&ecirc;n l&agrave; L&Ecirc; H.T.A, 16 tuổi. Địa chỉ: P. Phước Mỹ, Quận Sơn Tr&agrave;, TP Đ&agrave; Nẵng.</p>

<p>&nbsp;</p>

<p>Tiếp nhận bệnh nh&acirc;n tại khoa cấp cứu &ndash; Bệnh viện 199. Ghi nhận t&igrave;nh trạng bệnh nh&acirc;n ngay khi cấp cứu với những biểu hiện về thần kinh: lơ mơ, n&oacute;i nhảm , k&ecirc;u la kh&ocirc;ng r&otilde; m&igrave;nh n&oacute;i g&igrave;! T&ecirc; to&agrave;n th&acirc;n, tay ch&acirc;n c&oacute; dấu hiệu co r&uacute;t. Bước đầu ghi nhận bệnh nh&acirc;n ngộ độc chất k&iacute;ch th&iacute;ch t&aacute;c động l&ecirc;n hệ thần kinh g&acirc;y ức chế.</p>

<p>Bệnh nh&acirc;n được xử tr&iacute; thở oxy đảm bảo h&ocirc; hấp, gắn monitor theo d&otilde;i huyết động li&ecirc;n tục , an thần gi&atilde;n cơ, đặt đường truyền, x&eacute;t nghiệm c&aacute;c tiền chất g&acirc;y nghiện sau 01 giờ lưu tại cấp cứu bệnh nh&acirc;n được chuyển v&agrave;o Hồi sức t&iacute;ch cực chống độc theo d&otilde;i v&agrave; điều trị.</p>

<p>Theo lời kể của Gi&aacute;o vi&ecirc;n, sau khi Nam học sinh của trường được bạn cho uống thuốc kh&ocirc;ng r&otilde; loại, n&ecirc;n đ&atilde; c&oacute; biểu hiện lơ mơ, t&ecirc; to&agrave;n th&acirc;n, sau đ&oacute; được đưa v&agrave;o cấp cứu tại Bệnh viện 199.</p>

<p>B&aacute;c sĩ Đỗ Văn T&aacute; &ndash; Khoa kh&aacute;m bệnh &ndash; Cấp cứu cho biết, sau qu&aacute; tr&igrave;nh t&igrave;m hiểu th&igrave; nguy&ecirc;n nh&acirc;n l&agrave; do bệnh nh&acirc;n nuốt phải tinh dầu của thuốc l&aacute; điện tử n&ecirc;n dẫn đến c&aacute;c biểu hiện tr&ecirc;n. Hiện tại bệnh nh&acirc;n đang được điều trị tại Khoa Hồi sức cấp cứu trong t&igrave;nh trạng ổn định.</p>

<p>Thuốc l&aacute; điện tử hầu hết đều chứa nicotin, c&oacute; thể g&acirc;y hại cho n&atilde;o bộ của c&aacute;c bạn trẻ ở độ tuổi thanh thiếu ni&ecirc;n. Th&ecirc;m v&agrave;o đ&oacute;, phơi nhiễm nicotin cấp t&iacute;nh c&oacute; t&aacute;c hại rất lớn, đ&atilde; c&oacute; trường hợp trẻ em v&agrave; người lớn bị ngộ độc khi nuốt, h&iacute;t hay bị văng dịch lỏng trong thuốc l&aacute; điện tử v&agrave;o mắt hoặc d&iacute;nh tr&ecirc;n da.</p>
', N'11/3/2022 9:27:18 PM', 1)
SET IDENTITY_INSERT [dbo].[Posts] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([IdRole], [Name]) VALUES (1, N'Người dùng')
INSERT [dbo].[Roles] ([IdRole], [Name]) VALUES (2, N'Quản trị ')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Services] ON 

INSERT [dbo].[Services] ([IdService], [Name], [Image], [Content], [Price], [Created], [Status]) VALUES (1, N'Tư vấn sức khỏe tại nhà', N'638031069675226284Registration-for-covid-19-testing.jpg', N'<p>Th&ocirc;ng qua nhiều h&igrave;nh thức từ trực tuyến đến trực tiếp tại doanh nghiệp, Bệnh viện 199 của b&aacute;c sĩ c&aacute;c chuy&ecirc;n khoa giải đ&aacute;p c&aacute;c thắc mắc về c&aacute;c bệnh l&yacute;, hướng dẫn chăm s&oacute;c sức khỏe.&nbsp;</p>

<p><img alt="" src="https://khamdinhkydanang.com/wp-content/uploads/2021/06/Registration-for-covid-19-testing.jpg" /></p>
', 50000, N'11/3/2022 9:16:07 PM', 1)
INSERT [dbo].[Services] ([IdService], [Name], [Image], [Content], [Price], [Created], [Status]) VALUES (2, N'Xét nghiệm Covid tại nhà', N'638031072228599090Xét-nghiệm-covid-19-1024x726.jpg', N'<p>Hiện Bệnh viện 199 c&oacute; ch&iacute;nh gi&aacute; rất ưu đ&atilde;i d&agrave;nh cho doanh nghiệp để c&ugrave;ng doanh nghiệp vượt qua đại dịch, gi&uacute;p doanh nghiệp tiết kiệm chi ph&iacute; sản xuất kinh doanh trong m&ugrave;a dịch, cụ thể:&nbsp;</p>

<ul>
	<li><strong>Gi&aacute; x&eacute;t nghiệm test nhanh: 168.000</strong>&nbsp;đ/người&nbsp;<em>(ngo&agrave;i ra Bệnh viện 199 c&ograve;n c&oacute; mẫu gộp test nhanh với chi ph&iacute; CỰC KỲ HỢP L&Yacute; chỉ từ 72.000đ/người, vui l&ograve;ng li&ecirc;n hệ để biết th&ecirc;m chi tiết)</em></li>
	<li><strong>X&eacute;t nghiệm Realtime PCR mẫu gộp: 100.000&nbsp;</strong>đ/người</li>
	<li><strong>X&eacute;t nghiệm Realtime PCR mẫu gộp 5: 150.000</strong>&nbsp;đ/người</li>
</ul>

<p><a href="https://khamdinhkydanang.com/xet-nghiem-covid-19-tai-benh-vien-199/"><img alt="" src="https://khamdinhkydanang.com/wp-content/uploads/2021/06/X%C3%A9t-nghi%E1%BB%87m-covid-19-1024x726.jpg" /></a></p>
', 150000, N'11/3/2022 9:20:22 PM', 1)
INSERT [dbo].[Services] ([IdService], [Name], [Image], [Content], [Price], [Created], [Status]) VALUES (3, N'Tiêm ngừa', N'638031072716192256Khoa-da-liễu-thẩm-mỹ-bệnh-viện-199-1024x683.jpg', N'<p>Bệnh viện 199 cung cấp đầy đủ c&aacute;c g&oacute;i ti&ecirc;m ngừa d&agrave;nh cho người lao động, vi&ecirc;m ti&ecirc;m chủng c&oacute; thể được thực hiện tại doanh nghiệp gi&uacute;p doanh nghiệp tiết kiệm được nhiều thời gian v&agrave; chi ph&iacute;.&nbsp;</p>

<p><img alt="" src="https://khamdinhkydanang.com/wp-content/uploads/2021/04/Khoa-da-li%E1%BB%85u-th%E1%BA%A9m-m%E1%BB%B9-b%E1%BB%87nh-vi%E1%BB%87n-199-1024x683.jpg" /></p>
', 250000, N'11/3/2022 9:21:11 PM', 1)
SET IDENTITY_INSERT [dbo].[Services] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([IdUser], [Email], [FullName], [Password], [PhoneNumber], [Address], [Gender], [Status], [IdRole], [Created]) VALUES (1, N'admin@gmail.com', N'Quản trị viên', N'123456', N'0394073645', N'Hà Nội', N'Nam', 1, 2, NULL)
INSERT [dbo].[Users] ([IdUser], [Email], [FullName], [Password], [PhoneNumber], [Address], [Gender], [Status], [IdRole], [Created]) VALUES (4, N'nhanvien@gmail.com', N'Nhân viên', N'123456', N'0394534554', N'Hà Nội', N'Nam', 1, 2, NULL)
INSERT [dbo].[Users] ([IdUser], [Email], [FullName], [Password], [PhoneNumber], [Address], [Gender], [Status], [IdRole], [Created]) VALUES (5, N'levana@gmail.com', N'Lê Văn A', N'123456', N'0394534556', N'Hà Nội', N'Nam', 1, 1, NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
/****** Object:  Index [IX_IdDoctor]    Script Date: 11/3/2022 10:58:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_IdDoctor] ON [dbo].[Bookings]
(
	[IdDoctor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IdUser]    Script Date: 11/3/2022 10:58:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_IdUser] ON [dbo].[Bookings]
(
	[IdUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IdUser]    Script Date: 11/3/2022 10:58:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_IdUser] ON [dbo].[Numbers]
(
	[IdUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IdRole]    Script Date: 11/3/2022 10:58:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_IdRole] ON [dbo].[Users]
(
	[IdRole] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Bookings_dbo.Doctors_IdDoctor] FOREIGN KEY([IdDoctor])
REFERENCES [dbo].[Doctors] ([IdDoctor])
GO
ALTER TABLE [dbo].[Bookings] CHECK CONSTRAINT [FK_dbo.Bookings_dbo.Doctors_IdDoctor]
GO
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Bookings_dbo.Users_IdUser] FOREIGN KEY([IdUser])
REFERENCES [dbo].[Users] ([IdUser])
GO
ALTER TABLE [dbo].[Bookings] CHECK CONSTRAINT [FK_dbo.Bookings_dbo.Users_IdUser]
GO
ALTER TABLE [dbo].[Numbers]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Numbers_dbo.Users_IdUser] FOREIGN KEY([IdUser])
REFERENCES [dbo].[Users] ([IdUser])
GO
ALTER TABLE [dbo].[Numbers] CHECK CONSTRAINT [FK_dbo.Numbers_dbo.Users_IdUser]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Users_dbo.Roles_IdRole] FOREIGN KEY([IdRole])
REFERENCES [dbo].[Roles] ([IdRole])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_dbo.Users_dbo.Roles_IdRole]
GO
USE [master]
GO
ALTER DATABASE [DBYTeAspMVC] SET  READ_WRITE 
GO
