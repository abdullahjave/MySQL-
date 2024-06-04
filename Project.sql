create database Library_Managment ;
use Library_Managment;

drop database library_managment;
Create Table Book_DB
(
 Book_ID int primary key ,
 Book_Name  varchar(20) unique,
 Catagory_ID int, 
 Catagory_Name varchar(20),
 Author varchar(20),
 Publisher varchar(20),
 Eddition_No int NOT null,
 Eddition_Year year , 
 Shelf_No int not null,
 Supplier_name varchar(20),
 Delivary_Time timestamp default now() 
);

insert into Book_DB values (1,"Ghazal", 43 , "Qol" , "Hamza" , "Bajd" , 8 , 2002 , 32 , "Fakhar", default);
insert into Book_DB values (2,"Poetry", 55 , "ABC" , "John" , "Smith" , 5 , 2005 , 45 , "Jane", default);
insert into Book_DB values (3,"Novel", 30 , "XYZ" , "Alice" , "Wonderland" , 12 , 2010 , 60 , "Bob", default);
insert into Book_DB values (4,"Fiction", 28 , "PQR" , "Mark" , "Twain" , 10 , 2008 , 55 , "Emily", default);
insert into Book_DB values (5,"Science", 67 , "JKL" , "Stephen" , "Hawking" , 15 , 2001 , 80 , "Marie", default);
insert into Book_DB values (6,"Fantasy", 49 , "MNO" , "J.R.R." , "Tolkien" , 20 , 1998 , 70 , "George", default);
insert into Book_DB values (7,"Biography", 38 , "RST" , "Steve" , "Jobs" , 25 , 2015 , 50 , "Samantha", default);
insert into Book_DB values (8,"History", 62 , "EFG" , "Winston" , "Churchill" , 30 , 1995 , 90 , "Michael", default);
insert into Book_DB values (9,"Thriller", 41 , "UVW" , "Agatha" , "Christie" , 18 , 2006 , 75 , "David", default);
insert into Book_DB values (10,"Horror", 35 , "HIJ" , "Stephen" , "King" , 22 , 2019 , 85 , "Rebecca", default);


-- Group Functions 
select Min(Eddition_year) from Book_DB Where Book_ID < 3 ; 
select Max(Eddition_year) from Book_DB Where Book_ID > 3 ;
select Avg(Eddition_year) from Book_DB Where Book_ID < 3 ; 
select sum(Eddition_year) from Book_DB Where Book_ID < 3 ;  

-- Order By Clause 

Select * 
from Book_DB 
order by Catagory_ID desc ; 
-- limit 3;

-- Group By Clause 
CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    SName VARCHAR(100),
    Age INT,
    City VARCHAR(100)
);

INSERT INTO Student (StudentID, SName, Age, City)
VALUES
    (1, 'Alice Smith', 20, 'New York'),
    (2, 'Bob Johnson', 22, 'Los Angeles'),
    (3, 'Charlie Brown', 21, 'New York'),
    (4, 'David Wilson', 23, 'Chicago'),
    (5, 'Eva Davis', 22, 'Los Angeles'),
    (6, 'Frank Miller', 24, 'Chicago'),
    (7, 'Grace Lee', 20, 'San Francisco'),
    (8, 'Hannah Clark', 21, 'San Francisco');

Select City ,SName, Count(SName)
from Student group by City, SName ;

-- Using All in Single 
Select Max(Shelf_No) , Min(Shelf_No) , Avg(Shelf_No) , Sum(Shelf_No) 
from Book_DB 
Where Supplier_Name like('_a%');

-- Using Count 
select Count(Book_ID) from Book_DB Where Supplier_Name like('_a%'); 

select * from Book_DB;

Select Book_ID , Book_Name , Shelf_No 
from Book_DB
where Book_ID > 3;

Select Book_ID , Book_Name , Shelf_No 
fROM Book_DB
where Shelf_No between 40 and 52 ; 

select Book_ID , Book_Name , Shelf_No 
from Book_DB
where Book_Name Like '%a%';

SELECT Book_ID , Book_Name , Shelf_No 
FROM   Book_DB
WHERE  Book_Name NOT IN ('Ghazal', 'Poetry', 'Novel');

 DELETE FROM Book_DB 
 where  Catagory_ID = 40 ;

