CREATE TABLE `Khoa` (
  `KhoaID` varchar(2) PRIMARY KEY,
  `TenKhoa` varchar(50)
);
INSERT INTO `Khoa` (`KhoaID`, `TenKhoa`) VALUES
('CN', 'Khoa Công nghệ Thông tin'),
('TO', 'Khoa Toán'),
('VL', 'Khoa Vật lý');

CREATE TABLE `MonHoc` (
  `MonHocID` char(2) PRIMARY KEY,
  `TenMonHoc` varchar(50)
);
INSERT INTO `MonHoc` (`MonHocID`, `TenMonHoc`) VALUES
('CO', 'Cơ lý thuyết'),
('CS', 'Cơ sở dữ liệu'),
('CT', 'Cấu trúc dữ liệu'),
('LT', 'Lượng tử'),
('RR', 'Toán rời rạc'),
('TC', 'Toán cao cấp'),
('TT', 'Trí tuệ nhân tạo');

CREATE TABLE `SinhVien` (
  `SinhVienID` varchar(3) PRIMARY KEY,
  `HoSinhVien` varchar(30),
  `TenSinhVien` varchar(20),
  `NgaySinh` datetime,
  `GioiTinh` bit,
  `DiaChi` varchar(50),
  `HocBong` int,
  `KhoaID` char(2)
);
INSERT INTO `SinhVien` 
(`SinhVienID`, `HoSinhVien`, `TenSinhVien`, `NgaySinh`, `GioiTinh`, `HocBong`, `KhoaID`) VALUES
('C00',	'Nguyễn Thị',	'Trang',	'1991-08-13',	False,	100000,	'CN'),
('C01',	'Hà',	'Tuấn',	'1991-02-24',	True,	0,	'CN'),
('C02',	'Trần Ngọc',	'Hòa','1990-06-11',	False,	120000,	'CN'),
('C03',	'Bùi Thị',	'Thảo', '1990-02-26',	False,	100000,	'CN'),
('C04',	'Nguyễn Hoàng',	'Hưng', '1990-03-19',True,	150000,	'CN'),
('T00',	'Lê',	'Tuấn',	'1991-02-15',	True,	0,	'TO'),
('T01',	'Bùi Minh',	'Khánh', '1990-04-09',	True,	120000,	'TO'),
('T02',	'Trần Thị',	'Lan', '1990-03-04',	False,	100000,	'TO'),
('T03',	'Lê',	'Thiện', '1990-05-18',	True,	0,	'TO'),
('T04',	'Lê Thị',	'Thảo',	'1990-03-27',	False,	120000,	'TO');

CREATE TABLE `KetQua` (
  `SinhVienID` char(3),
  `MonHocID` char(2),
  `Diem` real
);
INSERT INTO `KetQua` (`SinhVienID`, `MonHocID`, `Diem`) VALUES
('C00',	'CS',	10),
('C00',	'CT',	9),
('C00',	'TT',	7),
('C00',	'RR',	8.5),
('C01',	'CS',	7),
('C01',	'CT',	6),
('C01',	'TT',	7),
('C01',	'RR',	9),
('C02',	'CS',	7.5),
('C02',	'CT',	4),
('C02',	'TT',	5),
('C02',	'RR',	3),
('C03',	'CS',	9),
('C03',	'CT',	1),
('C03',	'TT',	8.5),
('C03',	'RR',	9),
('C04',	'CS',	2),
('C04',	'CT',	1);