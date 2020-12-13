-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost
-- Thời gian đã tạo: Th12 13, 2020 lúc 02:49 PM
-- Phiên bản máy phục vụ: 8.0.13-4
-- Phiên bản PHP: 7.2.24-0ubuntu0.18.04.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `IofLaGAZ4I`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin`
--

CREATE TABLE `admin` (
  `idAdmin` int(11) NOT NULL,
  `phanQuyen` tinyint(4) NOT NULL COMMENT '1: IT admin, 2: Nhân viên',
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `admin`
--

INSERT INTO `admin` (`idAdmin`, `phanQuyen`, `username`, `password`) VALUES
(3, 1, 'bbbbbb', '$2y$10$U/eY4832X3eIH.JpUuWgj.H7FKM93cd2MfGmODug.zNoTet3gxIxO'),
(2, 3, 'aaaaaa', '$2y$10$RIkTAjyU3N0InUJ62UzASOfLrA8j2SKAAhwRYHs808ETi6pbvW0Ru'),
(4, 2, 'cccccc', '$2y$10$lCzM2GqbUrh86O61oGoohOBdZEYC.2UCyIG0.WB24WmwikuYolxfS');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `banggia`
--

CREATE TABLE `banggia` (
  `idBG` int(11) NOT NULL,
  `giaLP` float NOT NULL,
  `timeApDung` date NOT NULL,
  `idLP` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `banggia`
--

INSERT INTO `banggia` (`idBG`, `giaLP`, `timeApDung`, `idLP`) VALUES
(1, 5000000, '2020-11-15', 2),
(2, 2500000, '2020-11-08', 2),
(3, 3000000, '2020-11-22', 2),
(7, 500000, '2020-11-15', 3),
(9, 350000, '2020-12-03', 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `datphong`
--

CREATE TABLE `datphong` (
  `idDP` int(11) NOT NULL,
  `idLP` int(11) NOT NULL,
  `idKH` int(11) NOT NULL,
  `ngayDen` date NOT NULL,
  `ngayDi` date NOT NULL,
  `soDem` int(11) NOT NULL,
  `tongTien` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `datphong`
--

INSERT INTO `datphong` (`idDP`, `idLP`, `idKH`, `ngayDen`, `ngayDi`, `soDem`, `tongTien`, `status`) VALUES
(1, 3, 4, '2020-12-08', '2020-12-09', 1, 500000),
(2, 3, 5, '2020-12-10', '2020-12-12', 2, 1000000),
(3, 3, 6, '2020-12-12', '2020-12-14', 2, 1000000),
(4, 2, 7, '2020-12-12', '2020-12-14', 2, 700000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khachhang`
--

