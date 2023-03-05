
use master
--problem 1
create database library_assingment
use library_assingment
create table Books(
	BookId char(6)primary key check(BookId like('[B][0-9][0-9][0-9][0-9][0-9]')),
	Title varchar(50)not null,
	Author varchar(50)not null,
	Publisher varchar(50),
	Category char(4)check(Category like'Tech'or Category like'Busi'or Category like'Arts'),
	Price money check(Price>=0),
	NoOfBookInHand int check(NoOfBookInHand>=0)
)

insert into Books values('B11111','Thinking in JAVA','Paul Deitel','Welly','Tech', 300, 2)
insert into Books values('B22245','Programming in C','Herbert Schild','Welly','Tech', 150, 4)
insert into Books values('B45678','Microprocessors Detais','Berry B Berry','Pearson','Tech', 350, 3)
insert into Books values('B89754','Probability in Statistics','Norendro mallik','','Busi', 100, 4)
insert into Books values('B85246','Engineering Cad',		'Someone','',		'Arts',  50, 5)

select * from books

create table Members(
	MemberID char(6)primary key check((MemberID like('S[0-9][0-9][0-9][0-9][0-9]'))or(MemberID like('T[0-9][0-9][0-9][0-9][0-9]'))),
	FirstName varchar(50)not null,
	LastName varchar(50)not null,
	Address varchar(50),
	NoOfCurrentlyIssuedBooks int check(NoOfCurrentlyIssuedBooks>=0),
	IssueCeiling int check(IssueCeiling>=0)
)

insert into Members values('T12345','Tarun','Debnath','', 5,2)
insert into Members values('S12345','someone','Other Cast','Pabna', 65, 5)
insert into Members values('T54123','anyone','last name','kaliganj', 50, 2)
insert into Members values('T98745','Kamal','Hasan','Australia', 10,4)
insert into Members values('S74589','Rofiq','Uddin','Dhaka', 4, 1)


create table Transactions(
	TransactionID char(6)primary key check(TransactionID like('T[0-9][0-9][0-9][0-9][0-9]')),
	TransactionDate smalldatetime default getdate(),
	TransactionType char(1)check((TransactionType like('I'))or(TransactionType like('R'))),
	MemberId char(6)foreign key references Members(MemberID),
	BookId char(6)foreign key references Books(BookId)
)


insert into Transactions values('T12345','','I','T12345','B11111')
insert into Transactions values('T12414','','R','S12345','B45678')


---problem 2


create database Shop
use Shop

create table Product(
	ProductID char(6) primary key check(ProductID like('[A-Z][0-9][0-9][0-9][0-9][0-9]')),
	ProductName varchar(50)not null,
	Manufacturer varchar(50),
	Origin varchar(7)check((Origin like'Local')or(Origin like'Foreign')),
	Price money check(Price>=0),
	QuantityInHand int check(QuantityInHand>=0)
)


insert into Product values('C12345','Gigabyte motherbord','','Local',300,5)
insert into Product values('m12346','Asus Moniter','Asus','Foreign',200,8)
insert into Product values('P54321','3.07 GHz','Intel','Foreign', 100, 10)
insert into Product values('K54321','PS-2','Jetway','Local', 6, 100)
insert into Product values('M98560','USB','Logitec','Foreign', 3, 100)

 
create table Customers(
	CustomerID char(7)primary key check(CustomerID like('C[0-9][0-9][0-9][0-9][0-9][0-9]')),
	FirstName varchar(50)not null,
	LastName varchar(50),
	City varchar(50)default'Dhaka',
	TotalSaleQuantity int check(TotalSaleQuantity>=0)
)


insert into Customers values('c123456','Tarun','Debnath','', 2)
insert into Customers values('c458795','Raho','cast','Rajshahi', 45)
insert into Customers values('c128556','Karim','','Khulna', 5)
insert into Customers values('c593456','Rasedul','Islam','Dhaka', 3)
insert into Customers values('c973456','Musfiq','Rahim','Dhaka', 0)


create table Transactions(
	TransactionID char(6)primary key check((TransactionID like('T[0-9][0-9][0-9][0-9][0-9]'))),
	TransactionDate smallDateTime default getdate(),
	CustomerID char(7)foreign key references Customers(CustomerID),
	ProductID char(6)foreign key references Product(ProductID)
)

insert into Transactions values('t89764','','c128556','m12346')
insert into Transactions values('t12764','','c123456','M98560')
insert into Transactions values('t12475','','c458795','P54321')
select*from Transactions 

--problem 3
create database ToutorialService
use ToutorialService

create table Participants(
	ParticipantID char(6)primary key check(ParticipantID like'P[0-9][0-9][0-9][0-9][0-9]'),
	FirstName varchar(50)not null,
	LastName varchar(50),
	Address varchar(50)not null,
	Age int check(Age>=0),
	TotalCoursesRegistered int check(TotalCoursesRegistered>=0)
)

insert into Participants values('P12345','Tarun','Debnath','kaliganj', 24, 6)
insert into Participants values('P13345','Rahim','Talukder','kaliganj', 18, 2)
insert into Participants values('P14345','Karim','','Pabna', 30, 5)
insert into Participants values('P15345','Rafi','Islam','jessore', 24, 6)

create table Courses(
	CourseID char(4)check((CourseID like'T[0-9][0-9][0-9]')or(CourseID like'N[0-9][0-9][0-9]')),
	Title varchar(50)not null,
	Types varchar(8)check(Types in ('Tech','Non-Tech')),--like'Tech')or(Types like'Non-Tech')),
	TotalParticipant int check(TotalParticipant>=0),
	Fee money check(Fee>=0)
)
drop table courses

insert into Courses values('T123','Programming in C','Tech', 12, 0)
insert into Courses values('T113','Programming in Java','Tech', 12, 5000)
insert into Courses values('T124','Android programming','Tech', 12, 10000)
insert into Courses values('T125','Engineering Mathematics','Non-Tech', 12, 0)


create procedure q3
as
begin
select Category ,count(Price)as totalnumberofbooks,AVG(Price)as averageprice from Books group by Category 
end

exec  q3
drop procedure q3

--assignment 5

CREATE PROCEDURE q1
@n int
AS
BEGIN
	select Category ,count(Price)as totalnumberofbooks,AVG(Price)as averageprice from Books group by Category  having avg(Price)>= @n
end

exec q1 50







