CREATE DATABASE QLBanHang
GO 

USE QLBanHang
GO

CREATE TABLE CUSTOMERS(
	MaKH VARCHAR(10) NOT NULL PRIMARY KEY,
	HoTen NVARCHAR(50),
	Email VARCHAR(50),
	Phone VARCHAR(30),
	DiaChi NVARCHAR(255)
)
GO

CREATE TABLE PRODUCTS(
	MaSP VARCHAR(10) NOT NULL PRIMARY KEY,
	TenSP NVARCHAR(50),
	MoTa NVARCHAR(255),
	GiaSP float,
	SoLuong INT
)
GO

CREATE TABLE ORDER_DETAIL(
	MaDH_detail VARCHAR(10) NOT NULL,
	MaDH VARCHAR(10) NOT NULL,--khoá ngoại
	MaSP VARCHAR(10) NOT NULL,--khoá ngoại
	SLuongSPM INT,
	ThanhTien float,
	PRIMARY KEY(MaDH_detail, MaDH, MaSP)
)
GO

CREATE TABLE PAYMENTSS(
	MaPTTT VARCHAR(10) NOT NULL PRIMARY KEY,
	TenPTTT NVARCHAR(50),
	PhiPTTT INT
)
GO

CREATE TABLE ORDERS(
	MaDH VARCHAR(10) NOT NULL primary key,
	MaKH VARCHAR(10) NOT NULL,--khoá ngoại
	NgayDH DATE,
	TrangThaiDH NVARCHAR(255),
	TongTien float,
	MaPTTT VARCHAR(10) NOT NULL --khóa ngoại
)
GO

-- liên kết khoá ngoại
	ALTER TABLE dbo.ORDER_DETAIL ADD FOREIGN KEY(MaSP) REFERENCES dbo.PRODUCTS(MaSP);
	ALTER TABLE dbo.ORDER_DETAIL ADD FOREIGN KEY(MaDH) REFERENCES dbo.ORDERS(MaDH);
	ALTER TABLE dbo.ORDERS ADD FOREIGN KEY(MaKH) REFERENCES dbo.CUSTOMERS(MaKH);
	ALTER TABLE dbo.ORDERS ADD FOREIGN KEY(MaPTTT) REFERENCES dbo.PAYMENTSS(MaPTTT);

--Nhập dữ liệu
--Customer
INSERT INTO CUSTOMERS (MaKH,HoTen,Email,Phone,DiaChi)
VALUES ('KH001','Nguyen Thi Uyen','uyenn@gmail.com','0397695379','Da Nang')
INSERT INTO CUSTOMERS (MaKH,HoTen,Email,Phone,DiaChi)
VALUES ('KH002','Tran Thi Thuy','thuy@gmail.com','0394758299','Da Nang')
INSERT INTO CUSTOMERS (MaKH,HoTen,Email,Phone,DiaChi)
VALUES ('KH003','Phan Van Hung','hung@gmail.com','0905231444','Hue')
INSERT INTO CUSTOMERS (MaKH,HoTen,Email,Phone,DiaChi)
VALUES ('KH004','Tran Trong Tuyen','tuyen@gmail.com','0931231031','Quang Ngai')
INSERT INTO CUSTOMERS (MaKH,HoTen,Email,Phone,DiaChi)
VALUES ('KH005','Tran Nhat Khanh Lan','lan@gmail.com','0931313131','Da Nang')
SELECT * FROM CUSTOMERS
DELETE FROM dbo.CUSTOMERS


--product
INSERT INTO PRODUCTS (MaSP,TenSP,MoTa,GiaSP,SoLuong)
VALUES ('SP001','Banh my','Banh my thit cha',15000,10)
INSERT INTO PRODUCTS (MaSP,TenSP,MoTa,GiaSP,SoLuong)
VALUES ('SP002','Mi tron cung dinh (ly)','Mi tron an lien',12000,24)
INSERT INTO PRODUCTS (MaSP,TenSP,MoTa,GiaSP,SoLuong)
VALUES ('SP003','Xoi lac','Ngon',10000,50)
INSERT INTO PRODUCTS (MaSP,TenSP,MoTa,GiaSP,SoLuong)
VALUES ('SP004','Nuoc cam ep','Chai',16000,100)
SELECT * FROM PRODUCTS
DELETE FROM dbo.PRODUCTS

--payment
INSERT INTO PAYMENTSS (MaPTTT,TenPTTT,PhiPTTT)
VALUES ('PTTT01','Thanh toan khi nhan hang',0)
INSERT INTO PAYMENTSS (MaPTTT,TenPTTT,PhiPTTT)
VALUES ('PTTT02','Thanh toan qua Internet Banking',0)
INSERT INTO PAYMENTSS (MaPTTT,TenPTTT,PhiPTTT)
VALUES ('PTTT03','Thanh toan qua Momo',10000)
INSERT INTO PAYMENTSS (MaPTTT,TenPTTT,PhiPTTT)
VALUES ('PTTT04','Thanh toan qua Zalopay',10001)
SELECT * FROM PAYMENTSS
DELETE FROM dbo.PAYMENTSS