CREATE TABLE `khachhang` (
  `idKH` int(11) NOT NULL,
  `tenKH` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ngayHetHan` date DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `sdt` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `loaiThe` int(11) NOT NULL COMMENT '0: Visa, 1: MasterCard, 2: Domestic',
  `nganHang` int(11) NOT NULL COMMENT '0: BIDV, 1: Eximbank',
  `tenThe` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `soThe` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `khachhang`
--

INSERT INTO `khachhang` (`idKH`, `tenKH`, `ngayHetHan`, `email`, `sdt`, `loaiThe`, `nganHang`, `tenThe`, `soThe`) VALUES
(4, 'Hùng', NULL, 'quochungtran321@gmail.com', '0789991876', 2, 0, 'TRAN QUOC HUNG', '12345678912345678'),
(5, 'Trần Quốc Hùng', NULL, 'hanquocadrian@gmail.com', '0789991876', 2, 0, 'TRAN QUOC HUNG', '12345678912345678'),
(6, 'Trần Quốc Hùng', NULL, 'hanquocadrian@gmail.com', '0789991876', 2, 0, 'TRAN QUOC HUNG', '1234567891234567'),
(7, 'Kha Xuyen', NULL, 'tranmyxuyen168@gmail.com', '0908862578', 2, 0, 'TRAN KHA XUYEN', '1234567891234567');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `loaiphong`
--

CREATE TABLE `loaiphong` (
  `idLP` int(11) NOT NULL,
  `tenLP` varchar(50) NOT NULL,
  `hinhAnh` json DEFAULT NULL,
  `moTa` json DEFAULT NULL,
  `slPhongTrong` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `loaiphong`
--

INSERT INTO `loaiphong` (`idLP`, `tenLP`, `hinhAnh`, `moTa`, `slPhongTrong`) VALUES
(2, 'Phòng Classic', '[\"/image/1605575717_cream_room.jpg\", \"/image/1605575717_nature_room.jpg\"]', '[\"This\", \"This\", 1, 1, 1]', 29),
(3, 'Phòng Simple', '[\"/image/1605102321_simple_room.jpg\"]', '[\"Thật\", \"Thật\", 2, 1, 1]', 29),
(5, 'Native Bankside', '[\"/image/1605658228_cream_room.jpg\", \"/image/1605658228_nature_room.jpg\", \"/image/1605658228_simple_room.jpg\"]', '[\"Historic Southbank warehouse hotel with bags of character.\", \"Stay at Native Bankside in the heart of Shakespeare’s London in Empire Warehouse, a building packed full of original features and history. Our aparthotel is a cosy retreat from the hustle and bustle of Southbank and London Bridge, with nearby restaurants and markets making the area popular with locals and visitors alike.\", 2, 1, 1]', 30);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `slide`
--

CREATE TABLE `slide` (
  `idSlide` int(11) NOT NULL,
  `hinhAnh` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `slide`
--

INSERT INTO `slide` (`idSlide`, `hinhAnh`) VALUES
(1, '/image/1605509787_HomepageSliderDesktopjpg.jpg'),
(2, '/image/1605509805_HomepageSliderDesktop2.jpg'),
(3, '/image/1605509816_Nativemcrbanner1600-2.jpg'),
(4, '/image/1605509829_Nativemcrbanner1600-3.jpg');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`idAdmin`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Chỉ mục cho bảng `banggia`
--
ALTER TABLE `banggia`
  ADD PRIMARY KEY (`idBG`),
  ADD KEY `idLP` (`idLP`);

--
-- Chỉ mục cho bảng `datphong`
--
ALTER TABLE `datphong`
  ADD PRIMARY KEY (`idDP`),
  ADD UNIQUE KEY `idKH` (`idKH`) USING BTREE,
  ADD KEY `idLP` (`idLP`) USING BTREE;

--
-- Chỉ mục cho bảng `khachhang`
--
ALTER TABLE `khachhang`
  ADD PRIMARY KEY (`idKH`);

--
-- Chỉ mục cho bảng `loaiphong`
--
ALTER TABLE `loaiphong`
  ADD PRIMARY KEY (`idLP`),
  ADD UNIQUE KEY `tenLP` (`tenLP`);

--
-- Chỉ mục cho bảng `slide`
--
ALTER TABLE `slide`
  ADD PRIMARY KEY (`idSlide`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admin`
--
ALTER TABLE `admin`
  MODIFY `idAdmin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `banggia`
--
ALTER TABLE `banggia`
  MODIFY `idBG` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `datphong`
--
ALTER TABLE `datphong`
  MODIFY `idDP` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `khachhang`
--
ALTER TABLE `khachhang`
  MODIFY `idKH` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `loaiphong`
--
ALTER TABLE `loaiphong`
  MODIFY `idLP` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `slide`
--
ALTER TABLE `slide`
  MODIFY `idSlide` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `banggia`
--
ALTER TABLE `banggia`
  ADD CONSTRAINT `banggia_ibfk_1` FOREIGN KEY (`idLP`) REFERENCES `loaiphong` (`idlp`) ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `datphong`
--
ALTER TABLE `datphong`
  ADD CONSTRAINT `datphong_ibfk_1` FOREIGN KEY (`idKH`) REFERENCES `khachhang` (`idKH`) ON UPDATE CASCADE,
  ADD CONSTRAINT `datphong_ibfk_2` FOREIGN KEY (`idLP`) REFERENCES `loaiphong` (`idlp`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
