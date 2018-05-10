use master
drop database QLTour
create database QLTour
use QLTour

create table KhachLe
(
MaKH int IDENTITY(1,1) primary key,
TenKH nvarchar(50),
NgaySinh date,
GioiTinh bit,
CMND int,
SDT int,
DiaChi nvarchar(50)
)

create table KhachDoan
(
MaKD int IDENTITY(1,1) primary key,
TenCoQuan nvarchar(50),
SDTCoQuan int,
DiaChiCoQuan nvarchar(50),
MaKH int,
foreign key (MaKH) references KhachLe(MaKH)
)


create table HuongDanVien
(
MaHDV int IDENTITY(1,1) primary key,
TenHDV nvarchar(50),
NgaySinhHDV date,
GioiTinhHDV bit,
SDTHDV int,
DiaChiHDV nvarchar(50),
LuongCanBan float
)

create table DiaDiem
(
MaDD int IDENTITY(1,1) primary key,
TenDD nvarchar(50),
DiaChiDD nvarchar(50),
YNghia nvarchar(200)
)

create table PhuongTien
(
MaPT int IDENTITY(1,1) primary key,
TenPT nvarchar(50)
)

create table KhachSan
(
MaKS int IDENTITY(1,1) primary key,
TenKS nvarchar(50),
SDTKS int,
DiaChiKS nvarchar(50),
TieuChuanKS int
)


create table NhaHang
(
MaNH int IDENTITY(1,1) primary key,
TenNH nvarchar(50),
SDTNH int,
DiaChiNH nvarchar(50),
TieuChuanNH int
)

create table Tour
(
MaTour int IDENTITY(1,1) primary key,
TenTour nvarchar(50),
SoNgay int,
NgayKhoiHanh date,
SoLuongKhach int,
MaKD int,
MaHDV int,
MaDD int,
DonGia float,
foreign key (MaKD) references KhachDoan(MaKD),
foreign key (MaHDV) references HuongDanVien(MaHDV),
foreign key (MaDD) references DiaDiem(MaDD),
)



create table KhachLe_Tour
(
Id int IDENTITY(1,1) primary key,
MaKH int,
MaTour int,
NgayDangKy date,
foreign key (MaKH) references KhachLe(MaKH),
foreign key (MaTour) references Tour(MaTour)
)



create table DiaDiemDungChan
(
MaTour int,
MaDD int,
NgayDen date,
NgayDi date,
primary key(MaTour,MaDD),
foreign key (MaTour) references Tour(MaTour),
foreign key (MaDD) references DiaDiem(MaDD)
)



create table PhuongTienDungChan
(
MaTour int,
MaDD int,
MaPT int,
primary key(MaTour,MaDD,MaPT),
foreign key (MaTour,MaDD) references DiaDiemDungChan(MaTour,MaDD),
foreign key (MaPT) references PhuongTien(MaPT),
)



create table NhaHangDungChan
(
MaTour int,
MaDD int,
MaNH int,
primary key(MaTour, MaDD,MaNH),
foreign key (MaTour,MaDD) references DiaDiemDungChan(MaTour,MaDD),
--foreign key (MaDD) references DiaDiem(MaDD),
foreign key (MaNH) references NhaHang(MaNH)
)




create table KhachSanDungChan
(
MaTour int,
MaDD int,
MaKS int,
primary key(MaTour, MaDD,MaKS),
foreign key (MaTour,MaDD) references DiaDiemDungChan(MaTour,MaDD),
foreign key (MaKS) references KhachSan(MaKS)
)



create table DangNhap
(
TenDangNhap varchar(50)constraint pk_DangNhap primary key,
MatKhau varchar(50)
)
insert into DangNhap values('admin','123')
insert into DangNhap values('admin2','456')

insert into KhachLe values(N'Nguyễn Văn A','1/1/1991','0','111111111','0919000000',N'Quận 1')
insert into KhachLe values(N'Trần Thị B','2/2/1992','1','222222222','0919111111',N'Quận 2')
insert into KhachLe values(N'Nguyễn Thị C','3/3/1993','1','333333333','0919222222',N'Quận 3')
insert into KhachLe values(N'Bùi Minh D','4/4/1994','0','444444444','0919333333',N'Quận 4')
insert into KhachLe values(N'Phạm Thị F','5/5/1995','1','555555555','0919444444',N'Quận 5')

