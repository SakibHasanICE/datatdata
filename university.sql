---This database created by
---Roll : 180638
---Name : Joana HOssain Dip

---use master database
use master
drop database university
---create database university_180638
create database university

---use university_180638
use university

---create table department.This is the first table of the database university_180638.
---This table has three attributes with their data-type and a primary key.
create table department
(dept_name varchar (20),
building varchar (15),
budget numeric (12,2),
primary key (dept_name));

---Here we insert some values in the table department 
insert into department values ('Biology', 'Watson', 90000)
insert into department values ('Comp. Sci.', 'Taylor', 100000)
insert into department values ('Elec. Eng.', 'Taylor', 85000)
insert into department values ('Finance', 'Painter', 120000)
insert into department values ('History', 'Painter', 50000)
insert into department values ('Music', 'Packard', 80000)
insert into department values ('Physics', 'Watson', 70000)

---this is used for showing the table department
select * from department

---create table course.This is the second table of the database university_180638.
---This table has 4 attributes with their data-type,a primary key and a foreign key
create table course
(course_id varchar (7),
title varchar (50),
dept_name varchar (20),
credits numeric (2,0),
primary key (course_id),
foreign key (dept_name) references department);

---Here we insert some values in the 2nd table course.
insert into course values ('BIO-101', 'Intro. to Biology', 'Biology', 4)
insert into course values ('BIO-301', 'Genetics', 'Biology', 4)
insert into course values ('BIO-399', 'Computational Biology', 'Biology', 3)
insert into course values ('CS-101', 'Intro. to Computer Science', 'Comp. Sci.', 4)
insert into course values ('CS-190', 'Game Design', 'Comp. Sci.', 4)
insert into course values ('CS-315', 'Robotics', 'Comp. Sci.', 3)
insert into course values ('CS-319', 'Image Processing', 'Comp. Sci.', 3)
insert into course values ('CS-347', 'Database System Concepts', 'Comp. Sci.', 3)
insert into course values ('EE-181', 'Intro. to Digital Systems', 'Elec. Eng.', 3)
insert into course values ('FIN-201', 'Investment Banking', 'Finance', 3)
insert into course values ('HIS-351', 'World History', 'History', 3)
insert into course values ('MU-199', 'Music Video Production', 'Music', 3)
insert into course values ('PHY-101', 'Physical Principles', 'Physics', 4)

---This is used for showing the table course
select * from course

---create table instructor.This is the third table of this database.
---This table has 4 attributes with their data-type,a primary key and a foreign key
create table instructor
(ID varchar (5),
name varchar (20) not null,
dept_name varchar (20),
salary numeric (8,2),
primary key (ID),
foreign key (dept_name) references department);

---Here we insert some values in the table instructor.
insert into instructor values ('10101', 'Srinivasan', 'Comp. Sci.', 65000)
insert into instructor values ('12121', 'Wu', 'Finance', 90000)
insert into instructor values ('15151', 'Mozart', 'Music', 40000)
insert into instructor values ('22222', 'Einstein', 'Physics', 95000)
insert into instructor values ('32343', 'El Said', 'History', 60000)
insert into instructor values ('33456', 'Gold', 'Physics', 87000)
insert into instructor values ('45565', 'Katz', 'Comp. Sci.', 75000)
insert into instructor values ('58583', 'Califieri', 'History', 62000)
insert into instructor values ('76543', 'Singh', 'Finance', 80000)
insert into instructor values ('76766', 'Crick', 'Biology', 72000)
insert into instructor values ('83821', 'Brandt', 'Comp. Sci.', 92000)
insert into instructor values ('98345', 'Kim', 'Elec. Eng.', 80000)

---we used this for showing the table instructor.
select * from instructor


---create table section.This is the fourth table of the database university_180638
---This table has 7 attributes with their data-type,4 primary key and a foreign key
create table section
(course_id varchar (7),
sec_id varchar (8),
semester varchar (6),
year numeric (4,0),
building varchar (15),
room_number varchar (7),
time_slot_id varchar (4),
primary key (course_id, sec_id, semester, year),
foreign key (course_id) references course);

---Here we insert some values in the table section.
insert into section values ('BIO-101', '1', 'Summer', 2017, 'Painter', '514', 'B')
insert into section values ('BIO-301', '1', 'Summer', 2018, 'Painter', '514', 'A')
insert into section values ('CS-101', '1', 'Fall',2017, 'Packard', '101', 'H')
insert into section values ('CS-101', '1', 'Spring', 2018, 'Packard', '101', 'F')
insert into section values ('CS-190', '1', 'Spring', 2017, 'Taylor', '3128', 'E')
insert into section values ('CS-190', '2', 'Spring', 2017, 'Taylor', '3128', 'A')
insert into section values ('CS-315', '1', 'Spring', 2018, 'Watson', '120', 'D')
insert into section values ('CS-319', '1', 'Spring', 2018, 'Watson', '100', 'B')
insert into section values ('CS-319', '2', 'Spring', 2018, 'Taylor', '3128', 'C')
insert into section values ('CS-347', '1', 'Fall', 2017, 'Taylor', '3128', 'A')
insert into section values ('EE-181', '1', 'Spring', 2017, 'Taylor', '3128', 'C')
insert into section values ('FIN-201', '1', 'Spring', 2018, 'Packard', '101', 'B')
insert into section values ('HIS-351', '1', 'Spring', 2018, 'Painter', '514', 'C')
insert into section values ('MU-199', '1', 'Spring', 2018, 'Packard', '101', 'D')
insert into section values ('PHY-101', '1', 'Fall', 2017, 'Watson', '100', 'A')

