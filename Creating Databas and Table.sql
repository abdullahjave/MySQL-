-- First of All We Must Need Database Where All Data is Stored , 
-- So Use the Given Below Command to Create Database 
  
CREATE DATABASE school;
USE school ;  					-- Must Run this Command Before Creation of Tables , 
 
-- Lets Create a Tables 

CREATE TABLE Student(
	Student_ID INT PRIMARY KEY ,    			-- Must Contain One Primary Key 
    Student_Name varchar(50) NOT NULL,
    CNIC VARCHAR(50) UNIQUE ,
    Phone_No VARCHAR(50) UNIQUE,
    Email VARCHAR(50),
    Address VARCHAR(100) 
);

-- You can also Create Multiple Tables 

CREATE TABLE Courses( 
	CID INT PRIMARY KEY,
    C_Name VARCHAR(50),
    C_Credit INT NOT NULL,
    C_Description VARCHAR(500),
    Student_ID INT , 
    CONSTRAINT Studnet_ID_fk FOREIGN KEY (Student_ID) references Student(Student_ID)  -- Syntax of Foreign Key   
); 
 
 

-- Drop Commands 
-- We can Drop or Delete the Database and Table Permenetly 

-- For Database  
DROP DATABASE school; 
 
-- For Table 
DROP TABLE Student ;
DROP TABLE Courses ;
 