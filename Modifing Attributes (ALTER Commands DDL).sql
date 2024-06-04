-- When we Run the Table Query at once , we Can't modify , Change , add etc the Attributes in the Table 
-- There is a Command which is used to Operate Diffrent opertion on the Attributes in Tables 

CREATE DATABASE school_Task_2;
USE school_Task_2 ;  					

CREATE TABLE Student(
	Student_ID INT PRIMARY KEY ,    			
    Student_Name varchar(50) NOT NULL,
    CNIC VARCHAR(50) UNIQUE ,
    Phone_No VARCHAR(50) UNIQUE,
    Email VARCHAR(50),
    Address VARCHAR(100) 
);


CREATE TABLE Courses( 
	CID INT PRIMARY KEY,
    C_Name VARCHAR(50),
    C_Credit INT NOT NULL,
    C_Description VARCHAR(500)
); 

-- So we Want to add Father name Attributes in Table Student, Use 

ALTER TABLE Student ADD Father_Name VARCHAR(50) ; 

-- So we Want to Modify any Attributes Datatpes , Constraints  

ALTER TABLE Student MODIFY Email VARCHAR(100) NOT NULL ; 

-- So Dont need anymore Father name Attribute So DROP is used 

ALTER TABLE STUDENT DROP Father_Name ; 

-- We Can Also Set Forign key as same as Creation Time 

ALTER TABLE Courses ADD Student_ID INT ;
Alter TABLE Courses ADD CONSTRAINT Studnet_ID_fk FOREIGN KEY (Student_ID) references Student(Student_ID);

 -- Droping a Constraints of any Variable 
 
 ALTER TABLE Courses Drop constraint Studnet_ID_fk;
 
 
-- So Run this Command to Check all Data of Tables 

SELECT * FROM Courses ; 
 