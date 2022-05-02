CREATE DATABASE University;
USE University



 /*
 TABLE Constructs Draf

 1.)
 --**Student Table(ENTITY)
	--Student_ID PRIMARY KEY
	--Student_First_name
	--Student_Last_Name
	--Registration_date
	--Region_ID (FOREIGN KEY)
	--Staff_ID (FOREIGN KEY -- counselor - tutor e?le?tirmesi yapaca??z)*/

	
	CREATE  TABLE Region
	(Region_ID INT PRIMARY KEY,
	Region_Name VARCHAR(255));


	INSERT Region (RegionName)
    VALUES('England'), ('Scotland'), ('Wales'), ('Northern Ireland');

	CREATE TABLE Staff
	(Staff_ID INT PRIMARY KEY,
	Staff_first_name VARCHAR(255),
	Staff_last_name VARCHAR(255),
	Region_ID INT ,
	FOREIGN KEY (Region_ID) REFERENCES Region(Region_ID));	

	INSERT Staff (StaffFirstName, StaffLastName, RegionID)
   VALUES ('Selim', 'Aydin',  1),
   ('Semil', 'Acik', 1),
   ('Gungor', 'Salih', 1),
   ('Gulsum', 'Cicekci', 2),
  ('Hatice', 'Dogan', 2)
	
	
	
	CREATE TABLE Student
	( Student_ID INT  NOT NULL IDENTITY(1,1) PRIMARY KEY,
	Student_First_name VARCHAR(255)  ,
	Student_Last_Name VARCHAR(255),
	Registration_date DATE NOT NULL,
	Region_ID INT  NOT NULL,
	Staff_ID INT NOT NULL,
	FOREIGN KEY (Region_ID) REFERENCES Region(Region_ID),
    FOREIGN KEY (Staff_ID) REFERENCES Staff(Staff_ID));


	INSERT INTO Student (StudentFirstName, StudentLastName, StaffID, RegionID)
VALUES('Ali', 'Guzel', 10, 1),
('Osman', 'Yucel', 11, 1),
('Omer','Ilhan', 12, 1),
('Bekir', 'Gul', 13, 2),
('Ahmet', 'Cicek', 14, 2);

	CREATE TABLE Enrollment
	(Student_ID INT NOT NULL PRIMARY KEY,
	Course_ID INT NOT NULL PRIMARY KEY,
	FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID),
	FOREIGN KEY (Course_ID) REFERENCES Course (Course_ID);


	CREATE TABLE Course 
	(Course_ID INT  PRIMARY KEY ,
	Course_title VARCHAR(255),
	Credit INT CHECK (Credit IN (15, 30)) NOT NULL);


INSERT Course (Title, Credit)
   VALUES ('Math', 30),
   ('Physics', 30),
('Chemistry', 30),
('English', 30),
('Biology', 15),
('Fine Arts', 15),
('German', 15),
('Music', 30),
('Psychology', 30);



	CREATE TABLE Staff_Course
   (Staff_ID INT NOT NULL PRIMARY KEY ,
	Course_ID INT NOT NULL PRIMARY KEY
	FOREIGN KEY (Staff_ID) REFERENCES Staff(Staff_ID)
	FOREIGN KEY (Course_ID) REFERENCES Course (Course_ID));


INSERT StaffCourse (StaffID, CourseID)
VALUES (10, 30),
(12, 30),
(10, 31),
(11, 31),
(12, 38)





2.)

---**Staff Table
	--Staff_ID (PRIMARY KEY)
	--Staff_first_name
	--Staff_last_name
	--Region_ID(FOREIGN KEY)


3.) Relation Tablosu: Region:

--**Region Table
	--Region_ID (PRIMARY KEY)
	--Region_Name


4.) Course Tablosu:

--**Course Table
	--Course_ID (PRIMARY KEY)
	--Course_title
	--Course_credit


5.) Staff_Course Tablosu: Relation 

--**Staff_Course
	--Staff_ID 
	--Course_ID

	Bunlar composite KEY olacak, tek ba?lar?na bir i?e yaram?yor tabloyu tan?mlamakta.
	Peki Staff_ID sütunu nereden al?nacak?
		--REFERENCE Staff tablosu
	Peki Course_ID sütunu nereden al?nacak?
		--REFERENCE Course tablosu
	(Bu composite key olu?turma query örne?i son ders notunda olmas? gerekiyor, bak!)



6.) ENROLLMENT tablosunun ayr? bir tablo olaca??n? instruction içerisinde anlam??t?k:

Bknz:  "A student is not required to enroll in any courses 
at registration; enrollment in a course can happen at a later time. "

--**Enrollment Tablosu:
	--Student_ID
	--Course_ID

	Yine composite key olu?turmam?z gerekiyor çünkü her iki sütunda enrolment tablosunu tek ba??na aç?klayam?yor.
	Peki Student_ID sütununu nereden alaca??m? 
		--REFERENCE Student tablosu olmal?
	Peki Couse_ID sütunu  nereden al?nmal??
		--REFERENCE Course tablosu olmal?.


***COMPOSITE KEY'e sahip olan tablolar RELATIONSHIP tablosu olacak mantiken bunu bilmek laz?m.