CREATE TABLE Member_DB 
(
    MID INT PRIMARY KEY,
    M_Date DATETIME DEFAULT CURRENT_TIMESTAMP,
    M_Name VARCHAR(20) NOT NULL,
    M_contact BIGINT NOT NULL,
    M_Email VARCHAR(50), 
    M_NIC bigint, 
    Membership_period INT,
    M_Expirydate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Book_ID int,
    constraint Book_ID_Fk foreign key (Book_ID) references Book_DB(Book_ID)
);

--  Drop Table Book_DB;

INSERT INTO Member_DB VALUES (2, default,"Ali", 923012345678, "ali@example.com", 1234567890123, 2 ,default, 1);
INSERT INTO Member_DB VALUES (3, default, 'Sana', 923334567890, 'sana@example.com', '2345678901234', 1,default,4);
INSERT INTO Member_DB VALUES (4, default,'Ahmed', 923454321098, 'ahmed@example.com', '3456789012345', 3,default,5);
INSERT INTO Member_DB VALUES (5, default, 'Fatima', 923045678901, 'fatima@example.com', '4567890123456', 2,default,3);
INSERT INTO Member_DB VALUES (6, default,'Imran', 923012345678, 'imran@example.com', '5678901234567', 1,default,2);
INSERT INTO Member_DB VALUES (7, default, 'Ayesha', 923334567890, 'ayesha@example.com', '6789012345678', 2,default,6);
INSERT INTO Member_DB VALUES (8, default,'Usman', 923454321098, 'usman@example.com', '7890123456789', 3,default,8);
INSERT INTO Member_DB VALUES (9, default,'Sadia', 923045678901, 'sadia@example.com', '8901234567890', 1,default,7);
INSERT INTO Member_DB VALUES (10, default,'Bilal', 923012345678, 'bilal@example.com', '9012345678901', 2,default,9);
INSERT INTO Member_DB VALUES (11, default,'Hira', 923334567890, 'hira@example.com', '0123456789012', 3,default,10);

select * from Member_DB;

-- Insert into Member_DB(MID , M_Name)
-- select Book_ID , Book_Name  from Book_DB;

CREATE TABLE Staff_DB
 (
    StaffID INT AUTO_INCREMENT PRIMARY KEY,
    AppyDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Staff_name VARCHAR(20) NOT NULL,
    Title VARCHAR(20),
    Contact_No VARCHAR(25) NOT NULL,
    Email VARCHAR(50) UNIQUE NOT NULL,
    CNIC VARCHAR(20) UNIQUE NOT NULL,
    Country VARCHAR(20) NOT NULL,
    Salary int NOT NULL,
    Book_ID int,
    foreign key (Book_ID) references Book_DB(Book_ID)
    
);

-- drop table Staff_DB;
insert into Staff_DB values (1, default , "Salman" , "Malik" , 039293 , "salman@gmail.com" , 734712461278 , "Pakisatn" , 16000,2);
INSERT INTO Staff_DB VALUES (2, DEFAULT, "Ayesha", "Ali", 049384, "ayesha@gmail.com", 823412461279, "Pakistan", 18000,3);
INSERT INTO Staff_DB VALUES (3, DEFAULT, "Ahmed", "Khan", 053839, "ahmed@gmail.com", 634512461280, "Pakistan",  17500,4);
INSERT INTO Staff_DB VALUES (4, DEFAULT, "Sara", "Rehman", 063920, "sara@gmail.com", 734512461281, "Pakistan",  15000,6);
INSERT INTO Staff_DB VALUES (5, DEFAULT, "Bilal", "Saeed", 073928, "bilal@gmail.com", 934512461282, "Pakistan",  19000,5);
INSERT INTO Staff_DB VALUES (6, DEFAULT, "Nadia", "Hussain", 083927, "nadia@gmail.com", 034512461283, "Pakistan",  16500,9);


CREATE TABLE Supplier_DB (
    SID INT PRIMARY KEY AUTO_INCREMENT,      
    Supplier_Name VARCHAR(20) NOT NULL,     
    Contact_No VARCHAR(15) NOT NULL,         
    Email VARCHAR(50) UNIQUE,               
    Address VARCHAR(200)                     
);


