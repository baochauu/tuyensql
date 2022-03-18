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



-- Duy Thắng 

 -- Bài 1 : cho sự kiện thêm mới bản ghi trên bảng customers ,nếu điều kiện khách hàng  là  Nguyen Thi Uyen và số điện thoai là  0397695379  thì 'báo lỗi khách hàng nợ tiền ,không bán'và  hủy sự kiện
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
-- Bài 2 tạo event thêm khách hàng 
SET GLOBAL event_scheduler = ON;

CREATE EVENT IF NOT EXISTS test_event_01
ON SCHEDULE AT CURRENT_TIMESTAMP
DO
INSERT INTO customers (MaKH,HoTen,Email,Phone,DiaChi)
VALUES ('KH001','Tran Thi Thuy','thuy@gmail.com','0394758299','Da Nang')



-- Tuyển

-- Bài 3 Cho sự kiện cập nhật nhiều bản ghi trên bảng ORDER_DETAIL, số lượng phải lớn hơn 0, số lượng phải thoả mãn số lượng còn cho mặt hàng đó, cập nhật tăng giảm tương ứng số lượng còn trong bảng PRODUCTS.
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


--Bài 4  xóa các sản phẩm có tên sp là  'Banh my' và số lượng  nhỏ hơn 12
CREATE EVENT IF NOT EXISTS test_event_01
ON SCHEDULE AT CURRENT_TIMESTAMP
ON COMPLETION PRESERVE
DO


  delete from products
  where SoLuong < 12 and TenSP = 'Banh my'
  


 



--Văn Hùng: Kiem tra thong tin KH nhap vao da hop le hay chua? Email thi co '@'. SDT thi phai dung 10 chu so
CREATE TRIGGER check_KH
ON CUSTOMERS FOR INSERT
AS 
BEGIN
	DECLARE @email VARCHAR(50),  @phone VARCHAR(30)
	SELECT @email = i.Email FROM INSERTED AS i
	SELECT @phone = i.Phone FROM INSERTED AS i

	IF(@email NOT LIKE '%@%')
	BEGIN
		PRINT 'Email cua ban khong hop le'
		ROLLBACK TRAN
		RETURN
	END

	IF(LEN(@phone) <> 10 )
	BEGIN
	    PRINT 'So dien thoai cua ban khong hop le'
		ROLLBACK TRAN
		RETURN
	END
END

DROP TRIGGER check_KH


--cai nay vd sai cu phap email
INSERT INTO CUSTOMERS VALUES 
('KH007','Phan Van ABC','abc.gmail.com','0903131300','Da Nang')
--cai nay vd dung cu phap email
INSERT INTO CUSTOMERS VALUES 
('KH008','Phan Van Dung','dung@gmail.com','0903131313','Da Nang')
--cai nay vd sai cu phap sdt
INSERT INTO CUSTOMERS VALUES 
('KH009','Phan Van ABCD','abcd@gmail.com','090901010101','Da Nang')
--cai nay vd dung cu phap sdt
INSERT INTO CUSTOMERS VALUES 
('KH009','Phan Van ABCD','abcd@gmail.com','0909010101','Da Nang')

SELECT c.* FROM dbo.CUSTOMERS c


--Như thủy 
/* cập nhật hàng trong kho sau khi hủy đặt hàng */
create TRIGGER trg_HuyDatHang 
ON  ORDER_DETAIL
FOR DELETE AS 
BEGIN
	DECLARE @sl int, @masp nvarchar(10)
	SELECT @sl = SLuongSPM, @masp= MaSP FROM deleted
	UPDATE PRODUCTS SET SoLuong = SoLuong + @sl 
			where MaSP = @masp
END

select *from PRODUCTS where MaSP ='SP002'
delete ORDER_DETAIL where MaDH_detail= '001'
select *from PRODUCTS where MaSP ='SP002'
/* tạo event khuyến mãi giảm 25% tổng tiền trong bảng orders đối với các phương thức thanh toán ngoại trừ thanh toán khi nhân hàng */

CREATE EVENT Khuyenmai2 
ON SCHEDULE  AT CURRENT_TIMESTAMP + INTERVAL 1 minute
ON COMPLETION PRESERVE
DO
update ORDERS set TongTien = TongTien *0.75 
	where MaPTTT not in (select MaPTTT from PAYMENTSS where TenPTTT='Thanh toan khi nhan hang')

show events from sqlnc;
select *from ORDERS


-- thảo nguyên