---we used this for showing the table section
select * from section

---create table teaches.This is the fifth table of the database university_180638
---This table has 5 attributes with their data-type,5 primary key and 5 foreign key
create table teaches
(ID varchar (5),
course_id varchar (7),
sec_id varchar (8),
semester varchar (6),
year numeric (4,0),
primary key (ID, course_id, sec_id, semester, year),
foreign key (course_id, sec_id, semester, year) references section,
foreign key (ID) references instructor);

---Here we insert some values in the table teaches insert into teaches values ('10101', 'CS-101', '1', 'Fall', 2017)
insert into teaches values ('10101', 'CS-315', '1', 'Spring', 2018)
insert into teaches values ('10101', 'CS-347', '1', 'Fall', 2017)
insert into teaches values ('12121', 'FIN-201', '1', 'Spring', 2018)
insert into teaches values ('15151', 'MU-199', '1', 'Spring', 2018)
insert into teaches values ('22222', 'PHY-101', '1', 'Fall', 2017)
insert into teaches values ('32343', 'HIS-351', '1', 'Spring', 2018)
insert into teaches values ('45565', 'CS-101', '1', 'Spring', 2018)
insert into teaches values ('45565', 'CS-319', '1', 'Spring', 2018)
insert into teaches values ('76766', 'BIO-101', '1', 'Summer', 2017)
insert into teaches values ('76766', 'BIO-301', '1', 'Summer', 2018)
insert into teaches values ('83821', 'CS-190', '1', 'Spring', 2017)
insert into teaches values ('83821', 'CS-190', '2', 'Spring', 2017)
insert into teaches values ('83821', 'CS-319', '2', 'Spring', 2018)
insert into teaches values ('98345', 'EE-181', '1', 'Spring', 2017)


---we used this for showing the table teaches.
select * from teaches
--create student table
create table student
(ID varchar (5)primary key,
name varchar (15),
dept_name varchar (20),
tot_cred int,
foreign key (dept_name) references department);
----insert value into student table
insert into student values('00128','Zhang', 'Comp. Sci.', 102),
('12345', 'Shankar', 'Comp. Sci.', 32),
('19991', 'Brandt','History', 80),
('23121','Chavez','Finance', 110),
('44553','Peltier','Physics', 56),
('45678','Levy','Physics', 46),
('54321','Williams','Comp. Sci.', 54),
('55739','Sanchez','Music', 38),
('70557','Snow','Physics', 0),
('76543','Brown','Comp. Sci.', 58),
('76653','Aoi','Elec. Eng.', 60),
('98765','Bourikas','Elec. Eng.', 98),
('98988',' Tanaka','Biology', 120);
select *from student

--create table takes
create table takes(
ID varchar (5),
course_id varchar (7),
sec_id varchar (8),
semester varchar (6),
year numeric (4,0),
grade varchar(3),
foreign key (course_id) references course
);
drop table takes
---insert value into takes table
insert into takes values

('00128','CS-101','1','Fall', 2017,'A'),
('00128','CS-347','1','Fall', 2017, 'A-'),
('12345','CS-101','1','Fall', 2017, 'C'),
('12345','CS-190','2','Spring', 2017, 'A'),
('12345','CS-315','1','Spring',2018, 'A'),
('12345','CS-347','1','Fall',2017, 'A'),
('19991','HIS-351','1','Spring', 2018 ,'B'),
('23121','FIN-201','1','Spring', 2018, 'C+'),
('44553','PHY-101','1','Fall', 2017 ,'B-'),
('45678','CS-101','1','Fall', 2017, 'F'),
('45678','CS-101','1','Spring', 2018 ,'B+'),
('45678','CS-319','1','Spring', 2018 ,'B'),
('54321','CS-101','1','Fall', 2017 ,'A-'),
('54321','CS-190','2','Spring', 2017 ,'B+'),
('55739','MU-199','1','Spring', 2018 ,'A-'),
('76543','CS-101','1','Fall', 2017, 'A'),
('76543','CS-319','2','Spring', 2018, 'A'),
('76653','EE-181','1','Spring', 2017, 'C'),
('98765','CS-101','1','Fall', 2017 ,'C-'),
('98765','CS-315','1','Spring', 2018, 'B'),
('98988','BIO-101','1','Summer', 2017, 'A');
insert into takes(ID,course_id,sec_id,semester,year) values('98988', 'BIO-301', '1', 'Summer', 2018)

--show takes table
select *  from takes