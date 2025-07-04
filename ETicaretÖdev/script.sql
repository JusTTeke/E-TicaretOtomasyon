USE [master]
GO
/****** Object:  Database [dissaglikmerkezi]    Script Date: 30.05.2025 19:47:56 ******/
CREATE DATABASE [dissaglikmerkezi]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dissaglikmerkezi', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\dissaglikmerkezi.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'dissaglikmerkezi_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\dissaglikmerkezi_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [dissaglikmerkezi] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dissaglikmerkezi].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dissaglikmerkezi] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dissaglikmerkezi] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dissaglikmerkezi] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dissaglikmerkezi] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dissaglikmerkezi] SET ARITHABORT OFF 
GO
ALTER DATABASE [dissaglikmerkezi] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [dissaglikmerkezi] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dissaglikmerkezi] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dissaglikmerkezi] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dissaglikmerkezi] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dissaglikmerkezi] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dissaglikmerkezi] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dissaglikmerkezi] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dissaglikmerkezi] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dissaglikmerkezi] SET  ENABLE_BROKER 
GO
ALTER DATABASE [dissaglikmerkezi] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dissaglikmerkezi] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dissaglikmerkezi] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dissaglikmerkezi] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dissaglikmerkezi] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dissaglikmerkezi] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dissaglikmerkezi] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dissaglikmerkezi] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [dissaglikmerkezi] SET  MULTI_USER 
GO
ALTER DATABASE [dissaglikmerkezi] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dissaglikmerkezi] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dissaglikmerkezi] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dissaglikmerkezi] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [dissaglikmerkezi] SET DELAYED_DURABILITY = DISABLED 
GO
USE [dissaglikmerkezi]
GO
/****** Object:  Table [dbo].[Doktorlar]    Script Date: 30.05.2025 19:47:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doktorlar](
	[DoktorID] [int] IDENTITY(1,1) NOT NULL,
	[Adi] [nvarchar](100) NULL,
	[Soyadi] [nvarchar](100) NULL,
	[Uzmanlik] [nvarchar](100) NULL,
	[TelNo] [nvarchar](20) NULL,
	[Email] [nvarchar](100) NULL,
	[KayitTarihi] [datetime] NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[DoktorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Hastalar]    Script Date: 30.05.2025 19:47:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hastalar](
	[HastaID] [int] IDENTITY(1,1) NOT NULL,
	[Adi] [nvarchar](100) NULL,
	[Soyadi] [nvarchar](100) NULL,
	[DTarih] [date] NULL,
	[TCno] [nvarchar](11) NULL,
	[Cinsiyet] [nvarchar](10) NULL,
	[TelNo] [nvarchar](20) NULL,
	[Email] [nvarchar](100) NULL,
	[Adres] [nvarchar](255) NULL,
	[KayitTarihi] [datetime] NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[HastaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Kullanici]    Script Date: 30.05.2025 19:47:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kullanici](
	[KullaniciID] [int] IDENTITY(1,1) NOT NULL,
	[KullaniciAdi] [nvarchar](50) NOT NULL,
	[Sifre] [nvarchar](30) NOT NULL,
	[Rol] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[KullaniciID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LaboratuvarSonuc]    Script Date: 30.05.2025 19:47:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LaboratuvarSonuc](
	[SonucID] [int] NOT NULL,
	[HastaID] [int] NOT NULL,
	[TestAdi] [nvarchar](255) NOT NULL,
	[SonucDegeri] [nvarchar](255) NULL,
	[TestTarihi] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SonucID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Odeme]    Script Date: 30.05.2025 19:47:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Odeme](
	[OdemeID] [int] NOT NULL,
	[HastaID] [int] NOT NULL,
	[OdemeTarihi] [datetime] NOT NULL,
	[OdemeTutari] [decimal](10, 2) NOT NULL,
	[OdemeYontemi] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[OdemeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Randevular]    Script Date: 30.05.2025 19:47:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Randevular](
	[RandevuID] [int] IDENTITY(1,1) NOT NULL,
	[HastaID] [int] NULL,
	[DoktorID] [int] NULL,
	[RandevuTarihi] [datetime] NULL,
	[RandevuZamani] [time](7) NULL,
	[Sebep] [nvarchar](255) NULL,
	[RandevuDurum] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[RandevuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Recete]    Script Date: 30.05.2025 19:47:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recete](
	[ReceteID] [int] NOT NULL,
	[HastaID] [int] NOT NULL,
	[DoktorID] [int] NOT NULL,
	[IlacAdi] [nvarchar](255) NOT NULL,
	[KullanimTalimatlari] [nvarchar](500) NULL,
	[YazilmaTarihi] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ReceteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tedaviler]    Script Date: 30.05.2025 19:47:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tedaviler](
	[TedaviID] [int] IDENTITY(1,1) NOT NULL,
	[HastaID] [int] NULL,
	[TedaviAdi] [nvarchar](255) NULL,
	[BaslamaTarihi] [datetime] NULL,
	[BitisTarihi] [datetime] NULL,
	[TedaviUcreti] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[TedaviID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Doktorlar] ON 

INSERT [dbo].[Doktorlar] ([DoktorID], [Adi], [Soyadi], [Uzmanlik], [TelNo], [Email], [KayitTarihi]) VALUES (1, N'Ahmet', N'Kaya', N'Diş Hekimi', N'05331234567', N'ahmet.kaya@example.com', CAST(N'2025-04-28 19:30:08.180' AS DateTime))
INSERT [dbo].[Doktorlar] ([DoktorID], [Adi], [Soyadi], [Uzmanlik], [TelNo], [Email], [KayitTarihi]) VALUES (2, N'Mehmet', N'Çelik', N'Ortodontist', N'05333234567', N'mehmet.celik@example.com', CAST(N'2025-04-28 19:30:08.180' AS DateTime))
INSERT [dbo].[Doktorlar] ([DoktorID], [Adi], [Soyadi], [Uzmanlik], [TelNo], [Email], [KayitTarihi]) VALUES (3, N'Ayşe', N'Demir', N'Ağız Diş ve Çene Cerrahisi', N'05335234567', N'ayse.demir@example.com', CAST(N'2025-04-28 19:30:08.180' AS DateTime))
INSERT [dbo].[Doktorlar] ([DoktorID], [Adi], [Soyadi], [Uzmanlik], [TelNo], [Email], [KayitTarihi]) VALUES (4, N'Fatma', N'Yılmaz', N'Diş Hekimi', N'05337234567', N'fatma.yilmaz@example.com', CAST(N'2025-04-28 19:30:08.180' AS DateTime))
INSERT [dbo].[Doktorlar] ([DoktorID], [Adi], [Soyadi], [Uzmanlik], [TelNo], [Email], [KayitTarihi]) VALUES (5, N'Selim', N'Öztürk', N'Diş Hekimi', N'05339234567', N'selim.ozturk@example.com', CAST(N'2025-04-28 19:30:08.180' AS DateTime))
INSERT [dbo].[Doktorlar] ([DoktorID], [Adi], [Soyadi], [Uzmanlik], [TelNo], [Email], [KayitTarihi]) VALUES (6, N'Zeynep', N'Kılıç', N'Pedodontist', N'05331234568', N'zeynep.kilic@example.com', CAST(N'2025-04-28 19:30:08.180' AS DateTime))
INSERT [dbo].[Doktorlar] ([DoktorID], [Adi], [Soyadi], [Uzmanlik], [TelNo], [Email], [KayitTarihi]) VALUES (7, N'Eda', N'Sarı', N'Diş Hekimi', N'05333234568', N'eda.sari@example.com', CAST(N'2025-04-28 19:30:08.180' AS DateTime))
INSERT [dbo].[Doktorlar] ([DoktorID], [Adi], [Soyadi], [Uzmanlik], [TelNo], [Email], [KayitTarihi]) VALUES (8, N'Ali', N'Çetin', N'Ağız Diş ve Çene Cerrahisi', N'05335234568', N'ali.cetin@example.com', CAST(N'2025-04-28 19:30:08.180' AS DateTime))
INSERT [dbo].[Doktorlar] ([DoktorID], [Adi], [Soyadi], [Uzmanlik], [TelNo], [Email], [KayitTarihi]) VALUES (9, N'Gökhan', N'Arslan', N'Ortodontist', N'05337234568', N'gokhan.arslan@example.com', CAST(N'2025-04-28 19:30:08.180' AS DateTime))
INSERT [dbo].[Doktorlar] ([DoktorID], [Adi], [Soyadi], [Uzmanlik], [TelNo], [Email], [KayitTarihi]) VALUES (10, N'İsmail', N'Kurt', N'Protez Diş Hekimi', N'05339234568', N'ismail.kurt@example.com', CAST(N'2025-04-28 19:30:08.180' AS DateTime))
INSERT [dbo].[Doktorlar] ([DoktorID], [Adi], [Soyadi], [Uzmanlik], [TelNo], [Email], [KayitTarihi]) VALUES (11, N'Elif', N'Balkan', N'Diş Hekimi', N'05331234569', N'elif.balkan@example.com', CAST(N'2025-04-28 19:30:08.180' AS DateTime))
INSERT [dbo].[Doktorlar] ([DoktorID], [Adi], [Soyadi], [Uzmanlik], [TelNo], [Email], [KayitTarihi]) VALUES (12, N'Süleyman', N'Yıldız', N'Ortopedik Diş Tedavisi', N'05333234569', N'suleyman.yildiz@example.com', CAST(N'2025-04-28 19:30:08.180' AS DateTime))
INSERT [dbo].[Doktorlar] ([DoktorID], [Adi], [Soyadi], [Uzmanlik], [TelNo], [Email], [KayitTarihi]) VALUES (13, N'Feyza', N'Kara', N'Pedodontist', N'05335234569', N'feyza.kara@example.com', CAST(N'2025-04-28 19:30:08.180' AS DateTime))
INSERT [dbo].[Doktorlar] ([DoktorID], [Adi], [Soyadi], [Uzmanlik], [TelNo], [Email], [KayitTarihi]) VALUES (14, N'Mustafa', N'Güzel', N'Diş Hekimi', N'05337234569', N'mustafa.guzel@example.com', CAST(N'2025-04-28 19:30:08.180' AS DateTime))
INSERT [dbo].[Doktorlar] ([DoktorID], [Adi], [Soyadi], [Uzmanlik], [TelNo], [Email], [KayitTarihi]) VALUES (15, N'Meryem', N'Tanrıverdi', N'Ağız Diş ve Çene Cerrahisi', N'05339234569', N'meryem.tanriverdi@example.com', CAST(N'2025-04-28 19:30:08.180' AS DateTime))
INSERT [dbo].[Doktorlar] ([DoktorID], [Adi], [Soyadi], [Uzmanlik], [TelNo], [Email], [KayitTarihi]) VALUES (16, N'Hakan', N'Çelik', N'Ortodontist', N'05331234570', N'hakan.celik@example.com', CAST(N'2025-04-28 19:30:08.180' AS DateTime))
INSERT [dbo].[Doktorlar] ([DoktorID], [Adi], [Soyadi], [Uzmanlik], [TelNo], [Email], [KayitTarihi]) VALUES (17, N'Veli', N'Demirtaş', N'Protez Diş Hekimi', N'05333234570', N'veli.demirtas@example.com', CAST(N'2025-04-28 19:30:08.180' AS DateTime))
INSERT [dbo].[Doktorlar] ([DoktorID], [Adi], [Soyadi], [Uzmanlik], [TelNo], [Email], [KayitTarihi]) VALUES (18, N'Büşra', N'Güven', N'Diş Hekimi', N'05335234570', N'busra.guven@example.com', CAST(N'2025-04-28 19:30:08.180' AS DateTime))
INSERT [dbo].[Doktorlar] ([DoktorID], [Adi], [Soyadi], [Uzmanlik], [TelNo], [Email], [KayitTarihi]) VALUES (19, N'Kemal', N'Şahin', N'Ağız Diş ve Çene Cerrahisi', N'05337234570', N'kemal.sahin@example.com', CAST(N'2025-04-28 19:30:08.180' AS DateTime))
INSERT [dbo].[Doktorlar] ([DoktorID], [Adi], [Soyadi], [Uzmanlik], [TelNo], [Email], [KayitTarihi]) VALUES (20, N'Seda', N'Bozkurt', N'Diş Hekimi', N'05339234570', N'seda.bozkurt@example.com', CAST(N'2025-04-28 19:30:08.180' AS DateTime))
SET IDENTITY_INSERT [dbo].[Doktorlar] OFF
SET IDENTITY_INSERT [dbo].[Hastalar] ON 

INSERT [dbo].[Hastalar] ([HastaID], [Adi], [Soyadi], [DTarih], [TCno], [Cinsiyet], [TelNo], [Email], [Adres], [KayitTarihi]) VALUES (1, N'Ali', N'Yamalı', CAST(N'1990-05-15' AS Date), N'12345678901', N'Erkek', N'05321234567', N'ali@example.com', N'İstanbul', CAST(N'2025-04-28 19:30:08.193' AS DateTime))
INSERT [dbo].[Hastalar] ([HastaID], [Adi], [Soyadi], [DTarih], [TCno], [Cinsiyet], [TelNo], [Email], [Adres], [KayitTarihi]) VALUES (2, N'Ali', N'Kara', CAST(N'1990-02-15' AS Date), N'23456789012', N'Erkek', N'05321234567', N'ali.kara@example.com', N'İstanbul, Beylikdüzü', CAST(N'2025-04-28 19:30:08.193' AS DateTime))
INSERT [dbo].[Hastalar] ([HastaID], [Adi], [Soyadi], [DTarih], [TCno], [Cinsiyet], [TelNo], [Email], [Adres], [KayitTarihi]) VALUES (3, N'Mehmet', N'Yılmaz', CAST(N'1985-06-20' AS Date), N'34567890123', N'Erkek', N'05322345678', N'mehmet.yilmaz@example.com', N'Ankara, Çankaya', CAST(N'2025-04-28 19:30:08.193' AS DateTime))
INSERT [dbo].[Hastalar] ([HastaID], [Adi], [Soyadi], [DTarih], [TCno], [Cinsiyet], [TelNo], [Email], [Adres], [KayitTarihi]) VALUES (4, N'Ayşe', N'Çelik', CAST(N'1992-11-10' AS Date), N'45678901234', N'Kadın', N'05323456789', N'ayse.celik@example.com', N'İzmir, Konak', CAST(N'2025-04-28 19:30:08.193' AS DateTime))
INSERT [dbo].[Hastalar] ([HastaID], [Adi], [Soyadi], [DTarih], [TCno], [Cinsiyet], [TelNo], [Email], [Adres], [KayitTarihi]) VALUES (5, N'Fatma', N'Demir', CAST(N'1989-03-25' AS Date), N'56789012345', N'Kadın', N'05324567890', N'fatma.demir@example.com', N'Bursa, Nilüfer', CAST(N'2025-04-28 19:30:08.193' AS DateTime))
INSERT [dbo].[Hastalar] ([HastaID], [Adi], [Soyadi], [DTarih], [TCno], [Cinsiyet], [TelNo], [Email], [Adres], [KayitTarihi]) VALUES (6, N'Selim', N'Güzel', CAST(N'1987-01-15' AS Date), N'67890123456', N'Erkek', N'05325678901', N'selim.guzel@example.com', N'Antalya, Muratpaşa', CAST(N'2025-04-28 19:30:08.193' AS DateTime))
INSERT [dbo].[Hastalar] ([HastaID], [Adi], [Soyadi], [DTarih], [TCno], [Cinsiyet], [TelNo], [Email], [Adres], [KayitTarihi]) VALUES (7, N'Zeynep', N'Kaya', CAST(N'1995-07-05' AS Date), N'78901234567', N'Kadın', N'05326789012', N'zeynep.kaya@example.com', N'Adana, Seyhan', CAST(N'2025-04-28 19:30:08.193' AS DateTime))
INSERT [dbo].[Hastalar] ([HastaID], [Adi], [Soyadi], [DTarih], [TCno], [Cinsiyet], [TelNo], [Email], [Adres], [KayitTarihi]) VALUES (8, N'Eda', N'Sarı', CAST(N'1993-09-17' AS Date), N'89012345678', N'Kadın', N'05327890123', N'eda.sari@example.com', N'Eskişehir, Odunpazarı', CAST(N'2025-04-28 19:30:08.193' AS DateTime))
INSERT [dbo].[Hastalar] ([HastaID], [Adi], [Soyadi], [DTarih], [TCno], [Cinsiyet], [TelNo], [Email], [Adres], [KayitTarihi]) VALUES (9, N'Ali', N'Öztürk', CAST(N'1988-12-02' AS Date), N'90123456789', N'Erkek', N'05328901234', N'ali.ozturk@example.com', N'Kocaeli, İzmit', CAST(N'2025-04-28 19:30:08.193' AS DateTime))
INSERT [dbo].[Hastalar] ([HastaID], [Adi], [Soyadi], [DTarih], [TCno], [Cinsiyet], [TelNo], [Email], [Adres], [KayitTarihi]) VALUES (10, N'İsmail', N'Arslan', CAST(N'1994-05-23' AS Date), N'11223344556', N'Erkek', N'05329012345', N'ismail.arslan@example.com', N'Sakarya, Adapazarı', CAST(N'2025-04-28 19:30:08.193' AS DateTime))
INSERT [dbo].[Hastalar] ([HastaID], [Adi], [Soyadi], [DTarih], [TCno], [Cinsiyet], [TelNo], [Email], [Adres], [KayitTarihi]) VALUES (11, N'Meryem', N'Bozkurt', CAST(N'1991-04-18' AS Date), N'22334455667', N'Kadın', N'05330123456', N'meryem.bozkurt@example.com', N'Denizli, Merkezefendi', CAST(N'2025-04-28 19:30:08.193' AS DateTime))
INSERT [dbo].[Hastalar] ([HastaID], [Adi], [Soyadi], [DTarih], [TCno], [Cinsiyet], [TelNo], [Email], [Adres], [KayitTarihi]) VALUES (12, N'Kemal', N'Şahin', CAST(N'1986-08-30' AS Date), N'33445566778', N'Erkek', N'05331234567', N'kemal.sahin@example.com', N'Balıkesir, Karesi', CAST(N'2025-04-28 19:30:08.193' AS DateTime))
INSERT [dbo].[Hastalar] ([HastaID], [Adi], [Soyadi], [DTarih], [TCno], [Cinsiyet], [TelNo], [Email], [Adres], [KayitTarihi]) VALUES (13, N'Büşra', N'Tanrıverdi', CAST(N'1994-01-05' AS Date), N'44556677889', N'Kadın', N'05332345678', N'busra.tanriverdi@example.com', N'Manisa, Şehzadeler', CAST(N'2025-04-28 19:30:08.193' AS DateTime))
INSERT [dbo].[Hastalar] ([HastaID], [Adi], [Soyadi], [DTarih], [TCno], [Cinsiyet], [TelNo], [Email], [Adres], [KayitTarihi]) VALUES (14, N'Feyza', N'Yıldız', CAST(N'1992-03-12' AS Date), N'55667788990', N'Kadın', N'05333456789', N'feyza.yildiz@example.com', N'Gaziantep, Şahinbey', CAST(N'2025-04-28 19:30:08.193' AS DateTime))
INSERT [dbo].[Hastalar] ([HastaID], [Adi], [Soyadi], [DTarih], [TCno], [Cinsiyet], [TelNo], [Email], [Adres], [KayitTarihi]) VALUES (15, N'Mustafa', N'Kurt', CAST(N'1987-11-22' AS Date), N'66778899001', N'Erkek', N'05334567890', N'mustafa.kurt@example.com', N'Konya, Meram', CAST(N'2025-04-28 19:30:08.193' AS DateTime))
INSERT [dbo].[Hastalar] ([HastaID], [Adi], [Soyadi], [DTarih], [TCno], [Cinsiyet], [TelNo], [Email], [Adres], [KayitTarihi]) VALUES (16, N'Hakan', N'Çetin', CAST(N'1990-06-17' AS Date), N'77889900112', N'Erkek', N'05335678901', N'hakan.cetin@example.com', N'Trabzon, Ortahisar', CAST(N'2025-04-28 19:30:08.193' AS DateTime))
INSERT [dbo].[Hastalar] ([HastaID], [Adi], [Soyadi], [DTarih], [TCno], [Cinsiyet], [TelNo], [Email], [Adres], [KayitTarihi]) VALUES (17, N'Seda', N'Kılıç', CAST(N'1996-10-30' AS Date), N'88990011223', N'Kadın', N'05336789012', N'seda.kilic@example.com', N'Samsun, İlkadım', CAST(N'2025-04-28 19:30:08.193' AS DateTime))
INSERT [dbo].[Hastalar] ([HastaID], [Adi], [Soyadi], [DTarih], [TCno], [Cinsiyet], [TelNo], [Email], [Adres], [KayitTarihi]) VALUES (18, N'Gökhan', N'Güler', CAST(N'1991-12-10' AS Date), N'99001122334', N'Erkek', N'05337890123', N'gokhan.guler@example.com', N'Tekirdağ, Süleymanpaşa', CAST(N'2025-04-28 19:30:08.193' AS DateTime))
INSERT [dbo].[Hastalar] ([HastaID], [Adi], [Soyadi], [DTarih], [TCno], [Cinsiyet], [TelNo], [Email], [Adres], [KayitTarihi]) VALUES (19, N'Veli', N'Demirtaş', CAST(N'1984-09-21' AS Date), N'10111213141', N'Erkek', N'05338901234', N'veli.demirtas@example.com', N'Edirne, Merkez', CAST(N'2025-04-28 19:30:08.193' AS DateTime))
INSERT [dbo].[Hastalar] ([HastaID], [Adi], [Soyadi], [DTarih], [TCno], [Cinsiyet], [TelNo], [Email], [Adres], [KayitTarihi]) VALUES (20, N'İsmail', N'Süleyman', CAST(N'1995-04-25' AS Date), N'12131415161', N'Erkek', N'05339012345', N'ismail.suleyman@example.com', N'Aydın, Efeler', CAST(N'2025-04-28 19:30:08.193' AS DateTime))
INSERT [dbo].[Hastalar] ([HastaID], [Adi], [Soyadi], [DTarih], [TCno], [Cinsiyet], [TelNo], [Email], [Adres], [KayitTarihi]) VALUES (21, N'Büşra', N'Balkan', CAST(N'1990-07-12' AS Date), N'13141516171', N'Kadın', N'05340123456', N'busra.balkan@example.com', N'Mardin, Artuklu', CAST(N'2025-04-28 19:30:08.193' AS DateTime))
INSERT [dbo].[Hastalar] ([HastaID], [Adi], [Soyadi], [DTarih], [TCno], [Cinsiyet], [TelNo], [Email], [Adres], [KayitTarihi]) VALUES (22, N'Ali', N'Erdoğan', CAST(N'1987-02-03' AS Date), N'14151617181', N'Erkek', N'05341234567', N'ali.erdogan@example.com', N'Bolu, Merkez', CAST(N'2025-04-28 19:30:08.193' AS DateTime))
INSERT [dbo].[Hastalar] ([HastaID], [Adi], [Soyadi], [DTarih], [TCno], [Cinsiyet], [TelNo], [Email], [Adres], [KayitTarihi]) VALUES (23, N'Ayşe', N'Güven', CAST(N'1992-11-10' AS Date), N'15161718191', N'Kadın', N'05342345678', N'ayse.guven@example.com', N'Diyarbakır, Bağlar', CAST(N'2025-04-28 19:30:08.193' AS DateTime))
INSERT [dbo].[Hastalar] ([HastaID], [Adi], [Soyadi], [DTarih], [TCno], [Cinsiyet], [TelNo], [Email], [Adres], [KayitTarihi]) VALUES (24, N'Murat', N'Özdemir', CAST(N'1993-05-19' AS Date), N'16171819201', N'Erkek', N'05343456789', N'murat.ozdemir@example.com', N'Elazığ, Merkez', CAST(N'2025-04-28 19:30:08.193' AS DateTime))
INSERT [dbo].[Hastalar] ([HastaID], [Adi], [Soyadi], [DTarih], [TCno], [Cinsiyet], [TelNo], [Email], [Adres], [KayitTarihi]) VALUES (25, N'Gülcan', N'Yılmaz', CAST(N'1995-03-17' AS Date), N'17181920312', N'Kadın', N'05344567890', N'gulcan.yilmaz@example.com', N'Rize, Merkez', CAST(N'2025-04-28 19:30:08.193' AS DateTime))
INSERT [dbo].[Hastalar] ([HastaID], [Adi], [Soyadi], [DTarih], [TCno], [Cinsiyet], [TelNo], [Email], [Adres], [KayitTarihi]) VALUES (26, N'Şahin', N'Aydın', CAST(N'1994-08-20' AS Date), N'18192031423', N'Erkek', N'05345678901', N'sahin.aydin@example.com', N'Zonguldak, Merkez', CAST(N'2025-04-28 19:30:08.193' AS DateTime))
INSERT [dbo].[Hastalar] ([HastaID], [Adi], [Soyadi], [DTarih], [TCno], [Cinsiyet], [TelNo], [Email], [Adres], [KayitTarihi]) VALUES (27, N'Sinem', N'Vural', CAST(N'1991-10-25' AS Date), N'19203142534', N'Kadın', N'05346789012', N'sinem.vural@example.com', N'Aksaray, Merkez', CAST(N'2025-04-28 19:30:08.193' AS DateTime))
INSERT [dbo].[Hastalar] ([HastaID], [Adi], [Soyadi], [DTarih], [TCno], [Cinsiyet], [TelNo], [Email], [Adres], [KayitTarihi]) VALUES (28, N'Ramazan', N'Demircan', CAST(N'1989-01-10' AS Date), N'20314253645', N'Erkek', N'05347890123', N'ramazan.demircan@example.com', N'Giresun, Merkez', CAST(N'2025-04-28 19:30:08.193' AS DateTime))
INSERT [dbo].[Hastalar] ([HastaID], [Adi], [Soyadi], [DTarih], [TCno], [Cinsiyet], [TelNo], [Email], [Adres], [KayitTarihi]) VALUES (29, N'Ömer', N'Sarıoğlu', CAST(N'1986-12-15' AS Date), N'21425364756', N'Erkek', N'05348901234', N'omer.sarioglu@example.com', N'Kırklareli, Merkez', CAST(N'2025-04-28 19:30:08.193' AS DateTime))
INSERT [dbo].[Hastalar] ([HastaID], [Adi], [Soyadi], [DTarih], [TCno], [Cinsiyet], [TelNo], [Email], [Adres], [KayitTarihi]) VALUES (30, N'Zeynep', N'Yavuz', CAST(N'1990-05-04' AS Date), N'22536475867', N'Kadın', N'05349012345', N'zeynep.yavuz@example.com', N'Çorum, Merkez', CAST(N'2025-04-28 19:30:08.193' AS DateTime))
INSERT [dbo].[Hastalar] ([HastaID], [Adi], [Soyadi], [DTarih], [TCno], [Cinsiyet], [TelNo], [Email], [Adres], [KayitTarihi]) VALUES (31, N'Faruk', N'Atalay', CAST(N'1988-11-06' AS Date), N'23647586978', N'Erkek', N'05350123456', N'faruk.atalay@example.com', N'Niğde, Merkez', CAST(N'2025-04-28 19:30:08.193' AS DateTime))
INSERT [dbo].[Hastalar] ([HastaID], [Adi], [Soyadi], [DTarih], [TCno], [Cinsiyet], [TelNo], [Email], [Adres], [KayitTarihi]) VALUES (32, N'Beyza', N'Kurtuluş', CAST(N'1996-02-14' AS Date), N'24758697089', N'Kadın', N'05351234567', N'beyza.kurtulus@example.com', N'Nevşehir, Merkez', CAST(N'2025-04-28 19:30:08.193' AS DateTime))
INSERT [dbo].[Hastalar] ([HastaID], [Adi], [Soyadi], [DTarih], [TCno], [Cinsiyet], [TelNo], [Email], [Adres], [KayitTarihi]) VALUES (33, N'Alper', N'Süleyman', CAST(N'1985-07-22' AS Date), N'25869708190', N'Erkek', N'05352345678', N'alper.suleyman@example.com', N'Tokat, Merkez', CAST(N'2025-04-28 19:30:08.193' AS DateTime))
INSERT [dbo].[Hastalar] ([HastaID], [Adi], [Soyadi], [DTarih], [TCno], [Cinsiyet], [TelNo], [Email], [Adres], [KayitTarihi]) VALUES (34, N'Asuman', N'Özkan', CAST(N'1991-12-08' AS Date), N'26970819201', N'Kadın', N'05353456789', N'asuman.ozkan@example.com', N'Çanakkale, Merkez', CAST(N'2025-04-28 19:30:08.193' AS DateTime))
INSERT [dbo].[Hastalar] ([HastaID], [Adi], [Soyadi], [DTarih], [TCno], [Cinsiyet], [TelNo], [Email], [Adres], [KayitTarihi]) VALUES (35, N'Emre', N'Kara', CAST(N'1987-09-03' AS Date), N'27081920312', N'Erkek', N'05354567890', N'emre.kara@example.com', N'Bartın, Merkez', CAST(N'2025-04-28 19:30:08.193' AS DateTime))
INSERT [dbo].[Hastalar] ([HastaID], [Adi], [Soyadi], [DTarih], [TCno], [Cinsiyet], [TelNo], [Email], [Adres], [KayitTarihi]) VALUES (36, N'Rabia', N'Cevik', CAST(N'1992-04-15' AS Date), N'28192031423', N'Kadın', N'05355678901', N'rabia.cevik@example.com', N'Çankırı, Merkez', CAST(N'2025-04-28 19:30:08.193' AS DateTime))
INSERT [dbo].[Hastalar] ([HastaID], [Adi], [Soyadi], [DTarih], [TCno], [Cinsiyet], [TelNo], [Email], [Adres], [KayitTarihi]) VALUES (37, N'Ferhat', N'Kılıçarslan', CAST(N'1984-10-25' AS Date), N'29303142534', N'Erkek', N'05356789012', N'ferhat.kilicarslan@example.com', N'Burdur, Merkez', CAST(N'2025-04-28 19:30:08.193' AS DateTime))
INSERT [dbo].[Hastalar] ([HastaID], [Adi], [Soyadi], [DTarih], [TCno], [Cinsiyet], [TelNo], [Email], [Adres], [KayitTarihi]) VALUES (38, N'İrem', N'Kavak', CAST(N'1993-01-30' AS Date), N'30414253645', N'Kadın', N'05357890123', N'irem.kavak@example.com', N'Yozgat, Merkez', CAST(N'2025-04-28 19:30:08.193' AS DateTime))
INSERT [dbo].[Hastalar] ([HastaID], [Adi], [Soyadi], [DTarih], [TCno], [Cinsiyet], [TelNo], [Email], [Adres], [KayitTarihi]) VALUES (39, N'Duygu', N'Yüksel', CAST(N'1996-03-02' AS Date), N'31525364756', N'Kadın', N'05358901234', N'duygu.yuksel@example.com', N'Aksaray, Merkez', CAST(N'2025-04-28 19:30:08.193' AS DateTime))
INSERT [dbo].[Hastalar] ([HastaID], [Adi], [Soyadi], [DTarih], [TCno], [Cinsiyet], [TelNo], [Email], [Adres], [KayitTarihi]) VALUES (40, N'Burak', N'Özdemir', CAST(N'1985-05-16' AS Date), N'10080162123', N'Erkek', N'05359012345', N'burak.ozdemir@example.com', N'Muş, Merkez', CAST(N'2025-04-28 19:30:08.193' AS DateTime))
SET IDENTITY_INSERT [dbo].[Hastalar] OFF
SET IDENTITY_INSERT [dbo].[Kullanici] ON 

INSERT [dbo].[Kullanici] ([KullaniciID], [KullaniciAdi], [Sifre], [Rol]) VALUES (1, N'ayşe.kaya', N'kaya', N'Personel')
INSERT [dbo].[Kullanici] ([KullaniciID], [KullaniciAdi], [Sifre], [Rol]) VALUES (2, N'ali.beşler', N'beşler', N'Personel')
SET IDENTITY_INSERT [dbo].[Kullanici] OFF
INSERT [dbo].[LaboratuvarSonuc] ([SonucID], [HastaID], [TestAdi], [SonucDegeri], [TestTarihi]) VALUES (6, 6, N'Kan Testi', N'Normal', CAST(N'2025-03-25 00:00:00.000' AS DateTime))
INSERT [dbo].[LaboratuvarSonuc] ([SonucID], [HastaID], [TestAdi], [SonucDegeri], [TestTarihi]) VALUES (7, 7, N'Diş Filmi', N'Çürük tespit edildi.', CAST(N'2025-03-26 00:00:00.000' AS DateTime))
INSERT [dbo].[LaboratuvarSonuc] ([SonucID], [HastaID], [TestAdi], [SonucDegeri], [TestTarihi]) VALUES (8, 8, N'Ağız Kültürü', N'Bakteriyel enfeksiyon yok.', CAST(N'2025-03-27 00:00:00.000' AS DateTime))
INSERT [dbo].[LaboratuvarSonuc] ([SonucID], [HastaID], [TestAdi], [SonucDegeri], [TestTarihi]) VALUES (9, 9, N'Diş Röntgeni', N'Dolgu gerekli.', CAST(N'2025-03-28 00:00:00.000' AS DateTime))
INSERT [dbo].[LaboratuvarSonuc] ([SonucID], [HastaID], [TestAdi], [SonucDegeri], [TestTarihi]) VALUES (10, 10, N'Kan Testi', N'Normal', CAST(N'2025-03-29 00:00:00.000' AS DateTime))
INSERT [dbo].[LaboratuvarSonuc] ([SonucID], [HastaID], [TestAdi], [SonucDegeri], [TestTarihi]) VALUES (11, 11, N'Protez Uygunluk Testi', N'Sorunsuz', CAST(N'2025-03-30 00:00:00.000' AS DateTime))
INSERT [dbo].[LaboratuvarSonuc] ([SonucID], [HastaID], [TestAdi], [SonucDegeri], [TestTarihi]) VALUES (12, 12, N'Diş Filmi', N'Temiz', CAST(N'2025-03-31 00:00:00.000' AS DateTime))
INSERT [dbo].[LaboratuvarSonuc] ([SonucID], [HastaID], [TestAdi], [SonucDegeri], [TestTarihi]) VALUES (13, 13, N'Ağız Kültürü', N'Bakteriyel enfeksiyon bulundu.', CAST(N'2025-04-01 00:00:00.000' AS DateTime))
INSERT [dbo].[LaboratuvarSonuc] ([SonucID], [HastaID], [TestAdi], [SonucDegeri], [TestTarihi]) VALUES (14, 14, N'Diş Röntgeni', N'Normal', CAST(N'2025-04-02 00:00:00.000' AS DateTime))
INSERT [dbo].[LaboratuvarSonuc] ([SonucID], [HastaID], [TestAdi], [SonucDegeri], [TestTarihi]) VALUES (15, 15, N'Kan Testi', N'Vitamin eksikliği tespit edildi.', CAST(N'2025-04-03 00:00:00.000' AS DateTime))
INSERT [dbo].[Odeme] ([OdemeID], [HastaID], [OdemeTarihi], [OdemeTutari], [OdemeYontemi]) VALUES (6, 6, CAST(N'2025-03-25 00:00:00.000' AS DateTime), CAST(200.00 AS Decimal(10, 2)), N'Havale')
INSERT [dbo].[Odeme] ([OdemeID], [HastaID], [OdemeTarihi], [OdemeTutari], [OdemeYontemi]) VALUES (7, 7, CAST(N'2025-03-26 00:00:00.000' AS DateTime), CAST(400.00 AS Decimal(10, 2)), N'Kredi Kartı')
INSERT [dbo].[Odeme] ([OdemeID], [HastaID], [OdemeTarihi], [OdemeTutari], [OdemeYontemi]) VALUES (8, 8, CAST(N'2025-03-27 00:00:00.000' AS DateTime), CAST(2500.00 AS Decimal(10, 2)), N'Nakit')
INSERT [dbo].[Odeme] ([OdemeID], [HastaID], [OdemeTarihi], [OdemeTutari], [OdemeYontemi]) VALUES (9, 9, CAST(N'2025-03-28 00:00:00.000' AS DateTime), CAST(500.00 AS Decimal(10, 2)), N'Kredi Kartı')
INSERT [dbo].[Odeme] ([OdemeID], [HastaID], [OdemeTarihi], [OdemeTutari], [OdemeYontemi]) VALUES (10, 10, CAST(N'2025-03-29 00:00:00.000' AS DateTime), CAST(300.00 AS Decimal(10, 2)), N'Havale')
INSERT [dbo].[Odeme] ([OdemeID], [HastaID], [OdemeTarihi], [OdemeTutari], [OdemeYontemi]) VALUES (11, 11, CAST(N'2025-03-30 00:00:00.000' AS DateTime), CAST(1000.00 AS Decimal(10, 2)), N'Nakit')
INSERT [dbo].[Odeme] ([OdemeID], [HastaID], [OdemeTarihi], [OdemeTutari], [OdemeYontemi]) VALUES (12, 12, CAST(N'2025-03-31 00:00:00.000' AS DateTime), CAST(400.00 AS Decimal(10, 2)), N'Kredi Kartı')
INSERT [dbo].[Odeme] ([OdemeID], [HastaID], [OdemeTarihi], [OdemeTutari], [OdemeYontemi]) VALUES (13, 13, CAST(N'2025-04-01 00:00:00.000' AS DateTime), CAST(2500.00 AS Decimal(10, 2)), N'Havale')
INSERT [dbo].[Odeme] ([OdemeID], [HastaID], [OdemeTarihi], [OdemeTutari], [OdemeYontemi]) VALUES (14, 14, CAST(N'2025-04-02 00:00:00.000' AS DateTime), CAST(500.00 AS Decimal(10, 2)), N'Nakit')
INSERT [dbo].[Odeme] ([OdemeID], [HastaID], [OdemeTarihi], [OdemeTutari], [OdemeYontemi]) VALUES (15, 15, CAST(N'2025-04-03 00:00:00.000' AS DateTime), CAST(150.00 AS Decimal(10, 2)), N'Kredi Kartı')
SET IDENTITY_INSERT [dbo].[Randevular] ON 

INSERT [dbo].[Randevular] ([RandevuID], [HastaID], [DoktorID], [RandevuTarihi], [RandevuZamani], [Sebep], [RandevuDurum]) VALUES (1, 1, 1, CAST(N'2025-03-20 00:00:00.000' AS DateTime), CAST(N'09:00:00' AS Time), N'Diş Çekimi', N'Planlanmış')
INSERT [dbo].[Randevular] ([RandevuID], [HastaID], [DoktorID], [RandevuTarihi], [RandevuZamani], [Sebep], [RandevuDurum]) VALUES (2, 2, 1, CAST(N'2025-03-21 00:00:00.000' AS DateTime), CAST(N'10:00:00' AS Time), N'Ortodontik Tedavi', N'Planlanmış')
INSERT [dbo].[Randevular] ([RandevuID], [HastaID], [DoktorID], [RandevuTarihi], [RandevuZamani], [Sebep], [RandevuDurum]) VALUES (3, 3, 1, CAST(N'2025-03-22 00:00:00.000' AS DateTime), CAST(N'11:00:00' AS Time), N'Ağız Cerrahisi', N'Planlanmış')
INSERT [dbo].[Randevular] ([RandevuID], [HastaID], [DoktorID], [RandevuTarihi], [RandevuZamani], [Sebep], [RandevuDurum]) VALUES (4, 4, 2, CAST(N'2025-03-23 00:00:00.000' AS DateTime), CAST(N'14:00:00' AS Time), N'Diş Dolgusu', N'Planlanmış')
INSERT [dbo].[Randevular] ([RandevuID], [HastaID], [DoktorID], [RandevuTarihi], [RandevuZamani], [Sebep], [RandevuDurum]) VALUES (5, 5, 2, CAST(N'2025-03-24 00:00:00.000' AS DateTime), CAST(N'15:00:00' AS Time), N'Diş Çekimi', N'Planlanmış')
INSERT [dbo].[Randevular] ([RandevuID], [HastaID], [DoktorID], [RandevuTarihi], [RandevuZamani], [Sebep], [RandevuDurum]) VALUES (6, 6, 3, CAST(N'2025-03-25 00:00:00.000' AS DateTime), CAST(N'16:00:00' AS Time), N'Pedodontik Tedavi', N'Planlanmış')
INSERT [dbo].[Randevular] ([RandevuID], [HastaID], [DoktorID], [RandevuTarihi], [RandevuZamani], [Sebep], [RandevuDurum]) VALUES (7, 7, 3, CAST(N'2025-03-26 00:00:00.000' AS DateTime), CAST(N'17:00:00' AS Time), N'Diş Beyazlatma', N'Planlanmış')
INSERT [dbo].[Randevular] ([RandevuID], [HastaID], [DoktorID], [RandevuTarihi], [RandevuZamani], [Sebep], [RandevuDurum]) VALUES (8, 8, 4, CAST(N'2025-03-27 00:00:00.000' AS DateTime), CAST(N'18:00:00' AS Time), N'Ortodontik Tedavi', N'Planlanmış')
INSERT [dbo].[Randevular] ([RandevuID], [HastaID], [DoktorID], [RandevuTarihi], [RandevuZamani], [Sebep], [RandevuDurum]) VALUES (9, 9, 4, CAST(N'2025-03-28 00:00:00.000' AS DateTime), CAST(N'09:30:00' AS Time), N'Ağız Cerrahisi', N'Planlanmış')
INSERT [dbo].[Randevular] ([RandevuID], [HastaID], [DoktorID], [RandevuTarihi], [RandevuZamani], [Sebep], [RandevuDurum]) VALUES (10, 10, 5, CAST(N'2025-03-29 00:00:00.000' AS DateTime), CAST(N'10:30:00' AS Time), N'Diş Dolgusu', N'Planlanmış')
INSERT [dbo].[Randevular] ([RandevuID], [HastaID], [DoktorID], [RandevuTarihi], [RandevuZamani], [Sebep], [RandevuDurum]) VALUES (11, 11, 5, CAST(N'2025-03-30 00:00:00.000' AS DateTime), CAST(N'12:00:00' AS Time), N'Protez Tedavisi', N'Planlanmış')
INSERT [dbo].[Randevular] ([RandevuID], [HastaID], [DoktorID], [RandevuTarihi], [RandevuZamani], [Sebep], [RandevuDurum]) VALUES (12, 12, 6, CAST(N'2025-03-31 00:00:00.000' AS DateTime), CAST(N'12:00:00' AS Time), N'Diş Beyazlatma', N'Planlanmış')
INSERT [dbo].[Randevular] ([RandevuID], [HastaID], [DoktorID], [RandevuTarihi], [RandevuZamani], [Sebep], [RandevuDurum]) VALUES (13, 13, 6, CAST(N'2025-04-01 00:00:00.000' AS DateTime), CAST(N'13:00:00' AS Time), N'Ortodontik Tedavi', N'Planlanmış')
INSERT [dbo].[Randevular] ([RandevuID], [HastaID], [DoktorID], [RandevuTarihi], [RandevuZamani], [Sebep], [RandevuDurum]) VALUES (14, 14, 7, CAST(N'2025-04-02 00:00:00.000' AS DateTime), CAST(N'14:00:00' AS Time), N'Ağız Cerrahisi', N'Planlanmış')
INSERT [dbo].[Randevular] ([RandevuID], [HastaID], [DoktorID], [RandevuTarihi], [RandevuZamani], [Sebep], [RandevuDurum]) VALUES (15, 15, 7, CAST(N'2025-04-03 00:00:00.000' AS DateTime), CAST(N'15:00:00' AS Time), N'Diş Çekimi', N'Planlanmış')
INSERT [dbo].[Randevular] ([RandevuID], [HastaID], [DoktorID], [RandevuTarihi], [RandevuZamani], [Sebep], [RandevuDurum]) VALUES (16, 16, 8, CAST(N'2025-04-04 00:00:00.000' AS DateTime), CAST(N'16:00:00' AS Time), N'Pedodontik Tedavi', N'Planlanmış')
INSERT [dbo].[Randevular] ([RandevuID], [HastaID], [DoktorID], [RandevuTarihi], [RandevuZamani], [Sebep], [RandevuDurum]) VALUES (17, 17, 8, CAST(N'2025-04-05 00:00:00.000' AS DateTime), CAST(N'17:00:00' AS Time), N'Diş Beyazlatma', N'Planlanmış')
INSERT [dbo].[Randevular] ([RandevuID], [HastaID], [DoktorID], [RandevuTarihi], [RandevuZamani], [Sebep], [RandevuDurum]) VALUES (18, 18, 9, CAST(N'2025-04-06 00:00:00.000' AS DateTime), CAST(N'18:00:00' AS Time), N'Ortodontik Tedavi', N'Planlanmış')
INSERT [dbo].[Randevular] ([RandevuID], [HastaID], [DoktorID], [RandevuTarihi], [RandevuZamani], [Sebep], [RandevuDurum]) VALUES (19, 19, 9, CAST(N'2025-04-07 00:00:00.000' AS DateTime), CAST(N'09:00:00' AS Time), N'Ağız Cerrahisi', N'Planlanmış')
INSERT [dbo].[Randevular] ([RandevuID], [HastaID], [DoktorID], [RandevuTarihi], [RandevuZamani], [Sebep], [RandevuDurum]) VALUES (20, 20, 10, CAST(N'2025-04-08 00:00:00.000' AS DateTime), CAST(N'10:00:00' AS Time), N'Diş Dolgusu', N'Planlanmış')
INSERT [dbo].[Randevular] ([RandevuID], [HastaID], [DoktorID], [RandevuTarihi], [RandevuZamani], [Sebep], [RandevuDurum]) VALUES (21, 21, 10, CAST(N'2025-04-09 00:00:00.000' AS DateTime), CAST(N'11:00:00' AS Time), N'Diş Çekimi', N'Planlanmış')
INSERT [dbo].[Randevular] ([RandevuID], [HastaID], [DoktorID], [RandevuTarihi], [RandevuZamani], [Sebep], [RandevuDurum]) VALUES (22, 22, 11, CAST(N'2025-04-10 00:00:00.000' AS DateTime), CAST(N'12:00:00' AS Time), N'Ortodontik Tedavi', N'Planlanmış')
INSERT [dbo].[Randevular] ([RandevuID], [HastaID], [DoktorID], [RandevuTarihi], [RandevuZamani], [Sebep], [RandevuDurum]) VALUES (23, 23, 11, CAST(N'2025-04-11 00:00:00.000' AS DateTime), CAST(N'13:00:00' AS Time), N'Diş Beyazlatma', N'Planlanmış')
INSERT [dbo].[Randevular] ([RandevuID], [HastaID], [DoktorID], [RandevuTarihi], [RandevuZamani], [Sebep], [RandevuDurum]) VALUES (24, 24, 12, CAST(N'2025-04-12 00:00:00.000' AS DateTime), CAST(N'14:00:00' AS Time), N'Ağız Cerrahisi', N'Planlanmış')
INSERT [dbo].[Randevular] ([RandevuID], [HastaID], [DoktorID], [RandevuTarihi], [RandevuZamani], [Sebep], [RandevuDurum]) VALUES (25, 25, 12, CAST(N'2025-04-13 00:00:00.000' AS DateTime), CAST(N'15:00:00' AS Time), N'Pedodontik Tedavi', N'Planlanmış')
INSERT [dbo].[Randevular] ([RandevuID], [HastaID], [DoktorID], [RandevuTarihi], [RandevuZamani], [Sebep], [RandevuDurum]) VALUES (26, 26, 13, CAST(N'2025-04-14 00:00:00.000' AS DateTime), CAST(N'16:00:00' AS Time), N'Diş Çekimi', N'Planlanmış')
INSERT [dbo].[Randevular] ([RandevuID], [HastaID], [DoktorID], [RandevuTarihi], [RandevuZamani], [Sebep], [RandevuDurum]) VALUES (27, 27, 13, CAST(N'2025-04-15 00:00:00.000' AS DateTime), CAST(N'17:00:00' AS Time), N'Diş Dolgusu', N'Planlanmış')
INSERT [dbo].[Randevular] ([RandevuID], [HastaID], [DoktorID], [RandevuTarihi], [RandevuZamani], [Sebep], [RandevuDurum]) VALUES (28, 28, 14, CAST(N'2025-04-16 00:00:00.000' AS DateTime), CAST(N'18:00:00' AS Time), N'Ortodontik Tedavi', N'Planlanmış')
INSERT [dbo].[Randevular] ([RandevuID], [HastaID], [DoktorID], [RandevuTarihi], [RandevuZamani], [Sebep], [RandevuDurum]) VALUES (29, 29, 14, CAST(N'2025-04-17 00:00:00.000' AS DateTime), CAST(N'09:00:00' AS Time), N'Ağız Cerrahisi', N'Planlanmış')
INSERT [dbo].[Randevular] ([RandevuID], [HastaID], [DoktorID], [RandevuTarihi], [RandevuZamani], [Sebep], [RandevuDurum]) VALUES (30, 30, 15, CAST(N'2025-04-18 00:00:00.000' AS DateTime), CAST(N'10:00:00' AS Time), N'Diş Beyazlatma', N'Planlanmış')
INSERT [dbo].[Randevular] ([RandevuID], [HastaID], [DoktorID], [RandevuTarihi], [RandevuZamani], [Sebep], [RandevuDurum]) VALUES (31, 31, 15, CAST(N'2025-04-19 00:00:00.000' AS DateTime), CAST(N'11:00:00' AS Time), N'Protez Tedavisi', N'Planlanmış')
INSERT [dbo].[Randevular] ([RandevuID], [HastaID], [DoktorID], [RandevuTarihi], [RandevuZamani], [Sebep], [RandevuDurum]) VALUES (32, 32, 16, CAST(N'2025-04-20 00:00:00.000' AS DateTime), CAST(N'12:00:00' AS Time), N'Diş Çekimi', N'Planlanmış')
INSERT [dbo].[Randevular] ([RandevuID], [HastaID], [DoktorID], [RandevuTarihi], [RandevuZamani], [Sebep], [RandevuDurum]) VALUES (33, 33, 16, CAST(N'2025-04-21 00:00:00.000' AS DateTime), CAST(N'13:00:00' AS Time), N'Ortodontik Tedavi', N'Planlanmış')
INSERT [dbo].[Randevular] ([RandevuID], [HastaID], [DoktorID], [RandevuTarihi], [RandevuZamani], [Sebep], [RandevuDurum]) VALUES (34, 34, 17, CAST(N'2025-04-22 00:00:00.000' AS DateTime), CAST(N'14:00:00' AS Time), N'Ağız Cerrahisi', N'Planlanmış')
INSERT [dbo].[Randevular] ([RandevuID], [HastaID], [DoktorID], [RandevuTarihi], [RandevuZamani], [Sebep], [RandevuDurum]) VALUES (35, 35, 17, CAST(N'2025-04-23 00:00:00.000' AS DateTime), CAST(N'15:00:00' AS Time), N'Diş Dolgusu', N'Planlanmış')
INSERT [dbo].[Randevular] ([RandevuID], [HastaID], [DoktorID], [RandevuTarihi], [RandevuZamani], [Sebep], [RandevuDurum]) VALUES (36, 36, 18, CAST(N'2025-04-24 00:00:00.000' AS DateTime), CAST(N'16:00:00' AS Time), N'Pedodontik Tedavi', N'Planlanmış')
INSERT [dbo].[Randevular] ([RandevuID], [HastaID], [DoktorID], [RandevuTarihi], [RandevuZamani], [Sebep], [RandevuDurum]) VALUES (37, 37, 18, CAST(N'2025-04-25 00:00:00.000' AS DateTime), CAST(N'17:00:00' AS Time), N'Diş Beyazlatma', N'Planlanmış')
INSERT [dbo].[Randevular] ([RandevuID], [HastaID], [DoktorID], [RandevuTarihi], [RandevuZamani], [Sebep], [RandevuDurum]) VALUES (38, 38, 19, CAST(N'2025-04-26 00:00:00.000' AS DateTime), CAST(N'18:00:00' AS Time), N'Ortodontik Tedavi', N'Planlanmış')
INSERT [dbo].[Randevular] ([RandevuID], [HastaID], [DoktorID], [RandevuTarihi], [RandevuZamani], [Sebep], [RandevuDurum]) VALUES (39, 39, 19, CAST(N'2025-04-27 00:00:00.000' AS DateTime), CAST(N'09:00:00' AS Time), N'Ağız Cerrahisi', N'Planlanmış')
INSERT [dbo].[Randevular] ([RandevuID], [HastaID], [DoktorID], [RandevuTarihi], [RandevuZamani], [Sebep], [RandevuDurum]) VALUES (40, 40, 20, CAST(N'2025-04-28 00:00:00.000' AS DateTime), CAST(N'10:00:00' AS Time), N'Diş Dolgusu', N'Planlanmış')
SET IDENTITY_INSERT [dbo].[Randevular] OFF
INSERT [dbo].[Recete] ([ReceteID], [HastaID], [DoktorID], [IlacAdi], [KullanimTalimatlari], [YazilmaTarihi]) VALUES (6, 6, 3, N'Antiseptik Gargara', N'Her yemek sonrası kullan.', CAST(N'2025-03-25 00:00:00.000' AS DateTime))
INSERT [dbo].[Recete] ([ReceteID], [HastaID], [DoktorID], [IlacAdi], [KullanimTalimatlari], [YazilmaTarihi]) VALUES (7, 7, 3, N'Florür Jel', N'Günde 2 kez uygulanır.', CAST(N'2025-03-26 00:00:00.000' AS DateTime))
INSERT [dbo].[Recete] ([ReceteID], [HastaID], [DoktorID], [IlacAdi], [KullanimTalimatlari], [YazilmaTarihi]) VALUES (8, 8, 4, N'Ağrı Kesici', N'Günde 1 kez alın.', CAST(N'2025-03-27 00:00:00.000' AS DateTime))
INSERT [dbo].[Recete] ([ReceteID], [HastaID], [DoktorID], [IlacAdi], [KullanimTalimatlari], [YazilmaTarihi]) VALUES (9, 9, 4, N'Antibiyotik', N'Sabah ve akşam tok karna.', CAST(N'2025-03-28 00:00:00.000' AS DateTime))
INSERT [dbo].[Recete] ([ReceteID], [HastaID], [DoktorID], [IlacAdi], [KullanimTalimatlari], [YazilmaTarihi]) VALUES (10, 10, 5, N'Diş Beyazlatıcı Jel', N'Günde 1 kez.', CAST(N'2025-03-29 00:00:00.000' AS DateTime))
INSERT [dbo].[Recete] ([ReceteID], [HastaID], [DoktorID], [IlacAdi], [KullanimTalimatlari], [YazilmaTarihi]) VALUES (11, 11, 5, N'Protez Bakım Solüsyonu', N'Haftada 3 kez.', CAST(N'2025-03-30 00:00:00.000' AS DateTime))
INSERT [dbo].[Recete] ([ReceteID], [HastaID], [DoktorID], [IlacAdi], [KullanimTalimatlari], [YazilmaTarihi]) VALUES (12, 12, 6, N'Ağrı Kesici', N'Günde 1 kez yemek öncesi.', CAST(N'2025-03-31 00:00:00.000' AS DateTime))
INSERT [dbo].[Recete] ([ReceteID], [HastaID], [DoktorID], [IlacAdi], [KullanimTalimatlari], [YazilmaTarihi]) VALUES (13, 13, 6, N'Florürlü Diş Macunu', N'Sabah ve akşam.', CAST(N'2025-04-01 00:00:00.000' AS DateTime))
INSERT [dbo].[Recete] ([ReceteID], [HastaID], [DoktorID], [IlacAdi], [KullanimTalimatlari], [YazilmaTarihi]) VALUES (14, 14, 7, N'Antibakteriyel Sprey', N'Günde 2 kez.', CAST(N'2025-04-02 00:00:00.000' AS DateTime))
INSERT [dbo].[Recete] ([ReceteID], [HastaID], [DoktorID], [IlacAdi], [KullanimTalimatlari], [YazilmaTarihi]) VALUES (15, 15, 7, N'Diş Eti Jeli', N'Günde 3 kez masajla uygulanır.', CAST(N'2025-04-03 00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Tedaviler] ON 

INSERT [dbo].[Tedaviler] ([TedaviID], [HastaID], [TedaviAdi], [BaslamaTarihi], [BitisTarihi], [TedaviUcreti]) VALUES (1, 1, N'Diş Çekimi', CAST(N'2025-03-20 09:00:00.000' AS DateTime), CAST(N'2025-03-20 10:00:00.000' AS DateTime), CAST(150.00 AS Decimal(10, 2)))
INSERT [dbo].[Tedaviler] ([TedaviID], [HastaID], [TedaviAdi], [BaslamaTarihi], [BitisTarihi], [TedaviUcreti]) VALUES (2, 2, N'Ortodontik Tedavi', CAST(N'2025-03-21 10:00:00.000' AS DateTime), CAST(N'2025-06-21 10:00:00.000' AS DateTime), CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[Tedaviler] ([TedaviID], [HastaID], [TedaviAdi], [BaslamaTarihi], [BitisTarihi], [TedaviUcreti]) VALUES (3, 3, N'Ağız Cerrahisi', CAST(N'2025-03-22 11:00:00.000' AS DateTime), CAST(N'2025-03-22 13:00:00.000' AS DateTime), CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[Tedaviler] ([TedaviID], [HastaID], [TedaviAdi], [BaslamaTarihi], [BitisTarihi], [TedaviUcreti]) VALUES (4, 4, N'Diş Dolgusu', CAST(N'2025-03-23 14:00:00.000' AS DateTime), CAST(N'2025-03-23 15:00:00.000' AS DateTime), CAST(300.00 AS Decimal(10, 2)))
INSERT [dbo].[Tedaviler] ([TedaviID], [HastaID], [TedaviAdi], [BaslamaTarihi], [BitisTarihi], [TedaviUcreti]) VALUES (5, 5, N'Diş Çekimi', CAST(N'2025-03-24 15:00:00.000' AS DateTime), CAST(N'2025-03-24 16:00:00.000' AS DateTime), CAST(150.00 AS Decimal(10, 2)))
INSERT [dbo].[Tedaviler] ([TedaviID], [HastaID], [TedaviAdi], [BaslamaTarihi], [BitisTarihi], [TedaviUcreti]) VALUES (6, 6, N'Pedodontik Tedavi', CAST(N'2025-03-25 16:00:00.000' AS DateTime), CAST(N'2025-03-25 17:00:00.000' AS DateTime), CAST(200.00 AS Decimal(10, 2)))
INSERT [dbo].[Tedaviler] ([TedaviID], [HastaID], [TedaviAdi], [BaslamaTarihi], [BitisTarihi], [TedaviUcreti]) VALUES (7, 7, N'Diş Beyazlatma', CAST(N'2025-03-26 17:00:00.000' AS DateTime), CAST(N'2025-03-26 18:00:00.000' AS DateTime), CAST(400.00 AS Decimal(10, 2)))
INSERT [dbo].[Tedaviler] ([TedaviID], [HastaID], [TedaviAdi], [BaslamaTarihi], [BitisTarihi], [TedaviUcreti]) VALUES (8, 8, N'Ortodontik Tedavi', CAST(N'2025-03-27 18:00:00.000' AS DateTime), CAST(N'2025-09-27 18:00:00.000' AS DateTime), CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[Tedaviler] ([TedaviID], [HastaID], [TedaviAdi], [BaslamaTarihi], [BitisTarihi], [TedaviUcreti]) VALUES (9, 9, N'Ağız Cerrahisi', CAST(N'2025-03-28 09:30:00.000' AS DateTime), CAST(N'2025-03-28 11:30:00.000' AS DateTime), CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[Tedaviler] ([TedaviID], [HastaID], [TedaviAdi], [BaslamaTarihi], [BitisTarihi], [TedaviUcreti]) VALUES (10, 10, N'Diş Dolgusu', CAST(N'2025-03-29 10:30:00.000' AS DateTime), CAST(N'2025-03-29 11:30:00.000' AS DateTime), CAST(300.00 AS Decimal(10, 2)))
INSERT [dbo].[Tedaviler] ([TedaviID], [HastaID], [TedaviAdi], [BaslamaTarihi], [BitisTarihi], [TedaviUcreti]) VALUES (11, 11, N'Protez Tedavisi', CAST(N'2025-03-30 12:00:00.000' AS DateTime), CAST(N'2025-03-30 13:00:00.000' AS DateTime), CAST(1000.00 AS Decimal(10, 2)))
INSERT [dbo].[Tedaviler] ([TedaviID], [HastaID], [TedaviAdi], [BaslamaTarihi], [BitisTarihi], [TedaviUcreti]) VALUES (12, 12, N'Diş Beyazlatma', CAST(N'2025-03-31 12:00:00.000' AS DateTime), CAST(N'2025-03-31 13:00:00.000' AS DateTime), CAST(400.00 AS Decimal(10, 2)))
INSERT [dbo].[Tedaviler] ([TedaviID], [HastaID], [TedaviAdi], [BaslamaTarihi], [BitisTarihi], [TedaviUcreti]) VALUES (13, 13, N'Ortodontik Tedavi', CAST(N'2025-04-01 13:00:00.000' AS DateTime), CAST(N'2025-07-01 13:00:00.000' AS DateTime), CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[Tedaviler] ([TedaviID], [HastaID], [TedaviAdi], [BaslamaTarihi], [BitisTarihi], [TedaviUcreti]) VALUES (14, 14, N'Ağız Cerrahisi', CAST(N'2025-04-02 14:00:00.000' AS DateTime), CAST(N'2025-04-02 16:00:00.000' AS DateTime), CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[Tedaviler] ([TedaviID], [HastaID], [TedaviAdi], [BaslamaTarihi], [BitisTarihi], [TedaviUcreti]) VALUES (15, 15, N'Diş Çekimi', CAST(N'2025-04-03 15:00:00.000' AS DateTime), CAST(N'2025-04-03 16:00:00.000' AS DateTime), CAST(150.00 AS Decimal(10, 2)))
INSERT [dbo].[Tedaviler] ([TedaviID], [HastaID], [TedaviAdi], [BaslamaTarihi], [BitisTarihi], [TedaviUcreti]) VALUES (16, 16, N'Pedodontik Tedavi', CAST(N'2025-04-04 16:00:00.000' AS DateTime), CAST(N'2025-04-04 17:00:00.000' AS DateTime), CAST(200.00 AS Decimal(10, 2)))
INSERT [dbo].[Tedaviler] ([TedaviID], [HastaID], [TedaviAdi], [BaslamaTarihi], [BitisTarihi], [TedaviUcreti]) VALUES (17, 17, N'Diş Beyazlatma', CAST(N'2025-04-05 17:00:00.000' AS DateTime), CAST(N'2025-04-05 18:00:00.000' AS DateTime), CAST(400.00 AS Decimal(10, 2)))
INSERT [dbo].[Tedaviler] ([TedaviID], [HastaID], [TedaviAdi], [BaslamaTarihi], [BitisTarihi], [TedaviUcreti]) VALUES (18, 18, N'Ortodontik Tedavi', CAST(N'2025-04-06 18:00:00.000' AS DateTime), CAST(N'2025-10-06 18:00:00.000' AS DateTime), CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[Tedaviler] ([TedaviID], [HastaID], [TedaviAdi], [BaslamaTarihi], [BitisTarihi], [TedaviUcreti]) VALUES (19, 19, N'Ağız Cerrahisi', CAST(N'2025-04-07 09:00:00.000' AS DateTime), CAST(N'2025-04-07 11:00:00.000' AS DateTime), CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[Tedaviler] ([TedaviID], [HastaID], [TedaviAdi], [BaslamaTarihi], [BitisTarihi], [TedaviUcreti]) VALUES (20, 20, N'Diş Dolgusu', CAST(N'2025-04-08 10:00:00.000' AS DateTime), CAST(N'2025-04-08 11:00:00.000' AS DateTime), CAST(300.00 AS Decimal(10, 2)))
INSERT [dbo].[Tedaviler] ([TedaviID], [HastaID], [TedaviAdi], [BaslamaTarihi], [BitisTarihi], [TedaviUcreti]) VALUES (21, 21, N'Diş Beyazlatma', CAST(N'2025-04-09 09:00:00.000' AS DateTime), CAST(N'2025-04-09 10:00:00.000' AS DateTime), CAST(400.00 AS Decimal(10, 2)))
INSERT [dbo].[Tedaviler] ([TedaviID], [HastaID], [TedaviAdi], [BaslamaTarihi], [BitisTarihi], [TedaviUcreti]) VALUES (22, 22, N'Ortodontik Tedavi', CAST(N'2025-04-10 10:00:00.000' AS DateTime), CAST(N'2025-07-10 10:00:00.000' AS DateTime), CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[Tedaviler] ([TedaviID], [HastaID], [TedaviAdi], [BaslamaTarihi], [BitisTarihi], [TedaviUcreti]) VALUES (23, 23, N'Ağız Cerrahisi', CAST(N'2025-04-11 11:00:00.000' AS DateTime), CAST(N'2025-04-11 13:00:00.000' AS DateTime), CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[Tedaviler] ([TedaviID], [HastaID], [TedaviAdi], [BaslamaTarihi], [BitisTarihi], [TedaviUcreti]) VALUES (24, 24, N'Diş Çekimi', CAST(N'2025-04-12 14:00:00.000' AS DateTime), CAST(N'2025-04-12 15:00:00.000' AS DateTime), CAST(150.00 AS Decimal(10, 2)))
INSERT [dbo].[Tedaviler] ([TedaviID], [HastaID], [TedaviAdi], [BaslamaTarihi], [BitisTarihi], [TedaviUcreti]) VALUES (25, 25, N'Diş Dolgusu', CAST(N'2025-04-13 15:00:00.000' AS DateTime), CAST(N'2025-04-13 16:00:00.000' AS DateTime), CAST(300.00 AS Decimal(10, 2)))
INSERT [dbo].[Tedaviler] ([TedaviID], [HastaID], [TedaviAdi], [BaslamaTarihi], [BitisTarihi], [TedaviUcreti]) VALUES (26, 26, N'Pedodontik Tedavi', CAST(N'2025-04-14 16:00:00.000' AS DateTime), CAST(N'2025-04-14 17:00:00.000' AS DateTime), CAST(200.00 AS Decimal(10, 2)))
INSERT [dbo].[Tedaviler] ([TedaviID], [HastaID], [TedaviAdi], [BaslamaTarihi], [BitisTarihi], [TedaviUcreti]) VALUES (27, 27, N'Diş Beyazlatma', CAST(N'2025-04-15 17:00:00.000' AS DateTime), CAST(N'2025-04-15 18:00:00.000' AS DateTime), CAST(400.00 AS Decimal(10, 2)))
INSERT [dbo].[Tedaviler] ([TedaviID], [HastaID], [TedaviAdi], [BaslamaTarihi], [BitisTarihi], [TedaviUcreti]) VALUES (28, 28, N'Ortodontik Tedavi', CAST(N'2025-04-16 18:00:00.000' AS DateTime), CAST(N'2025-08-16 18:00:00.000' AS DateTime), CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[Tedaviler] ([TedaviID], [HastaID], [TedaviAdi], [BaslamaTarihi], [BitisTarihi], [TedaviUcreti]) VALUES (29, 29, N'Ağız Cerrahisi', CAST(N'2025-04-17 09:00:00.000' AS DateTime), CAST(N'2025-04-17 11:00:00.000' AS DateTime), CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[Tedaviler] ([TedaviID], [HastaID], [TedaviAdi], [BaslamaTarihi], [BitisTarihi], [TedaviUcreti]) VALUES (30, 30, N'Diş Dolgusu', CAST(N'2025-04-18 10:00:00.000' AS DateTime), CAST(N'2025-04-18 11:00:00.000' AS DateTime), CAST(300.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[Tedaviler] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Kullanic__5BAE6A75B85898E8]    Script Date: 30.05.2025 19:47:56 ******/
ALTER TABLE [dbo].[Kullanici] ADD UNIQUE NONCLUSTERED 
(
	[KullaniciAdi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[LaboratuvarSonuc]  WITH CHECK ADD FOREIGN KEY([HastaID])
REFERENCES [dbo].[Hastalar] ([HastaID])
GO
ALTER TABLE [dbo].[Odeme]  WITH CHECK ADD FOREIGN KEY([HastaID])
REFERENCES [dbo].[Hastalar] ([HastaID])
GO
ALTER TABLE [dbo].[Randevular]  WITH CHECK ADD FOREIGN KEY([DoktorID])
REFERENCES [dbo].[Doktorlar] ([DoktorID])
GO
ALTER TABLE [dbo].[Randevular]  WITH CHECK ADD FOREIGN KEY([HastaID])
REFERENCES [dbo].[Hastalar] ([HastaID])
GO
ALTER TABLE [dbo].[Recete]  WITH CHECK ADD FOREIGN KEY([DoktorID])
REFERENCES [dbo].[Doktorlar] ([DoktorID])
GO
ALTER TABLE [dbo].[Recete]  WITH CHECK ADD FOREIGN KEY([HastaID])
REFERENCES [dbo].[Hastalar] ([HastaID])
GO
ALTER TABLE [dbo].[Tedaviler]  WITH CHECK ADD FOREIGN KEY([HastaID])
REFERENCES [dbo].[Hastalar] ([HastaID])
GO
USE [master]
GO
ALTER DATABASE [dissaglikmerkezi] SET  READ_WRITE 
GO
