Use assignment_1;

/********************* Start-Q1 ***********************/
CREATE TABLE STUDENT(              
Student_ID  INT NOT NULL,            
First_Name  Varchar(50) NOT NULL,    
Last_Name   Varchar(50) NOT NULL,
Birth_date  DATE NOT NULL,
Street_Name Varchar(100) NOT NULL,
City        Varchar (35) NOT NULL,
ZipCode     Varchar (10) NOT NULL,
PRIMARY KEY (Student_ID));
/********************* End-Q1 *************************/



/********************* Start-Q2 ***********************/
Alter Table Student add column Program Varchar(30);
/********************* End---Q2 *************************/


/********************* Start-Q3 ***********************/
Insert into Student values(1, 'Niveditha', 'Shanbhag', '1995-08-11', 'Snails Lane', 'North Greenkarta', '95051', 'M.S. Information Systems');
Insert into Student values(2, 'Sneha', 'Guduru', '1992-07-13', 'Stowe Drive', 'Stoneford', '95053', 'M.S. Finance and Analytics');
Insert into Student values(3, 'Tanu', 'Sharma Goel', '1990-06-01', 'Stocks Loke', 'Bayton', '95056', 'M.S. Online Marketing');
Insert into Student values(4, 'Jennifer', 'Winget', '1998-12-23', 'Schofield Drive', 'Princebury', '95059', 'MBA');
Insert into Student values(5, 'Manasvini', 'Hothur', '1999-10-25', 'Sea View Brae', 'Capbrough', '96078', 'M.S. Business Analytics');
/********************* End---Q3 *************************/


/********************* Start-Q4 ***********************/
Update Student
set Street_Name ='Granada Avenue' , city='Santa Clara' , ZipCode='95053'
where Student_ID=1;
/********************* End---Q4 *************************/


/********************* Start-Q5 ***********************/
Delete FROM Student where Student_ID= 4;
/********************* End---Q5 *************************/



/********************* Start-Q6 ***********************/
Create Table Courses(
Course_ID varchar(8) NOT NULL,
Student_ID INT,
Course_Name varchar(100),
Units INT,
PRIMARY KEY (Course_ID),
FOREIGN KEY(Student_ID) references Student(Student_ID)
);
/********************* End---Q6 *************************/


/********************* Start-Q7 ***********************/
Insert into Courses values('MNGT1003', 3, 'Business and Management Analytics', 4);
Insert into Courses values('GENG1003', 1, 'Data Analytics and Python Programming', 2);
Insert into Courses values('ACGT2008', 2, 'Financial and Accounting', 2);
Insert into Courses values ('INFT1001', 5, 'Foundations of Business fundamentals', 3);
/********************* End---Q7 *************************/


/********************* Start-Q8 ***********************/
Insert into Courses values ('INFT1003', 4, 'Foundations of Procedural Programming', 3);
/********************* End---Q8 ***********************/


/********************* Start-Q9 ***********************/
Delete from Student where student_id=2;
/********************* End---Q9 ***********************/


/********************* Start-Q10 *********************/
Alter table courses drop foreign key courses_ibfk_1;
Alter table courses drop primary key;
Alter table courses add (foreign key (Student_ID) references Student (Student_ID) ON DELETE CASCADE);
Delete from Student where student_id=2;

/********************* End --Q10 *********************/


#To query out results on Student Table
/** Select * from Student **/ 
#To query out results on Courses Table
/**Select * from Courses **/

	