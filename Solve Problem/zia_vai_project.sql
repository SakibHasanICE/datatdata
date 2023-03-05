create table student(

Std_id int not null primary key,
Std_name varchar(10)
)
 select *from student
 insert into student(Std_id,Std_name) values(1236,'tofail')
 
create table chairman(

Std_id int not null primary key,
chair_approve varchar(10)
)
select * from chairman
create table hall(

Std_id int not null primary key,
hall_approve varchar(10)
)
 select *from hall
 create table hall(
update chairman set char_approve='approved' where Std_id=1235
Std_id int not null primary key,
hall_approve text
)
  select *from hall
 
 
 
 Create TRIGGER insert_update ON student FOR INSERT
AS
BEGIN
DECLARE @Std_id int
SELECT @Std_id=Std_id  FROM INSERTED
insert into chairman(Std_id,chair_approve) values(@Std_id,'n approve')
insert into hall(Std_id,hall_approve) values(@Std_id,'n approve')

END
select Std_id from hello where char_approve='tofail' 
drop trigger insert_update
drop table student
select chairman.Std_id from hall,chairman