--Trigger: Cho sự kiện thêm mới nhiều bản ghi trên bảng ORDER DETAIL, số lượng sản phẩm mua phải lớn hơn 0, 
--tính thành tiền bằng số lượng đặt/bán nhân với giá sản phẩm, mã đơn hàng phải có trong bảng ORDER, 
--cập nhật giảm tương ứng số lượng sản phẩm còn trong bảng PRODUCT.
CREATE TRIGGER Trigger_N
ON ORDER_DETAIL
FOR INSERT
AS
    BEGIN
        IF EXISTS (SELECT MaDH,SLuongSPM FROM Inserted WHERE  MADH NOT IN (SELECT MADH FROM ORDERS) OR SLuongSPM <= 0 )
            BEGIN
                ROLLBACK TRANSACTION
	            PRINT N'Không thành công'
	        END
        ELSE 
            BEGIN 
                SELECT MaDH,SoLuong,ThanhTien = SoLuong * GiaSP  FROM Inserted INNER JOIN PRODUCTS ON Inserted.MaSP = PRODUCTS.MaSP

	            UPDATE ORDER_DETAIL
	            SET ThanhTien = SLuongSPM * (SELECT GiaSP FROM PRODUCTS WHERE MaSP = ORDER_DETAIL.MaSP)
	            WHERE MaDH IN (  SELECT MaDH  FROM Inserted INNER JOIN PRODUCTS ON Inserted.MaSP =	PRODUCTS.MaSP) 
                PRINT N'Thành công'

	            UPDATE PRODUCTS
	            SET SoLuong = SoLuong - (SELECT SoLuong FROM Inserted WHERE MaSP = PRODUCTS.MaSP)
	            FROM PRODUCTS INNER JOIN Inserted ON PRODUCTS.MaSP = Inserted.MaSP
            END
    END
-- CHẠY 

SELECT * FROM ORDERS
SELECT * FROM PRODUCTS
SELECT * FROM ORDER_DETAIL

INSERT INTO ORDER_DETAIL
VALUES('005','DH005','SP002',120,450000)
INSERT INTO ORDER_DETAIL
VALUES ('006','DH006','SP001',50,30000)

--Event: Cập nhật giảm giá sản phẩm thực hiện sau thời gian 1 phút sau khi sự kiện được tạo.
CREATE EVENT event_giamgiasp
ON SCHEDULE AT CURRENT_TIMESTAMP + INTERVAL 1 MINUTE
ON COMPLETION PRESERVE
DO
   UPDATE products SET GiaSP = 1000 WHERE MaSP = 'SP002';

--
SHOW EVENTS FROM qlbanhang;
SELECT * FROM products

-- khánh lan
-- Tạo Trigger checkProduct: kiểm tra Mã sản phẩm, Giá sản phẩm, Số lượng sản phẩm trước khi nhập dữ liệu vào bảng PRODUCTS



CREATE TRIGGER checkProduct
ON PRODUCTS
FOR INSERT
AS 
BEGIN
	IF EXISTS (SELECT * FROM inserted WHERE GiaSP <= 0 OR SoLuong <= 0)
	BEGIN
		ROLLBACK
		PRINT 'Gia San Pham hoac So Luong khong xac dinh'
		RETURN
	END;

END

INSERT INTO PRODUCTS (MaSP,TenSP,MoTa,GiaSP,SoLuong)
VALUES ('SP005','Banh my','Banh my thit cha',-1,10)

INSERT INTO PRODUCTS (MaSP,TenSP,MoTa,GiaSP,SoLuong)
VALUES ('SP006','Banh my','Banh my thit cha',16000,-10)

INSERT INTO PRODUCTS (MaSP,TenSP,MoTa,GiaSP,SoLuong)
VALUES ('SP007','Coca cola','Chai',12000,100)
--Event:mỗi 5 giây giảm giá toàn bộ sản phẩm đi 50 d trong vòng 30 giây

CREATE EVENT discount
ON SCHEDULE EVERY 5 SECOND
STARTS CURRENT_TIMESTAMP
ENDS current_timestamp() + interval 30 second
do
	update products set GiaSP = GiaSP - 50;

   


-- Bảo Châu

--Tạo 1 trigger ngăn cập nhật khách hàng ở địa chỉ Đà Nẵng 
ALTER trigger tr_MaKhachHang on CUSTOMERS 
after update  
as
begin 
	if exists (select * from deleted where DiaChi = 'Da Nang')
	begin
		rollback
		print 'Khong the cap nhat thong tin cua khach hang o Da Nang'
		return
	end
end 

UPDATE CUSTOMERS set DiaChi = 'Quang Nam'
WHERE DiaChi = 'Nha Trang'

UPDATE CUSTOMERS set DiaChi = 'Quang Nam'
WHERE DiaChi = 'Da Nang'

--Event: thêm sản phẩm thực hiện sau thời gian 1 phút sau khi sự kiện được tạo.
CREATE EVENT event_themsp
ON SCHEDULE AT CURRENT_TIMESTAMP + INTERVAL 1 MINUTE
ON COMPLETION PRESERVE
DO

INSERT INTO PRODUCTS 
VALUES ('SP008','Banh my','Banh my trung',15000,10)