insert into KhachDoan values(N'FPT','0938222222',N'Quận 6',N'5')
insert into KhachDoan values(N'Vĩnh Tiến','0938333333',N'Quận 7',N'2')
insert into KhachDoan values(N'Việt Tiến','0938444444',N'Quận 8',N'3')
insert into KhachDoan values(N'Blue','0938555555',N'Quận 9',N'1')
insert into KhachDoan values(N'Lime','0938666666',N'Quận 10',N'4')

insert into HuongDanVien values(N'Nguyễn A','04/20/1991','1','0123444444',N'Quận Tân Bình','3000000')
insert into HuongDanVien values(N'Trần B','05/29/1991','1','0123555555',N'Quận Tân Phú','4000000')
insert into HuongDanVien values(N'Phạm C','09/22/1992','0','0123666666',N'Quận Bình Tân','3500000')
insert into HuongDanVien values(N'Phan M','10/25/1993','0','0123777777',N'Quận 11','2500000')
insert into HuongDanVien values(N'Bùi N','04/30/1994','0','0123888888',N'Quận 12','4500000')

insert into DiaDiem values(N'Bến Nhà Rồng',N'Hồ Chí Minh',N'Nơi Bác ra đi tìm đường cứu nước')
insert into DiaDiem values(N'Cồn Thới Sơn',N'Mỹ Tho',N'Danh lam thắng cảnh')
insert into DiaDiem values(N'Bà Nà',N'Đà Nẵng',N'Danh lam thắng cảnh')
insert into DiaDiem values(N'Vinpearl land',N'Nha Trang',N'Khu vui chơi')
insert into DiaDiem values(N'Bãi Trước',N'Vũng Tàu',N'Bãi biển đẹp')

insert into PhuongTien values(N'Máy Bay')
insert into PhuongTien values(N'Xe hơi')
insert into PhuongTien values(N'Xe lửa')
insert into PhuongTien values(N'Tàu')
insert into PhuongTien values(N'Xe máy')

insert into KhachSan values(N'White','0281111111',N'Mỹ Tho','2')
insert into KhachSan values(N'Yellow','0282222222',N'Nha Trang','3')
insert into KhachSan values(N'Green','0283333333',N'Vũng Tàu','4')
insert into KhachSan values(N'Pink','0284444444',N'Hồ Chí Minh','2')
insert into KhachSan values(N'Black','0285555555',N'Đà Nẵng','3')

insert into NhaHang values(N'Ấn Độ','0381111111',N'Mỹ Tho','2')
insert into NhaHang values(N'Thái Lan','0382222222',N'Nha Trang','3')
insert into NhaHang values(N'Huế','0383333333',N'Vũng Tàu','4')
insert into NhaHang values(N'Nhật','0384444444',N'Hồ Chí Minh','2')
insert into NhaHang values(N'Hàn','0385555555',N'Đà Nẵng','3')

insert into Tour values(N'Tour đi Bến Nhà Rồng','1','05/20/2018','12','3','2','1','200000')
insert into Tour values(N'Tour đi Vinpearl land','4','06/20/2018','13','1','1','4','400000')
insert into Tour values(N'Tour đi Cồn Thới Sơn','3','07/20/2018','14','2','3','2','8000000')

insert into KhachLe_Tour values('3','1','05/21/2018')
insert into KhachLe_Tour values('2','2','06/23/2018')
insert into KhachLe_Tour values('1','3','07/22/2018')

insert into DiaDiemDungChan values('3','2','07/26/2018','07/25/2018')
insert into DiaDiemDungChan values('2','4','06/25/2018','06/23/2018')
insert into DiaDiemDungChan values('1','1','05/28/2018','05/27/2018')

insert into PhuongTienDungChan values('3','2','2')
insert into PhuongTienDungChan values('2','4','4')
insert into PhuongTienDungChan values('1','1','5')

insert into NhaHangDungChan values('3','2','1')
insert into NhaHangDungChan values('2','4','2')
insert into NhaHangDungChan values('1','1','4')

insert into KhachSanDungChan values('3','2','1')
insert into KhachSanDungChan values('2','4','2')
insert into KhachSanDungChan values('1','1','4')

select * from KhachLe
select * from KhachDoan
select * from HuongDanVien
select * from KhachSan
select * from NhaHang
select * from Tour
select * from KhachLe_Tour
select * from DiaDiemDungChan
select * from PhuongTienDungChan
select * from NhaHangDungChan
select * from KhachSanDungChan
