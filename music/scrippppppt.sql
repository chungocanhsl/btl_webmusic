USE [master]
GO
/****** Object:  Database [MusicWeb]    Script Date: 3/30/2021 11:43:01 PM ******/
CREATE DATABASE [MusicWeb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MusicWeb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MusicWeb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MusicWeb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MusicWeb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [MusicWeb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MusicWeb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MusicWeb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MusicWeb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MusicWeb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MusicWeb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MusicWeb] SET ARITHABORT OFF 
GO
ALTER DATABASE [MusicWeb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MusicWeb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MusicWeb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MusicWeb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MusicWeb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MusicWeb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MusicWeb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MusicWeb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MusicWeb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MusicWeb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MusicWeb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MusicWeb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MusicWeb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MusicWeb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MusicWeb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MusicWeb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MusicWeb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MusicWeb] SET RECOVERY FULL 
GO
ALTER DATABASE [MusicWeb] SET  MULTI_USER 
GO
ALTER DATABASE [MusicWeb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MusicWeb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MusicWeb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MusicWeb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MusicWeb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MusicWeb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'MusicWeb', N'ON'
GO
ALTER DATABASE [MusicWeb] SET QUERY_STORE = OFF
GO
USE [MusicWeb]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMusic](
	[iDmusic] [int] IDENTITY(1,1) NOT NULL,
	[iDacc] [nvarchar](50) NOT NULL,
	[DisplayName] [nvarchar](50) NULL,
	[Image] [nvarchar](50) NULL,
	[Data] [nvarchar](max) NOT NULL,
	[Cotenttype] [nvarchar](max) NULL,
	[luotnghe] [int] NULL,
	[casi] [nvarchar](50) NULL,
	[idchude] [int] NULL,
 CONSTRAINT [PK_Music] PRIMARY KEY CLUSTERED 
(
	[iDmusic] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chude](
	[IDchude] [int] IDENTITY(1,1) NOT NULL,
	[theloai1] [nvarchar](50) NULL,
	[theloai2] [nvarchar](50) NULL,
	[theloai3] [nvarchar](50) NULL,
	[idacc] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[IDchude] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[xemnhac]
as
select tblMusic.iDmusic ,tblMusic.iDacc, tblMusic.DisplayName,tblMusic.Image,tblMusic.Data,
tblMusic.casi,tblMusic.Cotenttype,tblMusic.luotnghe ,chude.theloai1,chude.theloai2,chude.theloai3
from tblMusic,chude
where tblMusic.idchude=chude.IDchude 
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[nhacvpop]
as select tblMusic.iDmusic ,tblMusic.iDacc, tblMusic.DisplayName,tblMusic.Image,tblMusic.Data,
tblMusic.casi,tblMusic.Cotenttype,tblMusic.luotnghe ,chude.theloai1,chude.theloai2,chude.theloai3
from tblMusic,chude
where tblMusic.idchude=chude.IDchude  and  tblMusic.iDmusic>=45 and  tblMusic.iDmusic<=50
group by   tblMusic.iDmusic ,tblMusic.iDacc, tblMusic.DisplayName,tblMusic.Image,tblMusic.Data,
tblMusic.casi,tblMusic.Cotenttype,tblMusic.luotnghe ,chude.theloai1,chude.theloai2,chude.theloai3 
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[nhacmoi]
as select top 50 tblMusic.iDmusic ,tblMusic.iDacc, tblMusic.DisplayName,tblMusic.Image,tblMusic.Data,
tblMusic.casi,tblMusic.Cotenttype,tblMusic.luotnghe ,chude.theloai1,chude.theloai2,chude.theloai3
from tblMusic,chude
where tblMusic.idchude=chude.IDchude  
group by   tblMusic.iDmusic ,tblMusic.iDacc, tblMusic.DisplayName,tblMusic.Image,tblMusic.Data,
tblMusic.casi,tblMusic.Cotenttype,tblMusic.luotnghe ,chude.theloai1,chude.theloai2,chude.theloai3 
order by iDmusic DESC
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bxh](
	[idbxh] [int] IDENTITY(1,1) NOT NULL,
	[idnhac] [int] NULL,
	[sut] [int] NULL,
 CONSTRAINT [PK_bxh] PRIMARY KEY CLUSTERED 
(
	[idbxh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nhactt](
	[idtt] [int] IDENTITY(1,1) NOT NULL,
	[idnhac] [int] NULL,
	[tamtrang] [int] NULL,
 CONSTRAINT [PK_nhactt] PRIMARY KEY CLUSTERED 
(
	[idtt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAccount](
	[IDacount] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[email] [nvarchar](50) NULL,
	[gioitinh] [nvarchar](50) NULL,
	[imange] [nvarchar](max) NULL,
	[ngaysinh] [datetime] NULL,
 CONSTRAINT [PK_tblAccount] PRIMARY KEY CLUSTERED 
(
	[IDacount] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Theloai](
	[IDtheloai] [nvarchar](50) NOT NULL,
	[Tentheloai] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDtheloai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[bxh] ON 

INSERT [dbo].[bxh] ([idbxh], [idnhac], [sut]) VALUES (1, 40, 3)
INSERT [dbo].[bxh] ([idbxh], [idnhac], [sut]) VALUES (2, 72, 3)
INSERT [dbo].[bxh] ([idbxh], [idnhac], [sut]) VALUES (3, 73, 3)
INSERT [dbo].[bxh] ([idbxh], [idnhac], [sut]) VALUES (4, 41, 3)
INSERT [dbo].[bxh] ([idbxh], [idnhac], [sut]) VALUES (5, 42, 3)
INSERT [dbo].[bxh] ([idbxh], [idnhac], [sut]) VALUES (6, 43, 3)
INSERT [dbo].[bxh] ([idbxh], [idnhac], [sut]) VALUES (7, 44, 3)
INSERT [dbo].[bxh] ([idbxh], [idnhac], [sut]) VALUES (8, 45, 3)
INSERT [dbo].[bxh] ([idbxh], [idnhac], [sut]) VALUES (9, 46, 3)
INSERT [dbo].[bxh] ([idbxh], [idnhac], [sut]) VALUES (10, 47, 3)
INSERT [dbo].[bxh] ([idbxh], [idnhac], [sut]) VALUES (11, 48, 3)
INSERT [dbo].[bxh] ([idbxh], [idnhac], [sut]) VALUES (12, 49, 3)
INSERT [dbo].[bxh] ([idbxh], [idnhac], [sut]) VALUES (13, 50, 3)
INSERT [dbo].[bxh] ([idbxh], [idnhac], [sut]) VALUES (14, 51, 3)
INSERT [dbo].[bxh] ([idbxh], [idnhac], [sut]) VALUES (15, 40, 2)
INSERT [dbo].[bxh] ([idbxh], [idnhac], [sut]) VALUES (16, 52, 4)
INSERT [dbo].[bxh] ([idbxh], [idnhac], [sut]) VALUES (17, 53, 4)
INSERT [dbo].[bxh] ([idbxh], [idnhac], [sut]) VALUES (18, 54, 4)
INSERT [dbo].[bxh] ([idbxh], [idnhac], [sut]) VALUES (19, 55, 4)
INSERT [dbo].[bxh] ([idbxh], [idnhac], [sut]) VALUES (20, 56, 4)
INSERT [dbo].[bxh] ([idbxh], [idnhac], [sut]) VALUES (21, 57, 4)
INSERT [dbo].[bxh] ([idbxh], [idnhac], [sut]) VALUES (22, 58, 4)
INSERT [dbo].[bxh] ([idbxh], [idnhac], [sut]) VALUES (23, 59, 4)
INSERT [dbo].[bxh] ([idbxh], [idnhac], [sut]) VALUES (24, 60, 4)
INSERT [dbo].[bxh] ([idbxh], [idnhac], [sut]) VALUES (25, 61, 4)
INSERT [dbo].[bxh] ([idbxh], [idnhac], [sut]) VALUES (26, 62, 2)
INSERT [dbo].[bxh] ([idbxh], [idnhac], [sut]) VALUES (27, 62, 2)
INSERT [dbo].[bxh] ([idbxh], [idnhac], [sut]) VALUES (28, 63, 3)
SET IDENTITY_INSERT [dbo].[bxh] OFF
GO
SET IDENTITY_INSERT [dbo].[chude] ON 

INSERT [dbo].[chude] ([IDchude], [theloai1], [theloai2], [theloai3], [idacc]) VALUES (1, N'Nhạc Trịnh', N'Indie', N'Nhạc Hàn', N'admin')
INSERT [dbo].[chude] ([IDchude], [theloai1], [theloai2], [theloai3], [idacc]) VALUES (55, N'Jazz', N'Indie', N'Nhạc Âu Mỹ', N'thang')
INSERT [dbo].[chude] ([IDchude], [theloai1], [theloai2], [theloai3], [idacc]) VALUES (62, N'Indie', N'Nhạc Việt', N'R&B', N'thang')
INSERT [dbo].[chude] ([IDchude], [theloai1], [theloai2], [theloai3], [idacc]) VALUES (68, N'Rap', N'Nhạc Việt', N'', N'thang')
INSERT [dbo].[chude] ([IDchude], [theloai1], [theloai2], [theloai3], [idacc]) VALUES (69, N'Nhạc Phim', N'Nhạc Việt', N'', N'thang')
INSERT [dbo].[chude] ([IDchude], [theloai1], [theloai2], [theloai3], [idacc]) VALUES (70, N'Indie', N'Nhạc Việt', N'', N'thang')
INSERT [dbo].[chude] ([IDchude], [theloai1], [theloai2], [theloai3], [idacc]) VALUES (71, N'R&B', N'Nhạc Việt', N'', N'thang')
INSERT [dbo].[chude] ([IDchude], [theloai1], [theloai2], [theloai3], [idacc]) VALUES (72, N'Rap', N'Nhạc Hoa', N'Rap', N'thang')
INSERT [dbo].[chude] ([IDchude], [theloai1], [theloai2], [theloai3], [idacc]) VALUES (73, N'R&B', N'Nhạc Việt', N'', N'user1')
INSERT [dbo].[chude] ([IDchude], [theloai1], [theloai2], [theloai3], [idacc]) VALUES (74, N'Hip-Hop', N'Nhạc Việt', N'', N'user1')
INSERT [dbo].[chude] ([IDchude], [theloai1], [theloai2], [theloai3], [idacc]) VALUES (75, N'Rap', N'Nhạc Việt', N'', N'user1')
INSERT [dbo].[chude] ([IDchude], [theloai1], [theloai2], [theloai3], [idacc]) VALUES (76, N'Nhạc Âu Mỹ', N'Nhạc Phim', N'', N'user1')
INSERT [dbo].[chude] ([IDchude], [theloai1], [theloai2], [theloai3], [idacc]) VALUES (77, N'Rap', NULL, NULL, NULL)
INSERT [dbo].[chude] ([IDchude], [theloai1], [theloai2], [theloai3], [idacc]) VALUES (78, N'Nhạc Việt', N'R&B', N'Nhạc Phim', N'thang')
INSERT [dbo].[chude] ([IDchude], [theloai1], [theloai2], [theloai3], [idacc]) VALUES (79, N'Indie', N'Nhạc Hàn', N'', N'user33')
INSERT [dbo].[chude] ([IDchude], [theloai1], [theloai2], [theloai3], [idacc]) VALUES (80, N'Nhạc Việt', N'Indie', N'Nhạc Hàn', N'user1')
INSERT [dbo].[chude] ([IDchude], [theloai1], [theloai2], [theloai3], [idacc]) VALUES (81, N'Nhạc Việt', N'Indie', N'', N'user1')
INSERT [dbo].[chude] ([IDchude], [theloai1], [theloai2], [theloai3], [idacc]) VALUES (82, N'Nhạc Trịnh', N'Nhạc Hàn', N'', N'thang')
INSERT [dbo].[chude] ([IDchude], [theloai1], [theloai2], [theloai3], [idacc]) VALUES (83, N'Nhạc Việt', N'R&B', N'', N'admin')
INSERT [dbo].[chude] ([IDchude], [theloai1], [theloai2], [theloai3], [idacc]) VALUES (84, N'Rap', N'Nhạc Việt', N'', N'thang')
INSERT [dbo].[chude] ([IDchude], [theloai1], [theloai2], [theloai3], [idacc]) VALUES (88, N'Nhạc Trịnh', N'Rap', N'', N'admin')
INSERT [dbo].[chude] ([IDchude], [theloai1], [theloai2], [theloai3], [idacc]) VALUES (90, N'Nhạc Trịnh', N'Nhạc Việt', NULL, N'user2')
INSERT [dbo].[chude] ([IDchude], [theloai1], [theloai2], [theloai3], [idacc]) VALUES (91, N'Nhạc Trịnh', N' ', N' ', N'user2')
INSERT [dbo].[chude] ([IDchude], [theloai1], [theloai2], [theloai3], [idacc]) VALUES (92, N'Nhạc Âu Mỹ', N'EDM', N'', N'user2')
SET IDENTITY_INSERT [dbo].[chude] OFF
GO
SET IDENTITY_INSERT [dbo].[nhactt] ON 

INSERT [dbo].[nhactt] ([idtt], [idnhac], [tamtrang]) VALUES (1, 61, 1)
INSERT [dbo].[nhactt] ([idtt], [idnhac], [tamtrang]) VALUES (2, 62, 1)
INSERT [dbo].[nhactt] ([idtt], [idnhac], [tamtrang]) VALUES (3, 63, 1)
INSERT [dbo].[nhactt] ([idtt], [idnhac], [tamtrang]) VALUES (4, 64, 1)
INSERT [dbo].[nhactt] ([idtt], [idnhac], [tamtrang]) VALUES (5, 65, 1)
INSERT [dbo].[nhactt] ([idtt], [idnhac], [tamtrang]) VALUES (6, 66, 1)
INSERT [dbo].[nhactt] ([idtt], [idnhac], [tamtrang]) VALUES (7, 67, 2)
INSERT [dbo].[nhactt] ([idtt], [idnhac], [tamtrang]) VALUES (8, 68, 2)
INSERT [dbo].[nhactt] ([idtt], [idnhac], [tamtrang]) VALUES (9, 69, 2)
INSERT [dbo].[nhactt] ([idtt], [idnhac], [tamtrang]) VALUES (10, 70, 2)
SET IDENTITY_INSERT [dbo].[nhactt] OFF
GO
INSERT [dbo].[tblAccount] ([IDacount], [Password], [Name], [email], [gioitinh], [imange], [ngaysinh]) VALUES (N'admin', N'1', N'admin', N'huuthang.nguyen.986@gmail.com', N'Nam', NULL, CAST(N'1999-03-03T00:00:00.000' AS DateTime))
INSERT [dbo].[tblAccount] ([IDacount], [Password], [Name], [email], [gioitinh], [imange], [ngaysinh]) VALUES (N'thang', N'1', N'Thắng', N'huuthang.nguyen/986@gmial.com', N'Nam', NULL, CAST(N'1999-03-03T00:00:00.000' AS DateTime))
INSERT [dbo].[tblAccount] ([IDacount], [Password], [Name], [email], [gioitinh], [imange], [ngaysinh]) VALUES (N'user1', N'1', N'Nguyễn Văn A', N'huuthang.nguyen.986@gmail.com', N'Nữ', NULL, CAST(N'1999-03-03T00:00:00.000' AS DateTime))
INSERT [dbo].[tblAccount] ([IDacount], [Password], [Name], [email], [gioitinh], [imange], [ngaysinh]) VALUES (N'user2', N'1', N'Thắng', N'huuthang.nguyen.986@gmail.com', N'Nam', NULL, CAST(N'1999-02-02T00:00:00.000' AS DateTime))
INSERT [dbo].[tblAccount] ([IDacount], [Password], [Name], [email], [gioitinh], [imange], [ngaysinh]) VALUES (N'user33', N'1', N'1', N'2', N'Nam', NULL, CAST(N'1999-03-03T00:00:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[tblMusic] ON 

INSERT [dbo].[tblMusic] ([iDmusic], [iDacc], [DisplayName], [Image], [Data], [Cotenttype], [luotnghe], [casi], [idchude]) VALUES (40, N'admin', N'Em Say Rồi', N'/image/emsairoi.jpg', N'music/EmSaiRoi-Thuongvo,ACV.mp3', N'Em say… Anh có thể đến đây không?
Có thể để em ôm', 0, N'Thương Võ', 1)
INSERT [dbo].[tblMusic] ([iDmusic], [iDacc], [DisplayName], [Image], [Data], [Cotenttype], [luotnghe], [casi], [idchude]) VALUES (41, N'thang', N'Hết Thời', N'/image/8246ddb97803da19aaa7cb5039e26671.jpg', N'music/Het Thoi - Ngot.mp3', N' Content', 0, N'Ngọt ', 62)
INSERT [dbo].[tblMusic] ([iDmusic], [iDacc], [DisplayName], [Image], [Data], [Cotenttype], [luotnghe], [casi], [idchude]) VALUES (43, N'thang', N'Đưa nhau đi trốn', N'/image/duanhauditron.jpg', N'music/Duanhauditron.mp3', N'Bố em hút rất nhiều thuốc
Mẹ em khóc mắt lệ nhoà
Bố anh thì đi lại còn mẹ anh gọi điện thoại đến từng nhà
Nhiều ngày rồi mình không về, không liên lạc được gì cả
Chỉ vỏn vẹn mảnh giấy "đừng lo, đêm nay con đi chơi xa"
Em ơi đi trốn với anh
Mình đi đến nơi có biển bạc núi xanh
Chạy con xe anh chở em tròng trành
Mình phóng tầm mắt ngắm chân trời mới toanh
Mình ngủ một giấc mà không cần báo thức
Giờ này mọi khi anh đang trong ca trực
Em thì đang lo ngày mai giảng đường
Ôi những thứ chán chường không tẹo nào háo hức
Mình rời thành phố chật chội náo nức
Nơi mà cả việc thở cũng làm ta lao lực
Mơ những con đường xa làm anh thấy rạo rực
Muốn đưa em đi trốn đến tận cùng trái đất
Anh chẳng cần biết là ngày nắng đẹp rạng ngời
Hay gió về, hay bão táp mưa rơi
Ngày mình đi với nhau ấy là ngày đẹp trời
Thì theo anh đi trốn em ơi

[Chorus: Linh Cáo]
Thật lòng em mơ, mơ cùng anh đi đến tận cùng
Tận cùng chân mây vượt núi cao hay biển sâu
Biết mấy là yêu cho vừa
Giết mấy thời gian cho vừa
Khi yêu ta mơ về nhau
Để thấy lắm lúc lòng mình nhẹ nhiều khi
Muốn ném hết tất cả để mà đi
Một lần mình sống như những đứa nhóc không nhà
Sớm thức dậy ở một nơi xa', 0, N'Đen Vâu', 68)
INSERT [dbo].[tblMusic] ([iDmusic], [iDacc], [DisplayName], [Image], [Data], [Cotenttype], [luotnghe], [casi], [idchude]) VALUES (45, N'thang', N'Ánh nắng của anh', N'/image/anhnag.png', N'music/AnhNangCuaAnhChoEmDenNgayMaiOst-DucPhuc-4701036.mp3', N'Bài hát: Ánh Nắng Của Anh (Chờ Em Đến Ngày Mai OST) - Nguyễn Đức Phúc
Từ bao lâu nay anh cứ mãi cô đơn bơ vơ
Bao lâu rồi ai đâu hay
Ngày cứ thế trôi qua miên man
Riêng anh một mình nơi đây
Những phút giây trôi qua tầm tay
Chờ một ai đó đến bên anh
Lặng nghe những tâm tư này
Là tia nắng ấm
Là em đến bên anh
Cho vơi đi ưu phiền ngày hôm qua
Nhẹ nhàng xóa đi bao mây đen vây quanh cuộc đời nơi anh
Phút giây anh mong đến tình yêu ấy
Giờ đây là em người anh mơ ước bao đêm
[ĐK]
Sẽ luôn thật gần bên em
Sẽ luôn là vòng tay ấm êm
Sẽ luôn là người yêu em
Cùng em đi đến chân trời
Lắng nghe từng nhịp tim anh
Lắng nghe từng lời anh muốn nói
Vì em luôn đẹp nhất khi em cười
Vì em luôn là tia nắng trong anh
Không xa rời.
Bình minh dẫn lối
Ngày sau có em luôn bên anh trên con đường ta chung lối
Niềm hạnh phúc như trong cơn mơ
Chưa bao giờ anh nghĩ tới
Phút giây ta trao nhau tình yêu ấy
Giờ đây là em
Người anh sẽ mãi không quên', 0, N'Đức Phúc', 69)
INSERT [dbo].[tblMusic] ([iDmusic], [iDacc], [DisplayName], [Image], [Data], [Cotenttype], [luotnghe], [casi], [idchude]) VALUES (46, N'thang', N'Nàng Thơ', N'/image/nagtho.jpg', N'music/NangTho-HoangDung-6413381.mp3', N'Lời Bài Hát:
Em, ngày em đánh rơi nụ cười vào anh
Có nghĩ sau này em sẽ chờ
Và vô tư cho đi hết những ngây thơ
Anh, một người hát mãi những điều mong manh
Lang thang tìm niềm vui đã lỡ
Chẳng buồn dặn lòng quên hết những chơ vơ
Ta yêu nhau bằng nỗi nhớ chưa khô trên những bức thư
Ta đâu bao giờ có lỗi khi không nghe tim chối từ
Chỉ tiếc rằng
Em không là nàng thơ
Anh cũng không còn là nhạc sĩ mộng mơ
Tình này nhẹ như gió
Lại trĩu lên tim ta những vết hằn
Tiếng yêu này mỏng manh
Giờ tan vỡ, thôi cũng đành
Xếp riêng những ngày tháng hồn nhiên
Trả lại...
Mai, rồi em sẽ quên ngày mình khờ dại
Mong em kỷ niệm này cất lại
Mong em ngày buồn thôi ướt đẫm trên vai
Mai, ngày em sải bước bên đời thênh thang
Chỉ cần một điều em hãy nhớ
Có một người từng yêu em tha thiết vô bờ
Em không là nàng thơ
Anh cũng không còn là nhạc sĩ mộng mơ
Tình này nhẹ như gió
Lại trĩu lên tim ta những vết hằn
Tiếng yêu này mỏng manh
Giờ tan vỡ, thôi cũng đành
Xếp riêng những ngày tháng hồn nhiên
Trả hết cho em', 0, N'Hoàng Dũng', 69)
INSERT [dbo].[tblMusic] ([iDmusic], [iDacc], [DisplayName], [Image], [Data], [Cotenttype], [luotnghe], [casi], [idchude]) VALUES (47, N'thang', N'Có Em Chờ', N'/image/coemcho.jpg', N'music/CoEmChoOrchestraVersion-MIN-5130422.mp3', N'Lời Bài Hát:
Bài hát: Có Em Chờ (Orchestra Version) - MIN
Từ lần đầu tiên ta đi bên nhau
Em đã biết tim mình đánh rơi rồi
Từ lần đầu tiên môi hôn trao nhau
Em đã biết không thể yêu thêm ai.
Cách anh cười cong môi, cách anh lặng lẽ ngồi
Ngồi nhìn bóng tối lặng thầm thời gian trôi.
Người đàn ông em yêu đôi khi
Có những phút giây yếu đuối không ngờ
Ngoài kia nếu có khó khăn quá về nhà anh nhé
Có em chờ!
Có môi mềm thơm thơm, có dư vị mỗi bữa cơm
Xuân hạ thu đông đều có em chờ.
[Rap:]
Yoo, có định mệnh nào bao nhiêu lâu anh đã ao ước
Có vần thơ nào bao nhiêu đêm anh đi tìm hoài
Và nếu khoảng cách là một nghìn bước
Thì em chỉ cần bước một bước
Anh sẽ bước chín trăm chín mươi chín bước còn lại.
Bước về phía em
Nơi mà em thấy nắng mai
Nơi con tim anh biết yên bình
Và mong thế thôi.
[ĐK:]
Tình yêu là những ánh sáng lấp lánh
Đèn vàng thắp lên bên ô cửa nhỏ
Tình yêu là những dịu êm từng đêm
Mình cùng ăn tối và nghe mưa rơi.
Biết sẽ có những lúc trái tim đau đớn khôn nguôi
Vẫn yêu và yêu và yêu thế thôi.
[Rap:]
Và lần đầu tiên con tim như rụng rời
Lần đầu tiên anh không nói nên lời
Giấc mơ nào có đâu xa
Tình yêu đâu có hai ta
Nơi tóc em quá mượt mà
Con phố xưa đón đưa và
Em sẽ yêu mãi anh tháng năm dài.
Bao nhiêu tháng ngày tăm tối
Khi mà có em ngày qua
Nỗi buồn cũng phải buông trôi
Khi giờ ta có em và
Một ngàn khúc ca quanh ta
Xin em đừng giận anh nha
Bởi vì đôi khi anh là.', 0, N'Min', 69)
INSERT [dbo].[tblMusic] ([iDmusic], [iDacc], [DisplayName], [Image], [Data], [Cotenttype], [luotnghe], [casi], [idchude]) VALUES (48, N'thang', N'Gác lại âu lo ', N'/image/gaclo.jpg', N'music/GacLaiAuLo-DaLABMiuLe-6360815.mp3', N'Lời Bài Hát:
Anh đi lạc trong sóng gió cuộc đời
Nào biết đâu sớm mai liệu bình yên có tới?
Âu lo chạy theo những ánh sao đêm
Ngày cứ trôi chớp mắt thành phố đã sáng đèn
Ta cứ lặng lẽ chạy thật mau, yêu thương chẳng nói kịp thành câu...
Biết đâu liệu mai còn thấy nhau?
Thức giấc để anh còn được thấy ánh mắt của em nhẹ nhìn anh, đôi tay này sẽ không xa rời
Tạm gác hết những âu lo lại, cùng anh bước trên con đường
Ta sẽ không quay đầu để rồi phải tiếc nuối những chuyện cũ đã qua
Giữ trái tim luôn yên bình và quên hết những ưu phiền vấn vương
Cuộc đời này được bao lần nói yêu
Anh biết nơi để quay về, em biết nơi phải đi
Anh biết chỗ trú chân dọc đường để tránh cơn mưa hạ đến mỗi chiều
Ta biết trao nhau ân cần, biết mỗi khi vui buồn có nhau
Thời gian để ta trưởng thành với nhau
Nhảy với anh đến khi đôi chân rã rời
Hát anh nghe những câu ca từ ngày xưa cũ
Thì thầm khẽ anh nghe em vẫn còn bao niềm mơ
Ôm lấy anh nghe mưa đầu mùa ghé chơi
Một giây không thấy nhau như một đời cô đơn quá
Trời mù mây bỗng nhiên ngát xanh khi em khẽ cười
Một ngày anh biết hết nguyên do của những yên vui trong đời
Ngày mà duyên kiếp kia đưa ta gần lại với nhau
Tạm Gác hết những âu lo lại, cùng anh bước trên con đường
Ta sẽ không quay đầu để rồi phải tiếc nuối những chuyện cũ đã qua
Giữ trái tim luôn yên bình và quên hết những ưu phiền vấn vương
Cuộc đời này được bao lần nói yêu
Anh biết nơi để quay về, em biết nơi phải đi
Anh biết chỗ trú chân dọc đường để tránh cơn mưa hạ đến mỗi chiều
Ta biết trao nhau ân cần, biết mỗi khi vui buồn có nhau
Thời gian để ta trưởng thành với nhau
Bờ vai anh rộng đủ để che chở cho emmmmm
Was a boy now a man cho emmm
Từng đi lạc ở trong thế giới điên zồ ngoài kia
Và tình yêu em trao anh ngày ấy đã mang anh về bên emmmm
Yêu em như a Fat kid loves cake
Nhắm mắt cảm nhận tình yêu tan dịu ngọt trên môi khi em hôn môi anh đây, yo
Không phải happy ending, mỗi bình minh ta viết thêm trang mới, nối dài câu chuyện mình
Như trong mơ nơi xa kia xanh biếc xanh biếc
Thiên đàng bên em nơi đây anh biết anh biết
Bóng đêm đã qua yên bình có thêm chúng ta nghe lòng đàn từng câu ca
Cuộc đời này chẳng hề hối tiếc
Những tháng năm ta đi cùng nhau
Anh biết em luôn ở đó nơi anh thuộc về
Tạm Gác hết những âu lo lại, cùng anh bước trên con đường
Ta sẽ không quay đầu để rồi phải tiếc nuối những chuyện cũ đã qua
Giữ trái tim luôn yên bình và quên hết những ưu phiền vấn vương
Cuộc đời này được bao lần nói yêu
Anh biết nơi để quay về, em biết nơi phải đi
Anh biết chỗ trú chân dọc đường để tránh cơn mưa hạ đến mỗi chiều
Ta biết trao nhau ân cần, biết mỗi khi vui buồn có nhau
Thời gian để ta trưởng thành với nhau

', 0, N'Da LAB,Miu Lê', 68)
INSERT [dbo].[tblMusic] ([iDmusic], [iDacc], [DisplayName], [Image], [Data], [Cotenttype], [luotnghe], [casi], [idchude]) VALUES (49, N'thang', N'Hoa Nở Không Màu', N'/image/maxresdefault.jpg', N'music/HoaNoKhongMau1-HoaiLam-6281704.mp3', N'Chỉ là nỗi nhớ mãi đứng sau cuộc tình đã lỡ
Chỉ là cơn mơ cuốn theo cả một trời thương nhớ
Chỉ là nỗi đau thổn thức, chỉ là nhói thêm một chút
Chỉ là nước mắt cứ rưng rưng
Tìm về kí ức cố xoá đi đoạn tình ban sơ
Rồi lại chơ vơ đứng giữa nơi đại lộ tan vỡ
Mãi chìm đắm trong lầm lỡ
Trái tim vẫn không ngừng nhớ
Đợi chờ em đến hoá ngu ngơ
Tình yêu đã phai mờ như hoa nở không màu
Càng níu kéo nhưng lại càng xa cách nhau
Đành ôm nỗi đau này chết lặng giữa trời mây
Hằn lại sâu trong trái tim hao gầy
Giờ đây chúng ta là hai người dưng khác lạ
Buồn biết mấy nhưng lại chẳng thể nói ra
Cuộc đời lắm vô thường, sao cứ mãi vấn vương
Tự mình ôm lấy tổn thương riêng mình !
Chỉ là anh cố chấp luôn âm thầm
Bước về phía nắng ấm tìm em
Thế mà cơn mưa đêm xoá hết kỷ niệm
Chỉ còn lại xác xơ nỗi nhớ !', 0, N'Hoài Lâm', 70)
INSERT [dbo].[tblMusic] ([iDmusic], [iDacc], [DisplayName], [Image], [Data], [Cotenttype], [luotnghe], [casi], [idchude]) VALUES (50, N'thang', N'Túy Âm', N'/image/maxresdefault (1).jpg', N'music/TuyAm-XesiMasewNhatNguyen-5132651.mp3', N'Bài hát: Túy Âm - Xesi, Masew, Nhật Nguyễn
Rót đến tràn ly, anh chìm đắm trong men cay đắng nồng
Khóc chát làn mi, uống cùng anh cho đêm nay say chất ngất !
Dẫu năm tháng ấy còn đâu những đam mê ta kiếm tìm?
Màu mắt xanh ngời lạc giữa mây ngàn về chốn xa xôi
Hãy say cùng anh, hãy hát cùng anh, hãy khóc cùng anh
Thêm 1 lần...
Để anh được gần trái tim của em dù trong phút giây
Hình bóng người tan biến dần phía sau những nỗi sầu
Với em chắc quá đủ cho một mối tình
Dẫu em không thể ở lại với anh
Mình chẳng cùng với nhau đi hết quãng đường, ôm ấp hi vọng một ngày ngát xanh
Tháng năm thăng trầm dòng đời ngả nghiêng
Mình tự rời bỏ nhau, say đến điên dại, say hết kiếp người, say cho cháy lòng

', 0, N'Xesi - Nhật Nguyễn', 71)
INSERT [dbo].[tblMusic] ([iDmusic], [iDacc], [DisplayName], [Image], [Data], [Cotenttype], [luotnghe], [casi], [idchude]) VALUES (51, N'thang', N'Sóng Gió', N'/image/maxresdefault (2).jpg', N'music/SongGioDJXuanNuiRemix-DJXuanNuiKICMJackG5R-6035315.mp3', N'Lời Bài Hát:
Hồng trần trên đôi cánh tay
Họa đời em trong phút giây
Từ ngày thơ ấy còn ngủ mơ
Đến khi em thờ ơ ờ
Lòng người anh đâu có hay
Một ngày khi vỗ cánh bay
Từ người yêu hóa thành người dưng
Đến khi ta tự xưng à
Thương em bờ vai nhỏ nhoi
Đôi mắt hóa mây đêm
Thương sao mùi dạ lý hương
Vương vấn mãi bên thềm
Đời phiêu du cố tìm một người thật lòng
Dẫu trời mênh mong anh nhớ em
Chim kia về vẫn có đôi
Sao chẳng số phu thê
Em ơi đừng xa cách tôi
Trăng cố níu em về
Bình yên trên mái nhà
Nhìn đời ngược dòng
Em còn bên anh có phải không?
Trời ban ánh sáng, năm tháng tư bề
Dáng ai về chung lối
Người mang tia nắng
Nhưng cớ sao còn tăm tối
Một mai em lỡ vấp ngã trên đời thay đổi
Nhìn về anh, người chẳng khiến em lẻ loi
Oh! Nếu em có về
Anh sẽ mang hết những suy tư
Mang hết hành trang
Những ngày sống khổ
Để cho gió biển di cư
Anh thà lênh đênh không có ngày về
Hóa kiếp thân trai như Thủy Hử
Chẳng đành để em từ một cô bé
Sóng gió vây quanh thành quỷ dữ
Ta tự đẩy mình hay tự ta trói
Bây giờ có khác gì đâu
Ta chả bận lòng hay chẳng thể nói
Tụi mình có khác gì nhau
Yêu sao cánh điệp phủ mờ nét bút
Dẫu người chẳng hẹn đến về sau
Phố thị đèn màu ta chỉ cần chung lối
Để rồi sống chết cũng vì nhau
Nhặt một nhành hoa rơi
Đoạn đường về nhà thật buồn em ơi
Dòng người vội vàng giờ này
Tình ơi tình ơi tình ơi em ở đâu rồi
Lặng nhìn bờ vai xưa
Tựa đầu mình hỏi rằng khổ chưa
Đành lòng chặn đường giờ
Đừng đi đừng đi đừng đi vì câu hứa', 0, N'Jack - KICM', 68)
INSERT [dbo].[tblMusic] ([iDmusic], [iDacc], [DisplayName], [Image], [Data], [Cotenttype], [luotnghe], [casi], [idchude]) VALUES (54, N'user1', N'Níu Duyên', N'/image/1607418107798.jpg', N'music/NiuDuyen-LeBaoBinh-6872127.mp3', N'Nội Dung là Nội dung
Nội Dung là Nội dung
Nội Du', 0, N'Lê Bảo Bình', 73)
INSERT [dbo].[tblMusic] ([iDmusic], [iDacc], [DisplayName], [Image], [Data], [Cotenttype], [luotnghe], [casi], [idchude]) VALUES (55, N'user1', N'Đi Đu Đưa Đi', N'/image/1566988500226.jpg', N'music/DiDuDuaDi-BichPhuong-6059493.mp3', N'Tựa như chiếc cưa tay mài sắc
Anh lướt qua trong khoảnh khắc
Nhưng đủ lâu để anh khiến em nhớ mặt
Thường con gái đâu yêu bằng mắt
Sao bỗng nhiên tim lại lắc
Vô tình rơi giày không biết anh có nhặt
Hình như em thích anh, thích thật rồi
Mà yêu thì chắc em thấy chưa đâu
Một người con gái mà kiêu ngạo thì rất là khó để yêu
Phải rủ đi chơi tối nay rồi
Gặp lại để xem có còn thích hay thôi rồi
Rộn ràng thợ săn nhắm con mồi
Bọn mình đi đâu đi anh ơi đi đu đưa đi
Lúc đi hết mình lúc về hết buồn x2
Đu đưa không phải là hư
Đu đưa để lắc lư cho hết buồn
Bây giờ không phải ngày xưa
Em sao phải ngại đu đưa với chàng
Rộn ràng như tuổi cập kê
Chàng rơi một nhịp để em bắt nào
Cây si cần tia nắng vào
Chàng si tình lại bảo cần tia em', 0, N'Bích Phương', 73)
INSERT [dbo].[tblMusic] ([iDmusic], [iDacc], [DisplayName], [Image], [Data], [Cotenttype], [luotnghe], [casi], [idchude]) VALUES (56, N'user1', N'Bùa Yêu', N'/image/c9ac2a925af0491756d57fe41c6f9460.jpg', N'music/BuaYeu-BichPhuong-5472208.mp3', N'Bài hát: Bùa Yêu - Bích Phương
Lâu nay em luôn một mình
Lâu không quan tâm đến người nào
Nhưng tim em đang ồn ào
Khi anh quay sang nói lời chào
Hẹn hò ngay với em đi, đâu có mấy khi
Sao không yêu nhau bây giờ, yêu luôn đi
Tin không em đang thật lòng
Em nghe đây anh nói đi anh
Yêu hay không yêu không yêu hay yêu nói một lời
Bên nhau hay thôi, chỉ một lời uh huh uh uh uh
Không yêu yêu hay không yêu không yêu hay yêu nói một lời thôi
Nếu anh có yêu nói đi ngại gì?
Huh uh huh, huh uh huh
Huh uh huh uh huh uh huh uh
Nếu anh có yêu nói đi ngại gì?
Huh uh huh, huh uh huh
Huh uh huh uh huh uh huh uh
Nếu anh có yêu nói đi ngại gì?
Em luôn vui, em hiền lành
Không hay đi chơi, nấu ăn ngon
Em may, em thêu thùa này
Yêu thương ai yêu hết lòng này
Chỉ là anh đấy thôi anh
Duy nhất riêng anh
Xưa nay bên em bao người vây xung quanh
Tin không em đang thật lòng
Em nghe đây anh nói đi anh
Yêu hay không yêu không yêu hay yêu nói một lời
Bên nhau hay thôi, chỉ một lời uh huh uh uh uh
Không yêu yêu hay không yêu không yêu hay yêu nói một lời thôi
Nếu anh có yêu nói đi ngại gì?
Huh uh huh, huh uh huh
Huh uh huh uh huh uh huh uh
Nếu anh có yêu nói đi ngại gì?
Huh uh huh, huh uh huh
Huh uh huh uh huh uh huh uh
Nếu anh có yêu nói đi ngại gì?
Huh uh huh, huh uh huh
Huh uh huh uh huh uh huh uh
Nếu anh có yêu nói đi ngại gì?
Huh uh huh, huh uh huh
Huh uh huh uh huh uh huh uh
Nếu anh có yêu nói đi ngại gì?
Hỡi anh có hay biết rằng
Thời gian cứ thế trôi nào có chờ
Chúng ta thì cần người ở bên
Sẻ chia những phút giây trong đời
(Yêu hay không yêu không yêu hay yêu nói một lời
Không yêu yêu hay không yêu không yêu hay yêu nói một lời thôi)
Nếu anh có yêu nói đi ngại gì?
Huh uh huh, huh uh huh
Huh uh huh uh huh uh huh uh
Nếu anh có yêu nói đi ngại gì?
Huh uh huh, huh uh huh
Huh uh huh uh huh uh huh uh
Nếu anh có yêu nói đi ngại gì?', 0, N'Bích Phương', 73)
INSERT [dbo].[tblMusic] ([iDmusic], [iDacc], [DisplayName], [Image], [Data], [Cotenttype], [luotnghe], [casi], [idchude]) VALUES (57, N'user1', N'Nụ Hồng Mong Manh', N'/image/maxresdefault (3).jpg', N'music/NuHongMongManh-BichPhuong-3495288.mp3', N'Anh đem trao cho em nụ hồng,
nụ hồng mong manh như sương mai trong gió..
Em nâng niu đem hoa về giữ trong hồn,
mong sao hoa không phai sắc hương

Nhưng bông hoa kia mau phai tàn,
rụng tả tơi trên đôi tay em băng giá..
Em nghe như trong tim rạng vỡ
nỗi đau làm nhạt nhòa một trời sương khói.

Anh như chim bay quên đường về
âm thầm mình em.. nơi đây với những bâng khuâng
Cánh chim ơi! còn mịt mù tận trời nào
vui chi nơi xa xôi ấy
Anh quên em như quên cánh hoa.

Nhưng sao nay anh quay trở về,
ta còn gì đâu hoa xưa đã héo trong tim
Mối duyên xưa dù này chỉ là mộng thôi,
em nay như trăng đã uá,
thôi anh ơi duyên ta đành lỡ....

Nhưng bông hoa kia mau phai tàn,
rụng tả tơi trên đôi tay em băng giá..
Em nghe như trong tim rạng vỡ
nỗi đau làm nhạt nhòa một trời sương khói.', 0, N'Bích Phương', 73)
INSERT [dbo].[tblMusic] ([iDmusic], [iDacc], [DisplayName], [Image], [Data], [Cotenttype], [luotnghe], [casi], [idchude]) VALUES (58, N'user1', N'Cớ Sao Giờ Lại Chia Xa', N'/image/1499324135315_640.jpg', N'music/CoSaoGioLaiChiaXa-BichPhuong-5079070.mp3', N'[Verse]
Lần mà người bối rối nói rằng yêu em thôi
Cũng là lần đầu, mà em thấy mình nhỏ bé..
Lần mà người đã đứng chờ em dưới cơn mưa đêm
Làm tim em rung lên, tưởng rằng anh sẽ mãi yêu em

[Chorus]
Mình đã hứa bên nhau cơ mà,
Cớ sao giờ lại chia xa?
Có hay rằng trong đời em, khoảnh khắc tuổi xuân đẹp nhất là ngày bên anh?
Người là cánh chim bay ngang trời
Để em nơi đây cứ mãi
Ngước lên trời cao thật cao ước được là gió.

[Verse 2]
Ôi bao nhiêu kí ức quãng thời gian đôi ta
Chắc em sẽ chọn, điều đẹp nhất để sau này nhớ.
Điều gì đẹp hơn đây, ngoài những ước mơ năm xưa
Hồn nhiên và dại khờ, dù vậy em vẫn muốn tin anh lần nữa.

[Chorus]
Mình đã hứa bên nhau cơ mà
Cớ sao giờ lại chia xa
Có hay rằng trong đời em, khoảnh khắc tuổi xuân đẹp nhất là ngày bên anh
Người là cánh chim bay ngang trời
Để em nơi đây cứ mãi
Ngước lên trời cao thật cao ước được là gió

[Bridge]
Anh giờ nơi xa đó, có khi nào trong một phút giây bỗng nhiên nhớ về ngày mà
ta bên nhau?', 0, N'Bích Phương', 73)
INSERT [dbo].[tblMusic] ([iDmusic], [iDacc], [DisplayName], [Image], [Data], [Cotenttype], [luotnghe], [casi], [idchude]) VALUES (59, N'user1', N'Gửi Anh Xa Nhớ', N'/image/tải xuống.jpg', N'music/GuiAnhXaNho-BichPhuong-4539289.mp3', N'Anh xa nhớ anh có khỏe không
Em lâu lắm không viết thư tay
Đầu thư em chẳng biết nói gì
Ngoài câu em ở đây nhớ anh vơi đầy
Anh hãy cứ yên tâm công tác
Em da diết thủy chung một lòng
Ngày em nghĩ về anh thật nhiều
Để đêm đêm nằm mơ về anh

Chorus:
Anh đi hoài đường xa
Em vẫn chờ nơi ấy
Em yêu lắm đấy
Em thương lắm đấy
Em lo cho a nhiều đấy
Mong đến ngày gặp nhau
Dẫu cách trở bao lâu
Mua bao thuốc lá, mua *** gói bánh
Anh sang thưa chuyện cùng em nghe anh', 0, N'Bích Phương', 73)
INSERT [dbo].[tblMusic] ([iDmusic], [iDacc], [DisplayName], [Image], [Data], [Cotenttype], [luotnghe], [casi], [idchude]) VALUES (60, N'user1', N'Có Khi Nào Rời Xa', N'/image/tải x22uống.jpg', N'music/CoKhiNaoRoiXa-NukanTranTungAnh-2456751.mp3', N'Biết đâu bất ngờ đôi ta chợt rời xa nhau
Ai còn đứng dưới mưa ngân nga câu ru tình
Và môi hôn rất ướt, dư âm giấu trong mưa
Cơn mưa kéo dài.
Sẽ là dối lòng khi anh chẳng ngại âu lo
Lo anh sẽ mất em trong lúc yêu thương nhất
Vì tình yêu mong manh, tay anh quá yếu mềm
Người yêu ơi, em có biết?
[ĐK]:
Anh yêu em hơn thế, nhiều hơn lời anh vẫn nói
Để bên em anh đánh đổi tất cả bình yên
Đêm buông xuôi vì cô đơn
Còn riêng anh cứ ngẩn ngơ
Có khi nào ta xa rời?
Anh đưa em theo với, cầm tay em và đưa lối
Đến nơi đâu anh có thể bên em trọn đời
Nơi thương yêu không phôi phai
Được bên nhau mỗi sớm mai
Quá xa xôi không em ơi?', 0, N'Bích Phương', 73)
INSERT [dbo].[tblMusic] ([iDmusic], [iDacc], [DisplayName], [Image], [Data], [Cotenttype], [luotnghe], [casi], [idchude]) VALUES (61, N'user1', N'Phai Dấu Cuộc Tình', N'/image/maxresdefault (4).jpg', N'music/PhaiDauCuocTinh-BichPhuong-3666934.mp3', N'
Một người ra đi vội vã
Mang theo những dấu yêu xa rời
Một người về trong sầu bơ vơ mang thương nhớ
Mang trái tim vỡ tan bao mộng mơ

Để rồi chia ly từ đấy
Yêu đương hoá kiếp đau thương người ơi
Để rồi bao đêm ngồi trong cô đơn hoài chờ mong
Mơ bóng anh dấu yêu quay về đây

Cuộc tình xưa phai dấu từ một buổi chiều
thật buồn mây xám theo nhau về
Sầu thương giăng kín lấp lối dĩ vãng tương lai mịt mù
Bóng anh đã quá xa vời
Một mình lê chân lạc loài
Lang thang đường về mù khơi

Còn gì đâu anh hỡi từng kỉ niệm,
nhạt nhoà theo tháng năm mong chờ
Về đâu đêm tối với bóng dáng ấy tan theo làn mây
Giấc mơ nay đã phai tàn
Cuộc tình ra đi vội vàng
Con tim này đành vỡ tan.', 0, N'Bích Phương', 73)
INSERT [dbo].[tblMusic] ([iDmusic], [iDacc], [DisplayName], [Image], [Data], [Cotenttype], [luotnghe], [casi], [idchude]) VALUES (62, N'user1', N'Chuyện Cũ Bỏ Qua', N'/image/maxresdefault (5).jpg', N'music/ChuyenCuBoQua-BichPhuong-5832993.mp3', N'Ahii Không có lờ', 0, N'Bích Phương', 73)
INSERT [dbo].[tblMusic] ([iDmusic], [iDacc], [DisplayName], [Image], [Data], [Cotenttype], [luotnghe], [casi], [idchude]) VALUES (63, N'user1', N'Ta Và Nàg', N'/image/maxresdefault (6).jpg', N'music/TaVaNang-JGKiDDen-3765639.mp3', N'JGKiD:

Ta hát cho ta
Vài lời xót xa
Đi chéo đi ngang ngày tàn tháng qua biết đâu đường ra
Ta hát cho nàng
Bài ca bẽ bang
Yêu nhầm lấy ta để rồi vỡ ra thua thiệt trăm đàng

Đen:

Anh khác gì đâu người điên, nghĩ suy lắm cho tắc rồi ngây cười
Ủ mơ được vài chén con, uống có một nhưng mà lại say mười
Chẳng phải là anh sống chậm, mà đi sau là do tính chây lười
Ta trái ôm mơ, phải ôm rác, tay đâu mà nắm lấy tay người.
Việc em yêu – em cứ yêu, chả ai cấm
Nhưng ngặt một nỗi yêu ngay gã trai hâm
Buồn thì nó cười, vui mặt nó lại trầm
Ngày thì không nghĩ, cứ đêm lại đăm đăm
Đệm êm chăn ấm nó cũng chả hoài năm
Lông bông ngày tháng đâu chỉ một-hai năm
Nhưng đói thì ăn, sợ gì no mà không tiêu
Em ơi yêu là không lo, mà đã lo là không yêu
Chim có đôi sợ đếch gì chiều tà
Yêu có nhầm cũng chẳng bị điều tra
Anh còn ham vui theo chúng bạn
Yêu như là nợ ngân hàng: anh thường xuyên ghé thăm em không đúng hạn
Em hờn em trách em buông lời súng đạn
Thông cảm cho anh điên nặng không thuốc thang
Đêm nay đèn vàng chơi vơi
Anh lại châm điếu thuốc
-Hút không em?
Làm hơi...
JGKiD:

Ta hát cho ta
Vài lời xót xa
Đi chéo đi ngang ngày tàn tháng qua biết đâu đường ra
Ta hát cho nàng
Bài ca bẽ bang
Yêu nhầm lấy ta để rồi vỡ ra thua thiệt trăm đàng
Bóng tôi tơi bời
Nuốt mất ông giời
Thằng người chơi vơi
Ta quấn điếu cọ
Về căn phòng nhỏ
Ngồi cười quắp co
Ta hát cho ta
Vài lời xót xa
Đi chéo đi ngang ngày tàn tháng qua biết đâu đường ra
Ta hát cho nàng
Bài ca bẽ bang
Yêu nhầm lấy ta để rồi vỡ ra thua thiệt trăm đàng', 0, N'Đen Vâu', 75)
INSERT [dbo].[tblMusic] ([iDmusic], [iDacc], [DisplayName], [Image], [Data], [Cotenttype], [luotnghe], [casi], [idchude]) VALUES (64, N'user1', N'Bài Này Chill Phết', N'/image/maxresdefault (7).jpg', N'music/BaiNayChillPhet-DenMIN-5978903.mp3', N'I just wanna chill with you tonight
And all the sorrow left behind uh oh
Sometimes I feel lost in the crowd
Life is full of ups and downs
But it’s alright, I feel peaceful inside
Verse1:
Em dạo này ổn không? Còn đi làm ở công ty cũ
Còn đi sớm về hôm mà đồng lương vẫn không khi đủ
Đồng nghiệp của Em thế nào? Trong thang máy có chào với nhau
Có nói qua nói lại, và những cuộc họp có đào bới nhau
Sếp của Em thế nào, dễ tính hay thường gắt gỏng
Anh ta có thương nhân viên hay thường buông lời sắc mỏng
Em còn thiếu ngủ, trong những lần phải chạy deadline
Em quên ăn quên uống, quên cả việc chải lại tóc tai
Những đôi giày cao gót chắc còn làm đau Em
Tiền bao nhiêu cho đủ, ai biết ngày sau Em?
Mắt Em còn mỏi không 8 tiếng nhìn màn hình
Những tối đi về đơn độc Em thấy lòng mình lặng thinh
Và đừng để đời chỉ là những chuỗi ngày được chấm công
Miệng cười như nắng hạ, nhưng trong lòng thì chớm đông
Nếu mà mệt quá, giữa thành phố sống chồng lên nhau
Cùng lắm thì mình về quê, mình nuôi cá và trồng thêm rau
Melody:
Trời thả vạt nắng khiến đám tóc Em hoe vàng
Chiều nay đi giữa thành phố Em bỗng thấy sao mơ màng
Tìm cho mình một không gian, bật bài nhạc làm Em chill
Tâm hồn Em, phiêu dạt theo áng mây bên trời
Verse 2:
Anh dạo này cũng bận nhiều, và cũng có thêm nhiều đêm diễn
Âm nhạc mở lối cuộc đời Anh, như là ngọn hải đăng ở trên biển
Anh được gặp những người nổi tiếng, trước giờ chỉ thấy trên tivi
Gặp H''Hen Niê hoa hậu, gặp cả Sơn Tùng M-TP
Đi hát vui lắm em, vì đồng âm của Anh họ rất tuyệt
Bọn Anh hát cùng nhau, khiến cho thanh xuân này như bất diệt
Anh thấy mình không cô đơn, không áp lực nào buộc chân Anh
Nhiều khi Anh lên sân khấu mà dưới khán giả họ thuộc hơn Anh
Anh cũng có những hợp đồng, những điều khoản mà Anh phải dần ***
Anh cũng cần tiền, những dự án họ nói họ cần Đen
Và những con số, nặng tới mức đủ sức làm choáng mình
Nhưng em yên tâm, Anh bán chất xám chứ chưa từng bán mình
Nhưng cũng có lúc mọi thứ không như là những gì ta muốn
Thế giới này vận hành theo cái cách luôn ghì ta xuống
Nhưng mà mộng mơ Anh nhiều như niêu cơm của Thạch Sanh
Ai muốn lấy cứ lấy, không thể nào mà sạch banh
Verse 3:
Mình sướng hơn những người giàu nhỉ
Vầng trán mình chưa hề nhàu nhĩ
Dù chênh vênh như là cầu khỉ
Đời sóng gió mình là tàu thuỷ
Vì một ngày còn sống, là một ngày đắm say
Ngày đẹp trời nhất, là ngày mình còn nắm tay
Mình sẽ không ngã, vì mình ngã họ hả hê
Biển người cũng là biển, cho tụi mình tắm thoả thuê
Chúng ta sẽ không, là một ai trông giống họ
Sẽ không rỗng tuếch, như một cái chai trong đống lọ
Sáng chúng ta làm, vì tờ bạc nhiều màu trong ví
Đêm về ta chill, riêng mình một bầu không khí
Vì tim ta còn trẻ, dù thân xác ta sẽ già
Nhưng mà ta không ủ rũ, như là mấy con sẻ già
Chúng ta có những chiều vàng, dắt tay nhau lên đồi xa
Nắng khoác lên mình lớp áo, nheo mắt lại nhìn trời hoa
Và những đêm đen huyền dịu, cho tiếng lòng thêm dõng dạc
Ta thấy nhau bằng tâm hồn, không cần nhìn bằng võng mạc
Ta sẽ cố để có được những thứ mà ta chờ mong
Dưới ngọn đồi, căn nhà nhỏ, nhìn ra bờ sông
Vì anh chưa từng mơ ngày nào đó mình trở thành siêu sao
Từ ngày thơ bé anh đã muốn trở thành chưởng môn phái Tiêu Dao
Em ơi vui cười lên vì đời này ai không âu lo
Thôi băn khoăn ngày mai mệt nhoài hệt như con sâu đo
Em đi ra ngoài kia tìm về vài chai Strongbow oh
Đêm nay em cần chill, việc này để cho Đen Vâu lo !', 0, N'Đen Vâu', 75)
INSERT [dbo].[tblMusic] ([iDmusic], [iDacc], [DisplayName], [Image], [Data], [Cotenttype], [luotnghe], [casi], [idchude]) VALUES (65, N'user1', N'Hai Triệu Năm', N'/image/1561965663111.jpg', N'music/HaiTrieuNam-DenBien-6007307.mp3', N'Hát:
Anh cô đơn giữa tinh không này
Muôn con sóng cuốn xô vào đây
Em cô đơn giữa mênh mông người
Và ta cô đơn đã hai triệu năm
Rap:
Xung quanh anh toàn là nước
Cơ thể anh đang bị ướt
Mênh mông toàn là nước
Êm ái như chưa từng trước đây
Trăm ngàn con sóng xô
Anh lao vào trong biển cả vì em làm anh nóng khô
Anh ngâm mình trong làn nước để mặn mòi từ da dẻ
Ta cần tình yêu vì tình yêu làm cho ta trẻ
Anh cũng cần em nhưng không biết em sao
Anh không care lắm và anh quyết đem trao
Cho em hết nắng cho em hết đêm sao
Nhìn mặt anh đi, em nghĩ anh tiếc em sao?
Trăm ngàn con sóng từ mọi nơi mà đổ về
Và đây là cách mà anh đi tìm kiếm sự vỗ về
Em có quá nhiều bí mật, anh thì ko cần gặng hỏi
Em sâu như là đại dương, anh thì không hề lặn giỏi
Anh soi mình vào gương cho bõ công lau
Thấy mặt thấy người sao thấy rõ trong nhau
Ánh mắt nụ cười kia không rõ nông sâu
Ta rồi sẽ là ai, một câu hỏi nhỏ trong đầu
Ta chỉ là hòn đất hay chỉ là cỏ bông lau
(Như là mấy gã em mới bỏ không lâu)
Hay chỉ là đầu thuốc kia cháy đỏ không lâu
Yêu em kiểu nông dân, yêu em kiểu quê mùa
Yêu từ vụ đông xuân, đến hè thu thay mùa
Nhưng em thì trơn trượt như là con cá chuối
Muốn níu em trong tay, Khá Bảnh cũng khá đuối
Em giống hệt như biển cả em có nhiều bí mật
Anh làm rất nhiều thứ, để đồng tiền trong ví chật
Người ta không quý con ong, mà người ta chỉ quý mật
Em hỏi sao nhạc anh hay, anh gọi nó là bí thuật!
Hát:
Anh cô đơn giữa tinh không này
Muôn con sóng cuốn xô vào đây
Em cô đơn giữa mênh mông người
Và ta cô đơn đã hai triệu năm
Rap:
Nước đã hình thành trong hàng triệu năm
Cát đã hình thành trong hàng triệu năm
Biển cả hình thành trong hàng triệu năm
Sao em làm anh buồn sau hàng triệu năm
Gặp em từ thể đơn bào, rồi tiến hoá
Xa em từ khi thềm lục địa đầy biến hoá
Muốn được ôm em qua kỷ Ju-ra
Hoá thạch cùng nhau trên những phiến đá
Rồi loài người tìm thấy lửa, anh lại tìm thấy em
Anh tưởng rằng mọi thứ sẽ được bùng cháy lên
Muốn được cùng em, trồng rau bên hồ cá
Nhưng tim em lúc đó, là thời kì đồ đá
Anh đã tin vào em như tin vào thuyết nhật tâm
Như Ga-li-lê người ta nói anh thật hâm
Có lẽ Đác-win biết biển cả sẽ khô hơn
Nhưng anh tin ông ta không biết chúng ta đang tiến hoá để cô đơn', 0, N'Đen Vâu', 75)
INSERT [dbo].[tblMusic] ([iDmusic], [iDacc], [DisplayName], [Image], [Data], [Cotenttype], [luotnghe], [casi], [idchude]) VALUES (66, N'user1', N'Anh đếch cần gì nhiều ngoài em', N'/image/maxresdefault (8).jpg', N'music/AnhDechCanGiNhieuNgoaiEm-DenVuThanhDong-5749937.mp3', N'Bài hát: Anh Đếch Cần Gì Nhiều Ngoài Em - Đen, Vũ, Thành Đồng
Và anh đếch cần gì nhiều ngoài em
Và anh đếch cần gì nhiều ngoài em
Và anh đếch cần gì nhiều ngoài em
Và anh đếch cần gì nhiều ngoài em
Anh như con cáo em như một cành nho xanh
Khi em còn trẻ và đẹp em lại không dành cho anh
Trong lòng anh là kho xăng, nụ cười em là mồi lửa
Em phá vỡ đi quy tắc, rồi bỏ mặc anh ngồi sửa
Anh như biến thành người nhện, vì trong lòng nhiều tơ vương
Nhớ em tốn nhiều calo, thế nên anh gầy trơ xương
Ở trong xóm anh rất ngoan, chẳng ai thấy anh say mèm
Mẹ anh dặn anh đủ thứ, nhưng quên dặn đừng say em
Như con cuốn chiếu, anh có rất nhiều chân thật
Bài hát này ngọt vì đám tụi anh rất thân mật
Anh như con cáo em vẫn là cành nho xanh
Nhưng mà em trẻ và đẹp, em lại không dành cho anh
Ta đã đi tìm về thương nhớ
Ta đã đi tìm đi tìm đi tìm
Ta đã đi tìm về quá khứ
Ta cứ đi tìm đi tìm
Và anh đếch cần gì nhiều ngoài em
Ôi một giấc mơ chơi vơi nhiều đêm
Và anh đếch cần gì nhiều ngoài em
Thương một giấc mơ ôm ta nhiều đêm
Một ngày cùng em uống đến thoáng say là đủ
Kệ đời ngả nghiêng mình nằm dưới tán cây mà ngủ
Sẽ thật là tuyệt nếu rơi vào 1 chiều thu
Anh cưa em đổ em gọi anh là tiều phu
Anh có thể có danh tiếng nếu như mặt anh dày thêm
Anh có thể có nhiều tiền nếu anh cày ngày cày đêm
Nhưng như một giấc mơ bị em chối bỏ trong chiều
Anh không có được em dù cho cố bỏ công nhiều
Nồng độ cồn em bao nhiêu sao cứ làm anh lảo đảo
Em chỉ mang lại chua cay như là gói mì hảo hảo
Một lần chơi lớn để xem em có trầm trồ
Vì yêu em, anh như mang hết con tim đi cầm đồ.
Và anh đếch cần gì nhiều ngoài em
Ôi một giấc mơ chơi vơi nhiều đêm
Và anh đếch cần gì nhiều ngoài em
Thương một giấc mơ ôm ta nhiều đêm.
Và anh đếch cần gì nhiều ngoài em
Và anh đếch cần gì nhiều ngoài em
Và anh đếch cần gì nhiều ngoài em
Và anh đếch cần gì nhiều ngoài em', 0, N'Đen Vâu', 75)
INSERT [dbo].[tblMusic] ([iDmusic], [iDacc], [DisplayName], [Image], [Data], [Cotenttype], [luotnghe], [casi], [idchude]) VALUES (67, N'user1', N' Mười Năm - Lộn Xộn', N'/image/maxresdefault (9).jpg', N'music/MuoiNamLonXon3-DenNgocLinh-5869931.mp3', N'Bài hát: Mười Năm (Lộn Xộn 3) - Đen, Ngọc Linh
It''s ĐEN VẨU
Có người đến có người đi và có người ở lại
Có lúc khôn và cũng có lần lỡ dại
Có lúc tủi, có lúc vinh và cũng có lúc thăng hoa
Có ngày cười, có ngày khóc, và có ngày hoan ca
Đời cho ta quá nhiều thứ, ta chưa cho đời được nhiều
Đến bây giờ vẫn chưa học được cách làm sao để lời được nhiều
Mười năm như 1 bức họa, cũng may là trời đỡ xám hơn
Thứ mà ta học được nhiều nhất là cách xin lỗi và lời cảm ơn
Mặt trời là cái bếp lớn, còn tia nắng là than hồng
Mỗi ngày mà ta thức dậy, ta chỉ mong được an lòng
Hoàng hôn là dải lụa, còn màn đêm là tấm chăn
Mỗi đêm ta ngồi ta viết ,ta chỉ mong không bị cấm ngăn
Nhởn nhơ trên con đường vắng tự nhủ mình không cần tăng ga
Lắng nghe cuộc đời như lá, lá rơi nghiêng như Trần Đăng Khoa
Lời ca là chất kích thích, cho cuộc đời thêm phần thăng hoa
Âm nhạc là cô gái đẹp, ta và nhạc bao lần trăng hoa
Cuộc đời này có được mấy lần mười năm
Sống làm sao khi khó, còn được có những người thăm
Nhắm mắt và hồi tưởng, chẳng có đâu mà dài
Giống như LK ta vẫn tự hỏi nhiều khi Đen Vâu là ai
Có cánh hoa nào không tàn
Có giấc mơ nào không tan
Hát để tâm tư vén màn
Thả mình xuôi với mây ngàn
Lòng mình vẫn chưa ngăn nắp
Nhìn lại buồn vui tháng năm
Một đời này ta sẽ có mấy lần 10 năm
Tâm hồn của anh, anh không chắc nó hợp thời đại
Anh níu những cành cây khô, và mong ngày sau lá rợp trở lại
Mọi thứ ngày càng phát triển, sao chúng ta càng bị bất an
Anh sống giữa lòng thành phố, nhưng lại mơ về thị trấn hoang
Hoài niệm là thứ đồ chơi ta càng lớn lại càng không chán
Gom từng chút từng chút từng chút như con giã tràng không cần công cáng
Nó là tài sản vô giá không ai mua và cũng không ai bán
Thấy lẻ loi như con chuồn chuồn bay chơ vơ trên mặt sông thoáng
Con người cũng như con chim, sáng kiếm ăn chiều bay vào tổ
Con nào cũng như con nào, chẳng con sướng chẳng con nào khổ
Con người cũng như con chim, chiều về tổ sáng thì kiếm ăn
Ngày mải mê đi tìm cơm gạo, đêm co mình dưới 1 miếng chăn
Cuộc đời là nồi cá kho muốn nó ngon phải kho nhiều lửa
Có quá nhiều thứ mưu cầu, ta chỉ cần được no nhiều bữa
Ta nhận cuộc đời quá nhiều và ta cần phải cho nhiều nữa
Và chỉ mong trong những đêm đông, mẹ không còn phải ho nhiều nữa
Có cánh hoa nào không tàn
Có giấc mơ nào không tan
Hát để tâm tư vén màn
Thả mình xuôi với mây ngàn
Lòng mình vẫn chưa ngăn nắp
Nhìn lại buồn vui tháng năm
Một đời này ta sẽ có mấy lần 10 năm
Ta đã từng đứng dưới cùng và đã từng việt vị
Ta đã nhận những lời khen và cả lời miệt thị
Và tao tin nó vẫn còn đó vẫn chưa hề triệt tiêu
10 năm qua tao vẫn cố gắng làm nhạc người Việt chill
Mấy thằng ghét tao tụi nó cũng đã bỏ cuộc
Tao vẫn là con đom đóm tụi nó cháy như bó đuốc
Tao lập lòe cả cuộc đời, tụi nó đã tắt từ lâu
Thời gian là thứ diệt cỏ ghê hơn cả thuốc trừ sâu
10 năm tao vẫn là tao, vẫn không khác mấy
Từ nhạc ra ngoài đời thường, vẫn thân xác ấy
Có người nói tao thay đổi, không, là tao thích nghi
Và cười với những phán xét, người đời thích ghi
Tao vẫn sẽ rap tiếp, cho bản thân tao trước
Khi mà tao còn thở, khi mà chân tao bước
Khi tao còn lo lắng cho những người ghét tao
Dõi theo thằng không bỏ cuộc, mệt mỏi biết bao
Bước vào cuộc chơi, tao không có gì để mà mất cả
Cách mà tao kiếm tiền, là niềm vui đặt lên trên tất cả
Con đường do tao chọn, và tao can tâm bước
Ta thà chìm dưới đại dương còn hơn bị tan trong nước
Đêm nay ta thức trắng nhìn bầu trời sao
Muốn được cười muốn được khóc như ngày đầu đời tao
Có cánh hoa nào không tàn
Có giấc mơ nào không tan
Hát để tâm tư vén màn
Thả mình xuôi với mây ngàn
Lòng mình vẫn chưa ngăn nắp
Nhìn lại buồn vui tháng năm
Một đời này ta sẽ có mấy lần 10 năm', 0, N'Đen Vâu', 75)
INSERT [dbo].[tblMusic] ([iDmusic], [iDacc], [DisplayName], [Image], [Data], [Cotenttype], [luotnghe], [casi], [idchude]) VALUES (68, N'user1', N'Lối Nhỏ', N'/image/maxresdefault (10).jpg', N'music/LoiNho1-DenPhuongAnhDao-6129215.mp3', N'Bài hát: Mười Năm (Lộn Xộn 3) - Đen, Ngọc Linh
It''s ĐEN VẨU
Có người đến có người đi và có người ở lại
Có lúc khôn và cũng có lần lỡ dại
Có lúc tủi, có lúc vinh và cũng có lúc thăng hoa
Có ngày cười, có ngày khóc, và có ngày hoan ca
Đời cho ta quá nhiều thứ, ta chưa cho đời được nhiều
Đến bây giờ vẫn chưa học được cách làm sao để lời được nhiều
Mười năm như 1 bức họa, cũng may là trời đỡ xám hơn
Thứ mà ta học được nhiều nhất là cách xin lỗi và lời cảm ơn
Mặt trời là cái bếp lớn, còn tia nắng là than hồng
Mỗi ngày mà ta thức dậy, ta chỉ mong được an lòng
Hoàng hôn là dải lụa, còn màn đêm là tấm chăn
Mỗi đêm ta ngồi ta viết ,ta chỉ mong không bị cấm ngăn
Nhởn nhơ trên con đường vắng tự nhủ mình không cần tăng ga
Lắng nghe cuộc đời như lá, lá rơi nghiêng như Trần Đăng Khoa
Lời ca là chất kích thích, cho cuộc đời thêm phần thăng hoa
Âm nhạc là cô gái đẹp, ta và nhạc bao lần trăng hoa
Cuộc đời này có được mấy lần mười năm
Sống làm sao khi khó, còn được có những người thăm
Nhắm mắt và hồi tưởng, chẳng có đâu mà dài
Giống như LK ta vẫn tự hỏi nhiều khi Đen Vâu là ai
Có cánh hoa nào không tàn
Có giấc mơ nào không tan
Hát để tâm tư vén màn
Thả mình xuôi với mây ngàn
Lòng mình vẫn chưa ngăn nắp
Nhìn lại buồn vui tháng năm
Một đời này ta sẽ có mấy lần 10 năm
Tâm hồn của anh, anh không chắc nó hợp thời đại
Anh níu những cành cây khô, và mong ngày sau lá rợp trở lại
Mọi thứ ngày càng phát triển, sao chúng ta càng bị bất an
Anh sống giữa lòng thành phố, nhưng lại mơ về thị trấn hoang
Hoài niệm là thứ đồ chơi ta càng lớn lại càng không chán
Gom từng chút từng chút từng chút như con giã tràng không cần công cáng
Nó là tài sản vô giá không ai mua và cũng không ai bán
Thấy lẻ loi như con chuồn chuồn bay chơ vơ trên mặt sông thoáng
Con người cũng như con chim, sáng kiếm ăn chiều bay vào tổ
Con nào cũng như con nào, chẳng con sướng chẳng con nào khổ
Con người cũng như con chim, chiều về tổ sáng thì kiếm ăn
Ngày mải mê đi tìm cơm gạo, đêm co mình dưới 1 miếng chăn
Cuộc đời là nồi cá kho muốn nó ngon phải kho nhiều lửa
Có quá nhiều thứ mưu cầu, ta chỉ cần được no nhiều bữa
Ta nhận cuộc đời quá nhiều và ta cần phải cho nhiều nữa
Và chỉ mong trong những đêm đông, mẹ không còn phải ho nhiều nữa
Có cánh hoa nào không tàn
Có giấc mơ nào không tan
Hát để tâm tư vén màn
Thả mình xuôi với mây ngàn
Lòng mình vẫn chưa ngăn nắp
Nhìn lại buồn vui tháng năm
Một đời này ta sẽ có mấy lần 10 năm
Ta đã từng đứng dưới cùng và đã từng việt vị
Ta đã nhận những lời khen và cả lời miệt thị
Và tao tin nó vẫn còn đó vẫn chưa hề triệt tiêu
10 năm qua tao vẫn cố gắng làm nhạc người Việt chill
Mấy thằng ghét tao tụi nó cũng đã bỏ cuộc
Tao vẫn là con đom đóm tụi nó cháy như bó đuốc
Tao lập lòe cả cuộc đời, tụi nó đã tắt từ lâu
Thời gian là thứ diệt cỏ ghê hơn cả thuốc trừ sâu
10 năm tao vẫn là tao, vẫn không khác mấy
Từ nhạc ra ngoài đời thường, vẫn thân xác ấy
Có người nói tao thay đổi, không, là tao thích nghi
Và cười với những phán xét, người đời thích ghi
Tao vẫn sẽ rap tiếp, cho bản thân tao trước
Khi mà tao còn thở, khi mà chân tao bước
Khi tao còn lo lắng cho những người ghét tao
Dõi theo thằng không bỏ cuộc, mệt mỏi biết bao
Bước vào cuộc chơi, tao không có gì để mà mất cả
Cách mà tao kiếm tiền, là niềm vui đặt lên trên tất cả
Con đường do tao chọn, và tao can tâm bước
Ta thà chìm dưới đại dương còn hơn bị tan trong nước
Đêm nay ta thức trắng nhìn bầu trời sao
Muốn được cười muốn được khóc như ngày đầu đời tao
Có cánh hoa nào không tàn
Có giấc mơ nào không tan
Hát để tâm tư vén màn
Thả mình xuôi với mây ngàn
Lòng mình vẫn chưa ngăn nắp
Nhìn lại buồn vui tháng năm
Một đời này ta sẽ có mấy lần 10 năm', 0, N'Đen Vâu', 75)
INSERT [dbo].[tblMusic] ([iDmusic], [iDacc], [DisplayName], [Image], [Data], [Cotenttype], [luotnghe], [casi], [idchude]) VALUES (69, N'user1', N'Cảm Ơn', N'/image/123.jpg', N'music/CamOn1-DenBien-6131156.mp3', N'Bài hát: Cảm Ơn - Đen, Biên
Cảm ơn người đã theo dõi
Cảm ơn người đã lắng nghe
Cảm ơn những khi đông đúc
Cảm ơn cả những vắng hoe
Cảm ơn vì đã cháy rực
Cảm ơn vì đã khát cùng
Cảm ơn người đã khan cổ
Và cảm ơn người đã hát cùng (Hey đồng âm)
1. Như là những con sóng nhấp nhô và trùng điệp (Trùng điệp)
Cảm ơn những cánh tay đã đưa lên cùng nhịp (Cùng nhịp)
Cảm ơn những đợi chờ và những lần động viên
Vui như Từ Thức, ngày đẹp trời bỗng lạc vào động tiên
Nếu đây là mơ, giấc mơ này hoang đường thật
Biết đâu ngày mai lại trở về với những lo toan thường nhật
Hiếm khi nào, nói những lời, mang đường mật
Nhưng cảm ơn vì đã mến và đã đồng hành trên con đường chật
Đời có qua có lại thì mới toại lòng nhau
Người ta cho mình quá nhiều, mình thì cho cái mẹ gì đâu
Thấy nợ nần nhiều, như là người mà đang đi vay lãi
Bí quyết thành công, gói gọn trong hai từ "may vãi"
[ĐK:]
Và tôi biết, tôi phải nói lời cảm ơn
Cho tôi sống, những tháng những ngày rất xanh
Chạm lên trái tim thấy cơn mơ còn cháy nồng
Nhiều đêm trắng xoá bay
Lòng như có gió đầu mùa
2. Con đò máy sáu, ngày ngày từ Bến Đoan ra ngoài đảo
Tôi đã lênh đênh, đã từng sống mà không có hoài bão
Và đã tự ti, nghĩ mình chắc là chẳng bằng ai đâu
Tôi như Luân Đôn 1952, mịt mù chẳng thấy mai sau
Trơ trọi như giữa trời mà không mái che
Cuộc đời chua chát, ui nó chát và chua như trái me
Ước mơ nhiều lúc, chỉ là đổ đầy xăng cho cái xe
Tô mì tôm trứng, ấm như ôm người yêu đông tái tê
Tại sao tao rap, vì lúc đó không có lựa chọn khác
Nếu mà không rap, thì có lẽ bây giờ vẫn dọn rác
Và những hành trình, cho tao thấy những ngày xanh biếc hơn
Những ngày tháng đó, nhắc tao nhớ mình phải luôn biết ơn
Tiếng lòng đêm nay như tiếng cồng chiêng
Cho dù tay trắng, cố mà giữ cho mình giấc mộng riêng
Đôi khi nhìn mây bay, đôi khi tự nhủ lòng
Đừng biến mình thành con bạc, hãy cố trở thành gã chủ sòng
[ĐK:]
Và tôi biết, tôi phải nói lời cảm ơn
Cho tôi sống, những tháng những ngày rất xanh
Chạm lên trái tim thấy cơn mơ còn cháy nồng
Nhiều đêm trắng xoá bay
Lòng như có gió đầu mùa
Và tôi biết, tôi phải nói lời cảm ơn
Cho tôi sống, những tháng những ngày rất xanh
Chạm lên trái tim thấy cơn mơ còn cháy nồng
Nhiều đêm trắng xoá bay
Lòng như có gió đầu mùa
Tôi luôn tự hỏi rằng mình có gì đặc biệt
Và nhận ra một điều được là chính mình thì thật tuyệt
Đen Vâu của ngày đó không khác Đen Vâu trên Wechoice
Đen Vâu gặp ngoài đường cũng giống trên tivi thôi
Cũng giống trên tivi thôi
Cũng giống trên tivi thôi', 0, N'Đen Vâu', 75)
INSERT [dbo].[tblMusic] ([iDmusic], [iDacc], [DisplayName], [Image], [Data], [Cotenttype], [luotnghe], [casi], [idchude]) VALUES (70, N'user1', N'Cô gái bàn bên', N'/image/maxresdefault (11).jpg', N'music/CoGaiBanBen-DenLynkLee-4570416.mp3', N'Bài hát: Cô Gái Bàn Bên - Đen, Lynk Lee
Nghe như tiếng gió xôn xao trong lòng em
Khi hai ta vẫn chưa biết tên nhau chưa kịp ***
Rồi tình cờ ngồi lại bên nhau
Nói bâng quơ những điều gì
Nói vu vơ những lạ kì
Chợt ta thành những người mơ
Chiều ráng đỏ bên quán nhỏ
Quán nhỏ không sáng tỏ
"Cho ly đen đá không đường anh ơi"
Chợt thấy đầu thuốc bàn bên kia thoáng đỏ
Anh bồi bàn mang ra hai cốc
Một cho anh, một cho em
Tay em khuấy một trời xoáy lốc
Cà phê đen, cà phê đen
Đủ chật để nhìn nhau cho thật rõ
Đủ tối để thấy khói kia lửng lơ
Đủ lặng nghe trang sách kia lật giở
Nơi đây quá đủ cho những gã hay mơ
Mình cùng chia nhau mảnh không gian này
Anh là thằng nhóc chân anh không mang giày
Đầu anh chưa nghĩ quá nhiều điều sâu xa
"Dối lòng sẽ bị quạ bắt diều hâu tha"
Tắt những cuộc gọi tắt cả email
Flow anh sẽ dắt tay em đi theo
Đến nột nơi chẳng ai biết là nơi nào
Nơi mà nỗi buồn trở nên bé tí teo
Nơi mà u sầu mỏng như là cánh ve
Nụ cười em nở tròn như là bánh xe
Môi không cần son mắt không ướt nhòe
Nơi mưa không cần trú, nơi nắng không cần che
Đôi khi anh đã quên đi hiện tại
Quên cả quá khứ quên luôn cả tương lai
Em có bao giờ thấy thời gian như ngừng lại
Trong một khoảnh khắc ta không nhớ mình là ai
Mình cùng chia nhau mảnh không gian này
Anh là thằng nhóc chân anh không mang giày
Đầu anh không nghĩ quá nhiều điều sâu xa
"Dối lòng sẽ bị quạ bắt diều hâu tha"
Em có thể gọi người như anh là gã điên
Vì điều đó đúng nên cũng thấy chả phiền
Ai cũng thay đổi chỉ có anh là bất biến
Em đang đối diện với gã mơ không ngả nghiêng
Một lần em ơi em là ai em hãy quên
Những gì em có là cảm xúc không có tên
Không có hạnh phúc, không có muộn phiền
Đối diện với em là gã trai bên bàn bên
Em có từng mơ, mơ những giấc giấc xanh tươi
Khi kim đồng hồ ngưng, em có thấy lòng chơi vơi
Soi qua làn khói em soi rõ tim người
Không biết nói câu gì chỉ biết ngồi hát xong cười
Muốn lại ngồi với em vào một chiều tàn
Lòng vui như thể nhặt được nhiều vàng
Tâm tư rộn rã tiếng con sóng ngoài xa
Đông nhưng sao thấy như đang nóng ngoài da
Mình lại chia nhau mảnh không gian này
Em là cô nhóc chân em không mang giày
Đầu em không nghĩ quá nhiều điều sâu xa
"Dối lòng sẽ bị quạ bắt diều hâu tha"
Bản chất mình vẫn chỉ là hai người lạ
Gặp gỡ tình cờ khi năm thì mười họa
Có hai người lạ gặp nhau ở quán ***
Đốt lên hai đốm lửa trong ngày trời xám đen
Kể những câu chuyện không đầu không đuôi
Nếm những cảm xúc không màu không mùi
Tâm tư không giấu không vùi
Bình yên là lúc lòng không sầu không vui
Nghe như tiếng cơn gió xôn xao trong lòng em
Khi hai ta vẫn chưa biết tên nhau chưa kịp ***
Rồi tình cờ ngồi lại bên nhau
Nói bâng quơ những điều gì
Nói vu vơ những lạ kì
Chợt ta thành những người mơ
Em có từng mơ, mơ những giấc giấc xanh tươi
Khi kim đồng hồ ngưng, em có thấy lòng chơi vơi
Soi qua làn khói em soi rõ tim người
Không biết nói câu gì chỉ biết ngồi hát xong cười', 0, N'Đen Vâu', 75)
INSERT [dbo].[tblMusic] ([iDmusic], [iDacc], [DisplayName], [Image], [Data], [Cotenttype], [luotnghe], [casi], [idchude]) VALUES (71, N'user1', N'Senorita ', N'/image/tải xuống.jfif', N'music/Seorita-ShawnMendesCamilaCabello-6163670.mp3', N'Bài hát: Señorita - Shawn Mendes, Camila Cabello
I love it when you call me señorita
I wish I could pretend I didn''t need ya
But every touch is ooh-la-la-la
It''s true, la-la-la
Ooh, I should be runnin''
Ooh, you keep me coming for ya
[Verse 1: Shawn Mendes]
Land in Miami
The air was hot from summer rain
Sweat drippin'' off me
Before I even knew her name, la-la-la
It felt like ooh-la-la-la, yeah, no
Sapphire moonlight
We danced for hours in the sand
Tequila Sunrise
Her body fit right in my hands, la-la-la
It felt like ooh-la-la-la, yeah
[Chorus: Camila Cabello & Shawn Mendes, Camila Cabello]
I love it when you call me señorita
I wish I could pretend I didn''t need ya
But every touch is ooh-la-la-la
It''s true, la-la-la
Ooh, I should be runnin''
Ooh, you know I love it when you call me señorita
I wish it wasn''t so damn hard to leave ya
But every touch is ooh-la-la-la
It''s true, la-la-la
Ooh, I should be runnin''
Ooh, you keep me coming for ya
[Verse 2: Camila Cabello with Shawn Mendes]
Locked in the hotel
There''s just some things that never change
You say we''re just friends
But friends don''t know the way you taste, la-la-la (La, la, la)
''Cause you know it''s been a long time coming
Don''t ya let me fall, oh
Ooh, when your lips undress me, hooked on your tongue
Ooh, love, your kiss is deadly, don''t stop
[Chorus: Both, Camila Cabello & Shawn Mendes]
I love it when you call me señorita
I wish I could pretend I didn''t need ya
But every touch is ooh-la-la-la
It''s true, la-la-la
Ooh, I should be runnin''
Ooh, you know I love it when you call me señorita
I wish it wasn''t so damn hard to leave ya (So damn hard to leave ya)
But every touch is ooh-la-la-la
It''s true, la-la-la (True la-la)
Ooh, I should be runnin''
Ooh, you keep me coming for ya
[Outro: Both, Shawn Mendes & Camila Cabello]
All along, I''ve been coming for ya (For you)
And I hope it meant something to you (Oh)
Call my name, I''ll be coming for ya (Coming for you)
Coming for ya (Coming for you)
For ya
For ya (Oh, she loves it when I call)
For ya
Ooh, I should be runnin''
Ooh, you keep me coming for ya', 0, N'Camila Cabello', 76)
INSERT [dbo].[tblMusic] ([iDmusic], [iDacc], [DisplayName], [Image], [Data], [Cotenttype], [luotnghe], [casi], [idchude]) VALUES (72, N'thang', N'Quay lại lại yê', N'/image/1614589505470_640.jpg', N'music/Quay Lai Lai Yeu - Ngo Kien Huy_ Vuong A.mp3', N'Sau bao ngày xa cách
Em bỗng hỏi anh
Giờ sống thế nào
Đã có cô nào chưa
Nếu như là chưa
Tại sao tin nhắn không trả lời
Chỉ là dòng tin nhắn nhất thời
Hỏi thăm chứ không phải
Là em nhớ anh
Tình cảm thì làm sao phải để dành
Gặp lại nhau đi
Trước khi chẳng quay lại được nữa
Đừng vô cớ bên ai khi cả hai
Đang gặp phải những trở ngại
Mà hãy quay đầu lại
Biết đâu ta lại yêu
Tình yêu ấy chất chứa
Tất cả cay đắng hạnh phúc
Mình đã trải qua
Giờ có sao cũng có cách vượt qua
Vậy ai nỡ cách xa
Đừng dùng những tâm tư riêng
Để áp đặt người mình vốn dĩ thương
Đừng vô lý giận hờn
Khiến tình yêu bất thường
Còn yêu nhau sao không quay lại
Lại hỏi làm sao để tim hết đau
Thì cứ quay hướng mắt về nhau
Từ vạch xuất phát nói câu yêu nhau
Mình đâu biết trước
Cạnh người nào và yêu người nào
Càng đâu biết trước ở tương lai
Mình chọn thương ai và giờ thì
Chuyện ai sai ai đúng
Với chúng ta có nghĩa lý gì
Còn duyên còn quý bỏ đi được gì
Chỉ là dòng tin nhắn nhất thời
Hỏi thăm chứ không phải
Là em nhớ anh
Tình cảm thì làm sao phải để dành
Gặp lại nhau đi
Trước khi chẳng quay lại được nữa
Đừng vô cớ bên ai khi cả hai
Đang gặp phải những trở ngại
Mà hãy quay đầu lại
Biết đâu ta lại yêu
Tình yêu ấy chất chứa
Tất cả cay đắng hạnh phúc
Mình đã trải qua
Giờ có sao cũng có cách vượt qua
Vậy ai nỡ cách xa
Đừng dùng những tâm tư riêng
Để áp đặt người mình vốn dĩ thương
Đừng vô lý giận hờn
Khiến tình yêu bất thường
Còn yêu nhau sao không quay lại
Lại hỏi làm sao để tim hết đau
Thì cứ quay hướng mắt về nhau
Từ vạch xuất phát nói câu yêu nhau
Yêu yêu nhau thì
Chẳng thể quên nhau dễ đâu
Bỏ đằng sau tất cả ta làm lại nhé
Đừng vô cớ bên ai khi cả hai
Đang gặp phải những trở ngại
Mà hãy quay đầu lại
Biết đâu ta lại yêu
Tình yêu ấy chất chứa
Tất cả cay đắng hạnh phúc
Mình đã trải qua
Giờ có sao cũng có cách vượt qua
Vậy ai nỡ cách xa
Thế ta quyết đi hết em nhé
Vẫn còn xa đừng bỏ anh thế
Chúng ta sẽ bỏ qua hết quay về', 0, N'Ngô Kiến Huy', 71)
INSERT [dbo].[tblMusic] ([iDmusic], [iDacc], [DisplayName], [Image], [Data], [Cotenttype], [luotnghe], [casi], [idchude]) VALUES (73, N'thang', N'Suốt Đời Không Xứng', N'/image/maxresdefault (12).jpg', N'music/Suot Doi Khong Xung - Khai Dang.mp3', N'Ở dưới con dốc này
Sẽ có những đổi thay
Có mấy ai ngờ
Sau chữ chờ là đắng cay
Hết sức hết tâm
Chỉ mong ngày yên ấm
Thế nhưng chẳng mấy nhận
Được gì cho bản thân
Có người bảo em đang
Chẳng trân quý anh thật lòng
Anh lại vừa bỏ lỡ
Điều gì phải không
Tâm hồn mình hư hao
Gửi than thở lên ngút cao
Tự hỏi ông Trời
Bao giờ con đến nơi
Hãy cứ để anh đi
Níu giữ anh mà chi
Nếm trải bao vô vị
Đến mờ lí trí
Tình cảm mình áng chừng
Còn tệ hơn kẻ dưng
Nên đứng bên nhau
Suốt đời không xứng
Đừng dùng chữ thương hại
Giữ lại tình cảm ai
Để trái tim hai người
Cảm nhận ở lại
Vậy nên em nếu thấy nơi trái tim
Anh chẳng phải thứ em tìm
Cứ bên cạnh ai mà em đắm chìm
Có người bảo em đang
Chẳng trân quý anh thật lòng
Anh lại vừa bỏ lỡ
Điều gì phải không
Tâm hồn mình hư hao
Gửi than thở lên ngút cao
Tự hỏi ông Trời
Bao giờ con đến nơi
Hãy cứ để anh đi
Níu giữ anh mà chi
Nếm trải bao vô vị
Đến mờ lí trí
Tình cảm mình áng chừng
Còn tệ hơn kẻ dưng
Nên đứng bên nhau
Suốt đời không xứng
Hai chúng ta bây giờ
Hết lẫn duyên cả nợ
Hai chữ duyên chồng vợ
Thế là tan vỡ
Em cần người khác rồi
Nhường đường em bước thôi
Chứ kẻ vui người đau
Anh chịu sao nổi
Thế nên anh phải nói ra lời xin lỗi', 0, N'Vương Anh Tú', 78)
INSERT [dbo].[tblMusic] ([iDmusic], [iDacc], [DisplayName], [Image], [Data], [Cotenttype], [luotnghe], [casi], [idchude]) VALUES (75, N'thang', N'Lạ Lùng', N'/image/mqdefault.jpg', N'music/LaLung-Vu-4749614.mp3', N'Lời Bài Hát:
Bài hát: Lạ Lùng - Vũ
Kìa màn đêm hiu hắt mang tên Em
Quay về trong ký ức của Anh qua thời gian
Chiều lặng im nghe gió đung đưa cây
Như là bao nỗi nhớ cuốn Anh trôi về đâu
Này gió đừng hát
Và mang nỗi nhớ chạy đi
Quên âu lo quên hết suy tư một đời
Mưa trong Anh sẽ vơi
Nhưng đôi môi đang vấn vương
Chỉ tình cờ nhìn Em
Rồi mang theo những cơn đau thét gào
Lạ lùng Em tới
Hãy tới bên Anh trong chiều đông xa vắng
Mà sao giờ đây nhìn lại
Chẳng còn thấy Em
Lạ lùng Em với
Gió hát lên câu ca làm Anh thao thức
Mà bao say mê nồng nàn giờ đã phai mau
Kìa nắng ngập tràn
Nhưng giấc mơ lại vừa bay đi
Gạt hết cuộc đời lẻ loi
Thôi mình Anh lại ngồi nhớ Em
Kìa màn đêm hiu hắt mang tên Em
Quay về trong kí ức của Anh qua thời gian
Chiều lặng im nghe gió đung đưa cây
Như là bao nỗi nhớ cuốn Anh trôi về đâu
Này gió đừng hát
Và mang nỗi nhớ chạy đi
Quên âu lo quên hết suy tư một đời
Mưa trong Anh sẽ vơi
Nhưng đôi môi đang vấn vương
Chỉ tình cờ nhìn Em
Rồi mang theo những cơn đau thét gào
Lạ lùng Em tới
Hãy tới bên Anh trong chiều đông xa vắng
Mà sao giờ đây nhìn lại
Chẳng còn thấy Em
Lạ lùng Em với
Gió hát lên câu ca làm Anh thao thức
Mà bao say mê nồng nàn giờ đã phai mau
Kìa nắng ngập tràn
Nhưng giấc mơ lại vừa bay đi
Gạt hết cuộc đời lẻ loi
Thôi mình Anh lại ngồi nhớ Em', 0, N'Vũ.', 81)
INSERT [dbo].[tblMusic] ([iDmusic], [iDacc], [DisplayName], [Image], [Data], [Cotenttype], [luotnghe], [casi], [idchude]) VALUES (76, N'admin', N'Chờ Anh Nhé', N'/image/1499536106732_640.jpg', N'music/ChoAnhNhe-HoangDungHoangRob-4475500.mp3', N'Lời Bài Hát:
Bài hát: Chờ Anh Nhé - Hoàng Rob, Nguyễn Hoàng Dũng
Ở lại em nhé, ngày mai anh sẽ về
Anh chỉ mang nỗi nhớ em thêm xa
Mang đợi chờ, thêm dài ngắn
Anh chỉ thêm kỉ niệm là những chuyến đi
Rồi có lúc em sẽ khóc tựa vai gió, tựa bóng anh ngập ngừng trôi
Vì anh biết vắng anh phố *** rất buồn
Vắng anh em vắng một bờ vai.
Anh đâu muốn xa con phố ta đã yêu
Nơi ấy hẹn hò đôi ta chuyện trò
Nơi ấy đã từng đón đưa em từng chiều tới trường
Khi ấy em còn tóc xanh.
Anh đâu muốn xa bóng dáng anh yêu thương
Đôi vai hao gầy mỏng manh tâm hồn
Anh hứa sẽ về với em như lời hứa anh từng
Xin em hãy chờ anh về.', 0, N'Hoàng Dũng', 83)
INSERT [dbo].[tblMusic] ([iDmusic], [iDacc], [DisplayName], [Image], [Data], [Cotenttype], [luotnghe], [casi], [idchude]) VALUES (77, N'user2', N'Yêu dấu tan theo', N'/image/trinh_cong_son_bai_hat.jpg', N'music/YeuDauTanTheo-NgocLan_3tkj6.mp3', N'Thôi em đừng bối rối
Trong ta chiều đã tàn
Thôi em đừng khóc nuối
Cho môi còn chút thanh tân.

Tóc em cười trong gió
Trong ta giọt máu mù
Khô theo ngày thương nhớ,
Vết buồn khắc trên da.

Em theo đời cơm áo.
Mai ra cùng phố xôn xao.
Bao nhiêu ngày yêu dấu tan theo

Ta ôm tình nặng trĩu
Nghe quanh đời mưa bão,
Ôi những ngày yêu dấu bọt bèo.

Bên sông chiều mưa tới
Bên ta cụm khói rời
Nghe bên ngày nắng mới
Em đi bằng bước chân vui

Sau lưng ngày con gái
Môi son đừng biếng lười
Cho ta còn mãi mãi
Chút buồn phấn hương bay.
', 0, N'Trịnh Công Sơn', 91)
INSERT [dbo].[tblMusic] ([iDmusic], [iDacc], [DisplayName], [Image], [Data], [Cotenttype], [luotnghe], [casi], [idchude]) VALUES (78, N'user2', N'Ru em từng ngón xuân nồng ', N'/image/trinh_cong_son_bai_hat.jpg', N'music/RuEmTungNgonXuanNong-NgocLan_3tkj8.mp3', N'Ru mãi ngàn năm dòng tóc em buồn
Bàn tay em năm ngón ru trên ngàn năm
Trên mùa lá xanh
Ngón tay em gầy nên mãi ru thêm ngàn năm
Ru mãi ngàn năm từng phiến môi mềm
Bàn tay em chau chuốt thêm cho ngàn năm
Cho vừa nhớ nhung
Có em dỗi hờn nên mãi ru thêm ngàn năm
Thôi ngủ đi em, mưa ru em ngủ
Tay em kết nụ nuôi trọn một đời nuôi một đời người
Mùa xuân vừa đến, xin mãi ăn năn mà thôi
Ru mãi ngàn năm từng ngón xuân nồng
Bàn tay em năm ngón anh ru ngàn năm
Giận hờn sẽ quên
Dáng em trôi dài trôi mãi, trôi trên ngàn năm
Thôi ngủ đi em, mưa ru em ngủ
Tay em kết nụ nuôi trọn một đời nuôi một đời người
Mùa xuân vừa đến, xin mãi ăn năn', 0, N'Trịnh Công Sơn', 90)
INSERT [dbo].[tblMusic] ([iDmusic], [iDacc], [DisplayName], [Image], [Data], [Cotenttype], [luotnghe], [casi], [idchude]) VALUES (79, N'user2', N'Đêm thấy ta là thác đổ', N'/image/trinh_cong_son_bai_hat.jpg', N'music/DemThayTaLaThacDo-NgocLan_r3kt.mp3', N'Một đêm bước chân về gác nhỏ
Chợt nhớ đóa hoa tường vi
Bàn tay ngắt hoa từ phố nọ
Giờ đây đã quên vườn xưa
Một hôm bước qua thành phố lạ
Thành phố đã đi ngủ trưa
Đời ta có khi tựa lá cỏ
Ngồi hát ca rất tự do
Nhiều khi bỗng như trẻ nhớ nhà
Từ những phố kia tôi về
Ngày xuân bước chân người rất nhẹ
Mùa xuân đã qua bao giờ
Nhiều đêm thấy ta là thác đổ
Tỉnh ra có khi còn nghe
Một hôm bước chân về giữa chợ
Chợt thấy vui như trẻ thơ
Đời ta có khi là đóm lửa
Một hôm nhóm trong vườn khuya
Vườn khuya đóa hoa nào mới nở
Đời tôi có ai vừa qua
Nhiều khi thấy trăm nghìn nấm mộ
Tôi nghĩ quanh đây hồ như
Đời ta hết mang điều mới lạ
Tôi đã sống rất ơ hờ
Lòng tôi có đôi lần khép cửa
Rồi bên vết thương tôi quỳ
Vì em đã mang lời khấn nhỏ
Bỏ tôi đứng bên đời kia
Một hôm bước chân về giữa…', 0, N'Trịnh Công Sơn', 91)
INSERT [dbo].[tblMusic] ([iDmusic], [iDacc], [DisplayName], [Image], [Data], [Cotenttype], [luotnghe], [casi], [idchude]) VALUES (80, N'user2', N'Ướt Mi', N'/image/trinh_cong_son_bai_hat.jpg', N'music/UotMi-NgocLan_3yb7r.mp3', N'Ngoài hiên mưa rơi rơi
Lòng ai như chơi vơi
Người ơi nước mắt hoen mi rồi
Đừng khóc trong đêm mưa
Đừng than trong câu ca
Buồn ơi trong đêm thâu
Ôm ấp giùm ta nhé
Người em thương mưa ngâu
Hay khóc sầu nhân thế
Tình ta đêm về
Có ấm từng cơn mơ em chưa
Mưa lạnh lùng rơi rớt giữa đêm về
Nghe não nề
Mưa kéo dài lê thê
Những đêm khuya lạnh ướt mi
Ai còn nhìn mưa mãi rớt bên dòng thêm lạnh lùng
Ai còn buồn khi lá rớt rơi trong một cuối đông
Ngoài hiên mưa rơi rơi
Buồn dâng lên đôi môi
Buồn đau hoen ướt mi ai rồi
Buồn đi trong đêm khuya
Buồn rơi theo đêm mưa
Còn mưa trong đêm nay
Lòng em buồn biết mấy', 0, N'Trịnh Công Sơn', 91)
SET IDENTITY_INSERT [dbo].[tblMusic] OFF
GO
INSERT [dbo].[Theloai] ([IDtheloai], [Tentheloai]) VALUES (N'TL1', N'Jazz')
INSERT [dbo].[Theloai] ([IDtheloai], [Tentheloai]) VALUES (N'TL10', N'Nhạc Việt')
INSERT [dbo].[Theloai] ([IDtheloai], [Tentheloai]) VALUES (N'TL11', N'Nhạc Trịnh')
INSERT [dbo].[Theloai] ([IDtheloai], [Tentheloai]) VALUES (N'TL12', N'Indie')
INSERT [dbo].[Theloai] ([IDtheloai], [Tentheloai]) VALUES (N'TL13', N'Rap')
INSERT [dbo].[Theloai] ([IDtheloai], [Tentheloai]) VALUES (N'TL2', N'Nhạc Hàn')
INSERT [dbo].[Theloai] ([IDtheloai], [Tentheloai]) VALUES (N'TL3', N'Nhạc Âu Mỹ')
INSERT [dbo].[Theloai] ([IDtheloai], [Tentheloai]) VALUES (N'TL4', N'Nhạc Hoa')
INSERT [dbo].[Theloai] ([IDtheloai], [Tentheloai]) VALUES (N'TL5', N'Nhạc Trữ Tình & Bolero')
INSERT [dbo].[Theloai] ([IDtheloai], [Tentheloai]) VALUES (N'TL6', N'EDM')
INSERT [dbo].[Theloai] ([IDtheloai], [Tentheloai]) VALUES (N'TL7', N'Hip-Hop')
INSERT [dbo].[Theloai] ([IDtheloai], [Tentheloai]) VALUES (N'TL8', N'R&B')
INSERT [dbo].[Theloai] ([IDtheloai], [Tentheloai]) VALUES (N'TL9', N'Nhạc Phim')
GO
ALTER TABLE [dbo].[tblMusic] ADD  DEFAULT ((0)) FOR [luotnghe]
GO
ALTER TABLE [dbo].[nhactt]  WITH CHECK ADD  CONSTRAINT [FK_nhactt_tblMusic] FOREIGN KEY([idnhac])
REFERENCES [dbo].[tblMusic] ([iDmusic])
GO
ALTER TABLE [dbo].[nhactt] CHECK CONSTRAINT [FK_nhactt_tblMusic]
GO
ALTER TABLE [dbo].[tblMusic]  WITH CHECK ADD  CONSTRAINT [FK_tblMusic_chude] FOREIGN KEY([idchude])
REFERENCES [dbo].[chude] ([IDchude])
GO
ALTER TABLE [dbo].[tblMusic] CHECK CONSTRAINT [FK_tblMusic_chude]
GO
ALTER TABLE [dbo].[tblMusic]  WITH CHECK ADD  CONSTRAINT [FK_tblMusic_tblAccount] FOREIGN KEY([iDacc])
REFERENCES [dbo].[tblAccount] ([IDacount])
GO
ALTER TABLE [dbo].[tblMusic] CHECK CONSTRAINT [FK_tblMusic_tblAccount]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[addacount]
@id nvarchar(50),
@pasword nvarchar(50),
@name nvarchar(50),
@email nvarchar(50),
@ngaysinh datetime,
@gioitinh nvarchar(50)
as
begin
insert into tblAccount(IDacount,Password,Name,email,ngaysinh,gioitinh)
values(@id,@pasword,@name,@email,@ngaysinh,@gioitinh)
end
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[selectAcount]
@taikhoan nvarchar(50),
@matkhau nvarchar(50)
as
begin
	SELECT *from tblAccount where IDacount= @taikhoan and  Password=  @matkhau
end
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[selectid]
@taikhoan nvarchar(50)
as
begin
	SELECT *from tblAccount where IDacount= @taikhoan
end
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[theloainhac]
@theloai1 nvarchar(50),
@theloai2 nvarchar(50),
@theloai3 nvarchar(50)
as
begin
select *from tblMusic inner join chude  on tblMusic.idchude=chude.IDchude  where chude.theloai1=@theloai1 or  chude.theloai2=@theloai2 or  chude.theloai3=@theloai3
end
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[timkiem]
@name nvarchar(50)
as
begin 
 select top 20 *from tblMusic where DisplayName LIKE N'%' + @name  + '%'
end
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[updatenhac]
@namenhac nvarchar(50),
@namecasi nvarchar(50),
@content nvarchar(50),
@idnhac int
as
begin
update tblMusic 
set DisplayName=@namenhac, casi=@namecasi,Cotenttype=@content
where tblMusic.iDmusic=@idnhac
end
GO
USE [master]
GO
ALTER DATABASE [MusicWeb] SET  READ_WRITE 
GO