INSERT INTO Supplier_DB(Supplier_Name , Contact_No , Email , Address) VALUES ( 'Hamza', '01213131', 'Hamza@gmail.com', 'New City');
INSERT INTO Supplier_DB(Supplier_Name , Contact_No , Email , Address)  VALUES ( 'Aisha', '01456564', 'Aisha@gmail.com', 'Old Town');
INSERT INTO Supplier_DB(Supplier_Name , Contact_No , Email , Address) VALUES ( 'Omar', '01789323', 'Omar@gmail.com', 'Green Village');
INSERT INTO Supplier_DB(Supplier_Name , Contact_No , Email , Address) VALUES ( 'Layla', '01987456', 'Layla@gmail.com', 'Blue Hills');
INSERT INTO Supplier_DB(Supplier_Name , Contact_No , Email , Address)  VALUES ( 'Zain', '01123456', 'Zain@gmail.com', 'Red Valley');
INSERT INTO Supplier_DB(Supplier_Name , Contact_No , Email , Address) VALUES ( 'Fatima', '01678901', 'Fatima@gmail.com', 'Sunrise City');

-- Drop table Supplier_DB;
Alter table Supplier_DB 
add Cnic varchar(50);

Alter table Supplier_DB 
add Book_DB int ; 

alter Table Supplier_DB drop column Cnic ;
Alter Table Supplier_DB
Add constraint Book_DB_FK foreign key (Book_DB) references Book_DB(Book_ID);

update Supplier_DB set cnic="262323762" where SID = 1;
update Supplier_DB set cnic="262343762" where SID = 2;
update Supplier_DB set cnic="263123762" where SID = 3;
update Supplier_DB set cnic="26323162" where SID = 4;
update Supplier_DB set cnic="213323762" where SID = 5;
update Supplier_DB set cnic="265623762" where SID = 6;

select * from Supplier_DB;





-- -----------------------------------------------------------------------------------------------------------
-- select Book_Name , M_Name ,Eddition_Year 
-- from Book_DB , Member_DB 
-- where Book_DB.Book_ID = Member_DB.MID 
-- AND Eddition_Year > 2000;

-- -- JOINS IN SQL

-- select * from Book_DB 
-- inner join 
-- Member_DB 
-- ON Book_DB.Book_ID = Member_DB.MID; 


-- Select * from Book_DB , Member_DB Where Book_ID > 2 ;

--  Select * from Book_DB natural Join Member_DB;
--   
-- select * from Book_DB cross join Member_DB ;
--  Same as 
-- Select * from Book_DB , Memeber_DB;

 -- Left Join 
 select * 
 from Book_DB as b
 left join Member_DB as m 
 ON b.Book_ID = m.MID;
 
 -- Right Join 
 select * 
 from Book_DB as b
 right join Member_DB as m 
 ON b.Book_ID = m.MID;
 
-- Full Join 
select * 
from Book_DB as b
left join Member_DB as m 
ON b.Book_ID = m.MID
union
select *  
from Book_DB as b
right join Member_DB as m 
ON b.Book_ID = m.MID;


-- select * from Book_DB 
-- inner join 
-- Member_DB 
-- ON Book_DB.Book_ID = Member_DB.MID; 
--  Select * from Book_DB natural Join Member_DB;
--  
-- ------------------------------------------------------------------------------------------------------------------------

--  alter table Book_DB add (book_Prize int not null);
--  alter table Book_DB modify Shelf_No  varchar(4);
--  alter table Book_DB drop column book_Prize;
--  alter table Book_DB drop column Author;

--  -- COMMAND FOR SELESCTING sPECIFIC COLUME RECORD 
-- SELECT MID , M_Name , M_NIC FROM Member_DB;

--  -- Using Where Clause Appling Condiction from Selection
-- select * from Book_DB where  Catagory_ID >10;

-- SELETCING AND VEIW ALL DATA OF TABLE  
-- -- select * from Book_DB;

-- Appling Limit on Selection 
-- select * from student limit 3;

-- DROPPING ANY TABLE AND DATABASE 
--  drop database library_managment ;
--   drop table Book_DB


-- Command for Showing Table Data .
-- -- desc Book_DB;

-- Command for Inserting values in Table Varibale  
-- -- insert into Book_DB values(1, "Ghazal", 43 , "Qol" , "Hamza" , "Bajd" , 8 , 2002 , 32 , "Fakhar");