--order
INSERT INTO ORDERS (MaDH,MaKH,NgayDH,TrangThaiDH,TongTien,MaPTTT)
VALUES ('DH001','KH001','2022-01-12','Thanh cong',240000,'PTTT01')
INSERT INTO ORDERS (MaDH,MaKH,NgayDH,TrangThaiDH,TongTien,MaPTTT)
VALUES ('DH002','KH002','2022-01-29','Thanh cong',450000,'PTTT02')
INSERT INTO ORDERS (MaDH,MaKH,NgayDH,TrangThaiDH,TongTien,MaPTTT)
VALUES ('DH003','KH003','2022-01-11','Dang chuan bi hang',1000000,'PTTT02')
INSERT INTO ORDERS (MaDH,MaKH,NgayDH,TrangThaiDH,TongTien,MaPTTT)
VALUES ('DH004','KH004','2022-02-12','Dang chuan bi hang',320000,'PTTT02')
INSERT INTO ORDERS (MaDH,MaKH,NgayDH,TrangThaiDH,TongTien,MaPTTT)
VALUES ('DH005','KH005','2022-02-19','Thanh cong',120000,'PTTT01')
INSERT INTO ORDERS (MaDH,MaKH,NgayDH,TrangThaiDH,TongTien,MaPTTT)
VALUES ('DH006','KH001','2022-02-20','Thanh cong',320000,'PTTT04')
SELECT * FROM ORDERS
DELETE FROM dbo.ORDERS


--order_detail
INSERT INTO ORDER_DETAIL (MaDH_detail,MaDH,MaSP,SLuongSPM,ThanhTien)
VALUES ('001','DH001','SP002',2,24000)
INSERT INTO ORDER_DETAIL (MaDH_detail,MaDH,MaSP,SLuongSPM,ThanhTien)
VALUES ('002','DH002','SP001',3,45000)
INSERT INTO ORDER_DETAIL (MaDH_detail,MaDH,MaSP,SLuongSPM,ThanhTien)
VALUES ('003','DH003','SP003',10,100000)
INSERT INTO ORDER_DETAIL (MaDH_detail,MaDH,MaSP,SLuongSPM,ThanhTien)
VALUES ('004','DH004','SP004',20,320000)
INSERT INTO ORDER_DETAIL (MaDH_detail,MaDH,MaSP,SLuongSPM,ThanhTien)
VALUES ('004','DH004','SP002',26,312000)
SELECT * FROM ORDER_DETAIL
DELETE FROM dbo.ORDER_DETAIL



  -- cho sự kiện thêm mới bản ghi trên bảng customers ,nếu điều kiện khách hàng  là  Nguyen Thi Uyen và số điện thoai là  0397695379  thì 'báo lỗi khách hàng nợ tiền ,không bán'và  hủy sự kiện
 create  trigger Trigger_A1 on CUSTOMERS
  for INSERT
  as
  begin
     
 

  if exists (select MaKH  from Inserted
   where   Phone = '0397695379' and HoTen = 'Nguyen Thi Uyen')
    begin
        rollback transaction
	    print N'khách hàng nợ tiền ,không bán'
	 end
   else print N'thành công'





  

 
  
  end

  INSERT INTO CUSTOMERS (MaKH,HoTen,Email,Phone,DiaChi)
VALUES ('KH006','Nguyen Thi Uyen','uyenn@gmail.com','0397695379','Da Nang')
-- không thành công
  INSERT INTO CUSTOMERS (MaKH,HoTen,Email,Phone,DiaChi)
VALUES ('KH006','Nguyen Thi Lan','uyenn@gmail.com','0397695379','Da Nang')

--Cho sự kiện cập nhật nhiều bản ghi trên bảng ORDER_DETAIL, số lượng phải lớn hơn 0, số lượng phải thoả mãn số lượng còn cho mặt hàng đó, cập nhật tăng giảm tương ứng số lượng còn trong bảng PRODUCTS.
alter  trigger Trigger_A22 on ORDER_DETAIL
  for update
  as
  begin
 


  if exists (select MaDH,SLuongSPM  from Inserted
   where  MaDH not  in (select MaDH  from ORDERS ) or SLuongSPM <= 0 or  SLuongSPM  > (select SoLuong from  PRODUCTS where PRODUCTS.MaSP = Inserted.MaSP))
    begin
	    
        rollback transaction
	    print N'thất bại'
	 end
	   else 
   begin 
    
	

	   update PRODUCTS
	   set SoLuong = SoLuong - (select SLuongSPM from inserted where MaSP = PRODUCTS.MaSP) +  (select SLuongSPM from deleted  where MaSP = PRODUCTS.MaSP)
	   from  PRODUCTS inner join inserted on PRODUCTS.MaSP = inserted.MaSP
	  

   end
 
     
  end

  select * from PRODUCTS
  select * from ORDER_DETAIL
  select * from ORDERS
update  ORDER_DETAIL 
set  SLuongSPM = 10
where MaDH = 'DH004' and MaSP = 'SP001'




CREATE EVENT IF NOT EXISTS test_event_01
ON SCHEDULE AT CURRENT_TIMESTAMP
DO
INSERT INTO customers (MaKH,HoTen,Email,Phone,DiaChi)
VALUES ('KH001','Tran Thi Thuy','thuy@gmail.com','0394758299','Da Nang')




