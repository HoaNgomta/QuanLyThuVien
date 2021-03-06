USE [master]
GO
/****** Object:  Database [DA_QLTV]    Script Date: 12/14/2017 7:20:17 AM ******/
CREATE DATABASE [DA_QLTV]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DA_QLTV', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\DA_QLTV.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DA_QLTV_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\DA_QLTV_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DA_QLTV] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DA_QLTV].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DA_QLTV] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DA_QLTV] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DA_QLTV] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DA_QLTV] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DA_QLTV] SET ARITHABORT OFF 
GO
ALTER DATABASE [DA_QLTV] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [DA_QLTV] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [DA_QLTV] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DA_QLTV] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DA_QLTV] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DA_QLTV] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DA_QLTV] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DA_QLTV] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DA_QLTV] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DA_QLTV] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DA_QLTV] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DA_QLTV] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DA_QLTV] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DA_QLTV] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DA_QLTV] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DA_QLTV] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DA_QLTV] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DA_QLTV] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DA_QLTV] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DA_QLTV] SET  MULTI_USER 
GO
ALTER DATABASE [DA_QLTV] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DA_QLTV] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DA_QLTV] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DA_QLTV] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [DA_QLTV]
GO
/****** Object:  StoredProcedure [dbo].[TONGSACHMUON]    Script Date: 12/14/2017 7:20:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[TONGSACHMUON](@MASACH CHAR(10))
AS
SELECT MASACH, COUNT(SOLUONGSM) SLSM
FROM QL_PHIEUMUON
WHERE MASACH= @MASACH
GROUP BY MaSach
GO
/****** Object:  StoredProcedure [dbo].[TONGSOSM]    Script Date: 12/14/2017 7:20:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[TONGSOSM](@MASACH CHAR(10))
AS
SELECT MASACH, COUNT(SOLUONGSM) SL
FROM QL_PHIEUMUON
WHERE MASACH= @MASACH
GROUP BY MaSach

GO
/****** Object:  StoredProcedure [dbo].[TONGSSM]    Script Date: 12/14/2017 7:20:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[TONGSSM](@MASACH CHAR(10))
AS
SELECT MASACH, SUM(SOLUONGSM) SL
FROM QL_PHIEUMUON
WHERE MASACH=@MASACH
GROUP BY MaSach
GO
/****** Object:  Table [dbo].[DOCGIA]    Script Date: 12/14/2017 7:20:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DOCGIA](
	[MaDG] [nchar](10) NOT NULL,
	[TenDG] [nchar](50) NOT NULL,
	[GioiTinh] [nchar](10) NULL,
	[DiaChi] [nchar](100) NULL,
	[SDT] [nchar](20) NULL,
	[NgaySinh] [smalldatetime] NULL,
 CONSTRAINT [PK_DOCGIA] PRIMARY KEY CLUSTERED 
(
	[MaDG] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NHANVIEN]    Script Date: 12/14/2017 7:20:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NHANVIEN](
	[TaiKhoan] [nvarchar](50) NOT NULL,
	[TenNV] [nchar](50) NULL,
	[GioiTinh] [nchar](10) NULL,
	[DiaChi] [nchar](100) NULL,
	[SDT] [varchar](50) NULL,
	[NgaySinh] [smalldatetime] NULL,
	[MatKhau] [nchar](20) NOT NULL,
	[Quyenhan] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_NHANVIEN] PRIMARY KEY CLUSTERED 
(
	[TaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NXB]    Script Date: 12/14/2017 7:20:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NXB](
	[MaNXB] [nchar](10) NOT NULL,
	[TenNXB] [nchar](100) NOT NULL,
	[DiaChi] [nchar](100) NULL,
	[SDT] [nchar](20) NOT NULL,
 CONSTRAINT [PK_NXB] PRIMARY KEY CLUSTERED 
(
	[MaNXB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PHIEUMUON]    Script Date: 12/14/2017 7:20:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PHIEUMUON](
	[MaPM] [nchar](10) NOT NULL,
	[MaDG] [nchar](10) NOT NULL,
	[TaiKhoan] [nchar](10) NOT NULL,
	[NgayMuon] [smalldatetime] NULL,
 CONSTRAINT [PK_PHIEUMUON] PRIMARY KEY CLUSTERED 
(
	[MaPM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QL_PHIEUMUON]    Script Date: 12/14/2017 7:20:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QL_PHIEUMUON](
	[MaPM] [nchar](10) NOT NULL,
	[MaSach] [nchar](10) NOT NULL,
	[HanTra] [smalldatetime] NOT NULL,
	[SoLuongSM] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SACH]    Script Date: 12/14/2017 7:20:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SACH](
	[MaSach] [nchar](10) NOT NULL,
	[TenSach] [nchar](100) NOT NULL,
	[Gia] [bigint] NULL,
	[MaNXB] [nchar](10) NULL,
	[MaTL] [nchar](10) NULL,
	[SoLuong] [int] NULL,
	[SoTrang] [int] NULL,
	[SoSachHong] [int] NULL,
 CONSTRAINT [PK_SACH] PRIMARY KEY CLUSTERED 
(
	[MaSach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[THELOAI]    Script Date: 12/14/2017 7:20:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[THELOAI](
	[MaTL] [nchar](10) NOT NULL,
	[TenTL] [nchar](100) NULL,
 CONSTRAINT [PK_THELOAI] PRIMARY KEY CLUSTERED 
(
	[MaTL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TRASACH]    Script Date: 12/14/2017 7:20:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRASACH](
	[MaPM] [nchar](10) NOT NULL,
	[MaSach] [nchar](10) NOT NULL,
	[TaiKhoan] [nchar](10) NOT NULL,
	[NgayTra] [smalldatetime] NOT NULL,
	[PhatQuaHan] [bigint] NULL
) ON [PRIMARY]

GO
/****** Object:  UserDefinedFunction [dbo].[TONGSM]    Script Date: 12/14/2017 7:20:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[TONGSM](@MASACH CHAR(10))
RETURNS TABLE AS
RETURN ( SELECT MASACH, COUNT(SOLUONGSM) SLSM
FROM QL_PHIEUMUON
WHERE MASACH= @MASACH
GROUP BY MaSach)
GO
/****** Object:  View [dbo].[dsmuon]    Script Date: 12/14/2017 7:20:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE view [dbo].[dsmuon] as select distinct dg.TenDG,s.TenSach,pm.NgayMuon,qlpm.HanTra,ts.PhatQuaHan from PHIEUMUON pm join QL_PHIEUMUON qlpm on pm.MaPM=qlpm.MaPM join DOCGIA dg on pm.MaDG=dg.MaDG join TRASACH ts on ts.MaPM=qlpm.MaPM join SACH s on s.MaSach=qlpm.MaSach  
GO
INSERT [dbo].[DOCGIA] ([MaDG], [TenDG], [GioiTinh], [DiaChi], [SDT], [NgaySinh]) VALUES (N'DG01      ', N'Nguyễn Nam Anh                                    ', N'Nam       ', N'Hà Tinh                                                                                             ', N'0334734334          ', CAST(N'1998-11-19 00:00:00' AS SmallDateTime))
INSERT [dbo].[DOCGIA] ([MaDG], [TenDG], [GioiTinh], [DiaChi], [SDT], [NgaySinh]) VALUES (N'DG02      ', N'Nguyễn Thị Trinh                                  ', N'Nữ        ', N'Nghệ An                                                                                             ', N'03847576            ', CAST(N'1998-11-19 00:00:00' AS SmallDateTime))
INSERT [dbo].[DOCGIA] ([MaDG], [TenDG], [GioiTinh], [DiaChi], [SDT], [NgaySinh]) VALUES (N'DG03      ', N'Vũ Đình Đạt                                       ', N'Nam       ', N'Hưng Yên                                                                                            ', N'037374634           ', CAST(N'1996-07-13 00:00:00' AS SmallDateTime))
INSERT [dbo].[DOCGIA] ([MaDG], [TenDG], [GioiTinh], [DiaChi], [SDT], [NgaySinh]) VALUES (N'DG04      ', N'Nguyễn Văn D                                      ', N'Nam       ', N'Tịnh An                                                                                             ', N'0214812             ', CAST(N'1998-11-27 00:00:00' AS SmallDateTime))
INSERT [dbo].[DOCGIA] ([MaDG], [TenDG], [GioiTinh], [DiaChi], [SDT], [NgaySinh]) VALUES (N'DG05      ', N'Nguyễn E                                          ', N'Nam       ', N'Quảng Ngãi                                                                                          ', N'0245648             ', CAST(N'1998-11-27 00:00:00' AS SmallDateTime))
INSERT [dbo].[NHANVIEN] ([TaiKhoan], [TenNV], [GioiTinh], [DiaChi], [SDT], [NgaySinh], [MatKhau], [Quyenhan]) VALUES (N'ADMIN', N'Vũ Song Vũ                                        ', N'Nam       ', N'Thái Bình                                                                                           ', N'016788584', CAST(N'1988-06-29 00:00:00' AS SmallDateTime), N'123456              ', N'admin')
INSERT [dbo].[NHANVIEN] ([TaiKhoan], [TenNV], [GioiTinh], [DiaChi], [SDT], [NgaySinh], [MatKhau], [Quyenhan]) VALUES (N'hoango123', N'Vân Anh                                           ', N'Nữ        ', N'Hưng Yên                                                                                            ', N'08283828', CAST(N'1984-11-27 00:00:00' AS SmallDateTime), N'123456              ', N'user')
INSERT [dbo].[NHANVIEN] ([TaiKhoan], [TenNV], [GioiTinh], [DiaChi], [SDT], [NgaySinh], [MatKhau], [Quyenhan]) VALUES (N'NV01   ', N'Ngô Thị Hòa                                       ', N'Nữ        ', N'Kon Tum                                                                                             ', N'1234667', CAST(N'2017-11-29 00:00:00' AS SmallDateTime), N'123456              ', N'user')
INSERT [dbo].[NHANVIEN] ([TaiKhoan], [TenNV], [GioiTinh], [DiaChi], [SDT], [NgaySinh], [MatKhau], [Quyenhan]) VALUES (N'NV02    ', N'Nguyễn Văn Chung                                  ', N'Nam       ', N'Kon Tum                                                                                             ', N'012225548', CAST(N'1972-12-19 00:00:00' AS SmallDateTime), N'1234                ', N'user')
INSERT [dbo].[NHANVIEN] ([TaiKhoan], [TenNV], [GioiTinh], [DiaChi], [SDT], [NgaySinh], [MatKhau], [Quyenhan]) VALUES (N'NV03   ', N'Phan Phú Quốc                                     ', N'Nam       ', N'Nghĩa Hành                                                                                          ', N'0111111111          ', CAST(N'1996-12-24 00:00:00' AS SmallDateTime), N'123                 ', N'user')
INSERT [dbo].[NHANVIEN] ([TaiKhoan], [TenNV], [GioiTinh], [DiaChi], [SDT], [NgaySinh], [MatKhau], [Quyenhan]) VALUES (N'vuongle', N'Vương Thị Lê                                      ', N'Nữ        ', N'Nghê An                                                                                             ', N'0199438', CAST(N'1985-12-03 00:00:00' AS SmallDateTime), N'hoango              ', N'user')
INSERT [dbo].[NXB] ([MaNXB], [TenNXB], [DiaChi], [SDT]) VALUES (N'NXB001    ', N'Giáo dục                                                                                            ', N'123,Quảng Ngãi                                                                                      ', N'01234546            ')
INSERT [dbo].[NXB] ([MaNXB], [TenNXB], [DiaChi], [SDT]) VALUES (N'NXB002    ', N'Tiền Phong                                                                                          ', N'cb, Quảng Ngãi                                                                                      ', N'011111245664        ')
INSERT [dbo].[NXB] ([MaNXB], [TenNXB], [DiaChi], [SDT]) VALUES (N'NXB003    ', N'Tuổi Trẻ                                                                                            ', N'An Phú Sinh, tp Quảng Ngãi                                                                          ', N'02315646            ')
INSERT [dbo].[NXB] ([MaNXB], [TenNXB], [DiaChi], [SDT]) VALUES (N'NXB004    ', N'Nhã Nam                                                                                             ', N'456, Cầu Giấy, Hà Nội                                                                               ', N'01678265701         ')
INSERT [dbo].[NXB] ([MaNXB], [TenNXB], [DiaChi], [SDT]) VALUES (N'NXV005    ', N'Skybook                                                                                             ', N'Hà Nội                                                                                              ', N'1678265701          ')
INSERT [dbo].[PHIEUMUON] ([MaPM], [MaDG], [TaiKhoan], [NgayMuon]) VALUES (N'PM001     ', N'DG04      ', N'hoango123 ', CAST(N'2017-06-24 00:00:00' AS SmallDateTime))
INSERT [dbo].[PHIEUMUON] ([MaPM], [MaDG], [TaiKhoan], [NgayMuon]) VALUES (N'PM003     ', N'DG01      ', N'NV02      ', CAST(N'2017-06-23 00:00:00' AS SmallDateTime))
INSERT [dbo].[PHIEUMUON] ([MaPM], [MaDG], [TaiKhoan], [NgayMuon]) VALUES (N'PM009     ', N'DG04      ', N'NV03      ', CAST(N'2017-06-22 00:00:00' AS SmallDateTime))
INSERT [dbo].[QL_PHIEUMUON] ([MaPM], [MaSach], [HanTra], [SoLuongSM]) VALUES (N'PM001     ', N'S006      ', CAST(N'2017-12-03 00:00:00' AS SmallDateTime), 4)
INSERT [dbo].[QL_PHIEUMUON] ([MaPM], [MaSach], [HanTra], [SoLuongSM]) VALUES (N'PM001     ', N'S002      ', CAST(N'2017-12-03 00:00:00' AS SmallDateTime), 4)
INSERT [dbo].[QL_PHIEUMUON] ([MaPM], [MaSach], [HanTra], [SoLuongSM]) VALUES (N'PM003     ', N'S005      ', CAST(N'2017-12-03 00:00:00' AS SmallDateTime), 4)
INSERT [dbo].[QL_PHIEUMUON] ([MaPM], [MaSach], [HanTra], [SoLuongSM]) VALUES (N'PM003     ', N'S007      ', CAST(N'2017-12-03 00:00:00' AS SmallDateTime), 4)
INSERT [dbo].[SACH] ([MaSach], [TenSach], [Gia], [MaNXB], [MaTL], [SoLuong], [SoTrang], [SoSachHong]) VALUES (N'S002      ', N'Công nghệ phần miềm                                                                                 ', 78000, N'NXB002    ', N'TL01      ', 76, 324, 2)
INSERT [dbo].[SACH] ([MaSach], [TenSach], [Gia], [MaNXB], [MaTL], [SoLuong], [SoTrang], [SoSachHong]) VALUES (N'S003      ', N'Toán đại cương                                                                                      ', 45000, N'NXB001    ', N'TL02      ', 49, 350, 3)
INSERT [dbo].[SACH] ([MaSach], [TenSach], [Gia], [MaNXB], [MaTL], [SoLuong], [SoTrang], [SoSachHong]) VALUES (N'S004      ', N'Toán đại cương                                                                                      ', 45000, N'NXB001    ', N'TL02      ', 37, 200, 0)
INSERT [dbo].[SACH] ([MaSach], [TenSach], [Gia], [MaNXB], [MaTL], [SoLuong], [SoTrang], [SoSachHong]) VALUES (N'S005      ', N'Vật Lý đại cương                                                                                    ', 50000, N'NXB001    ', N'TL01      ', 30, 258, 2)
INSERT [dbo].[SACH] ([MaSach], [TenSach], [Gia], [MaNXB], [MaTL], [SoLuong], [SoTrang], [SoSachHong]) VALUES (N'S006      ', N'Cấu trúc dữ liệu                                                                                    ', 680000, N'NXB001    ', N'TL01      ', 46, 234, 2)
INSERT [dbo].[SACH] ([MaSach], [TenSach], [Gia], [MaNXB], [MaTL], [SoLuong], [SoTrang], [SoSachHong]) VALUES (N'S007      ', N'Bạch dạ hành                                                                                        ', 392944, N'NXV005    ', N'TL02      ', 45, 324, 2)
INSERT [dbo].[THELOAI] ([MaTL], [TenTL]) VALUES (N'TL01      ', N'Công nghệ thông tin                                                                                 ')
INSERT [dbo].[THELOAI] ([MaTL], [TenTL]) VALUES (N'TL02      ', N'Trinh Thám                                                                                          ')
INSERT [dbo].[THELOAI] ([MaTL], [TenTL]) VALUES (N'TL03      ', N'Tạp chí                                                                                             ')
INSERT [dbo].[THELOAI] ([MaTL], [TenTL]) VALUES (N'TL04      ', N'KINH TẾ                                                                                             ')
INSERT [dbo].[TRASACH] ([MaPM], [MaSach], [TaiKhoan], [NgayTra], [PhatQuaHan]) VALUES (N'PM003     ', N'S007      ', N'NV02      ', CAST(N'2017-12-03 00:00:00' AS SmallDateTime), 0)
INSERT [dbo].[TRASACH] ([MaPM], [MaSach], [TaiKhoan], [NgayTra], [PhatQuaHan]) VALUES (N'PM001     ', N'S006      ', N'hoango123 ', CAST(N'2017-12-03 00:00:00' AS SmallDateTime), 0)
INSERT [dbo].[TRASACH] ([MaPM], [MaSach], [TaiKhoan], [NgayTra], [PhatQuaHan]) VALUES (N'PM001     ', N'S002      ', N'hoango123 ', CAST(N'2017-12-03 00:00:00' AS SmallDateTime), 0)
INSERT [dbo].[TRASACH] ([MaPM], [MaSach], [TaiKhoan], [NgayTra], [PhatQuaHan]) VALUES (N'PM003     ', N'S005      ', N'NV02      ', CAST(N'2017-12-03 00:00:00' AS SmallDateTime), 0)
ALTER TABLE [dbo].[PHIEUMUON]  WITH CHECK ADD  CONSTRAINT [FK_PHIEUMUON_DOCGIA] FOREIGN KEY([MaDG])
REFERENCES [dbo].[DOCGIA] ([MaDG])
GO
ALTER TABLE [dbo].[PHIEUMUON] CHECK CONSTRAINT [FK_PHIEUMUON_DOCGIA]
GO
ALTER TABLE [dbo].[QL_PHIEUMUON]  WITH CHECK ADD  CONSTRAINT [FK_QL_PHIEUMUON_PHIEUMUON] FOREIGN KEY([MaPM])
REFERENCES [dbo].[PHIEUMUON] ([MaPM])
GO
ALTER TABLE [dbo].[QL_PHIEUMUON] CHECK CONSTRAINT [FK_QL_PHIEUMUON_PHIEUMUON]
GO
ALTER TABLE [dbo].[QL_PHIEUMUON]  WITH CHECK ADD  CONSTRAINT [FK_QL_PHIEUMUON_SACH] FOREIGN KEY([MaSach])
REFERENCES [dbo].[SACH] ([MaSach])
GO
ALTER TABLE [dbo].[QL_PHIEUMUON] CHECK CONSTRAINT [FK_QL_PHIEUMUON_SACH]
GO
ALTER TABLE [dbo].[TRASACH]  WITH CHECK ADD  CONSTRAINT [FK_TRASACH_PHIEUMUON] FOREIGN KEY([MaPM])
REFERENCES [dbo].[PHIEUMUON] ([MaPM])
GO
ALTER TABLE [dbo].[TRASACH] CHECK CONSTRAINT [FK_TRASACH_PHIEUMUON]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[43] 4[4] 2[27] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "pm"
            Begin Extent = 
               Top = 145
               Left = 404
               Bottom = 266
               Right = 568
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "qlpm"
            Begin Extent = 
               Top = 17
               Left = 43
               Bottom = 121
               Right = 207
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "dg"
            Begin Extent = 
               Top = 2
               Left = 404
               Bottom = 123
               Right = 568
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "ts"
            Begin Extent = 
               Top = 146
               Left = 42
               Bottom = 267
               Right = 206
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "s"
            Begin Extent = 
               Top = 240
               Left = 240
               Bottom = 361
               Right = 404
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'dsmuon'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'dsmuon'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'dsmuon'
GO
USE [master]
GO
ALTER DATABASE [DA_QLTV] SET  READ_WRITE 
GO
