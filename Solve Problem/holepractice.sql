create database practice
use practice
create table table1(

   tab1_id char (5) primary key check (tab1_id like '[p][0-9][0-9][0-9][0-9]'),
   tab1_fname char(15),
   tab1_lname char(12),
   tab1_address text,
   tab_city char(9) default 'rajshahi',
   tab1_price money  check (tab1_price>=0),
  tab1_time datetime default getdate()

           )
insert table1 --(tab1_id ,tab1_fname,tab1_lname, tab1_address,tab_city,tab1_price,tab1_time )
 values ('P0002','kal','march','nework','osington',100,'1-2-2015')
select * from table1

create table table2
(

tab2_id char (6) primary key check(tab2_id like '[S][0-9][0-9][0-9][0-9][0-9]'),
tab2_fname char (15),
tab2_address text,
tab2_city char(14)default 'kushtia',
tab2_price money check(tab2_price>=0), 
tab2_date datetime  default getdate()
)
insert table2 (tab2_id,tab2_fname,tab2_address,tab2_city,tab2_price,tab2_date)
  values('S00003','khasnx','monohardisa','kushtia',39,'2-2-2015')
select * from table2

----add column or drop column or change datatype
alter table table2 add  messag text
alter table table2 drop column messag
alter table table2 alter  column messag char(12)

create table table3
(
  tab3_id char (4) check(tab3_id like '[T][0-9][0-9][0-9]'),
  tab3_type char(1),
   tab3_amnt money check(tab3_amnt>=0),
  tab1_id char(5) foreign key references table1(tab1_id),
  tab2_id char(6)  foreign key references table2(tab2_id),
  tab3_date datetime default getdate()

)
insert table3(tab3_id,tab3_type,tab3_amnt,tab1_id,tab2_id,tab3_date)
  values('T002','O',30,'p0002','S00003','2-2-2012')

select * from table3


select avg(tab1_price) from table1 group by tab_city

create proc happy @price money,@id char(15)
as 
begin 
 declare @price_value money
  select @price_value=avg(tab1_price) from table1 where tab_city=@id
 
   while(@price_value<@price)
      begin
       update table1 set tab1_price=tab1_price*.10+tab1_price where tab_city=@id
       select @price_value=avg(tab1_price) from table1 where tab_city=@id
      end
end
drop proc happy
select avg(tab1_price) from table1 group by tab_city
select * from table1
exec happy 140,'osington'
use pubs
select * from authors
select  * from titleauthor
select * from titles
select  substring  (au_fname,1,1) +'.'+au_lname   from authors 
select "average price"=avg(price), "sum of price"=sum(price) from titles group by type
select au_lname from authors join titleauthor on authors.au_id=titleauthor.au_id join titles on titleauthor.title_id=titles.title_id where royalty=(select avg(royalty) from titles)
select * from item
select * from customerandsuppliers
select * from transactions


select * from table1
create trigger hello on table1 for insert 
as
begin 
update table1 set tab1_address='nework' where tab1_id='p0001'
end
drop trigger hello
delete  table1 where tab1_id='p0002'


create trigger nero on table3 for insert 
   as 
    begin 
    declare @texttype char(1),@tab2_id char(6)
    select @texttype=tab3_type,@tab2_id=tab2_id from inserted
    if(@texttype='S')
     update table2 set messag='one sold' where tab2_id=@tab2_id
    else 
     update table2 set messag='one not sold' where tab2_id=@tab2_id
   end 
    
drop trigger nero
use practice
 
create proc hero @data_id char(12)
as 
begin 
declare @price money
  select @price=tab1_price from table1 where tab1_id=@data_id 
  set @price=@price*.1+@price
     while(@price<200)
       begin
         update table1 set tab1_price=@price where tab1_id=@data_id 
          set @price=@price*.1+@price
        end
     --else 
   ---update table2 set tab2_price=@price where tab1_id=@data_id 
end
select * from authors
drop proc hero
exec hero 'p0002'
select * from titleauthor
use pubs
use store
select * from item
select "name"=substring(au_fname,1,1)+'.'+au_lname from authors
select * from item where item_name='tofail ah' and item_catagory='laptop'

select * from table1
select * from table2
select * from table3

alter trigger hello  on table3 for insert
as
begin
declare @tab1_id char(5),@tab2_id char(6),@tab3_type char(1),@tab3_amnt money 
select @tab1_id=tab1_id,@tab2_id=tab2_id,@tab3_type=tab3_type, @tab3_amnt=tab3_amnt from inserted

if(@tab3_type='S')

  begin

  update table1 set tab1_price=tab1_price+@tab3_amnt where tab1_id=@tab1_id
  update table2 set tab2_price=tab2_price+@tab3_amnt,messag='one sold' where tab2_id=@tab2_id
  end
else 
   begin

   update table1 set tab1_price=tab1_price-@tab3_amnt where tab1_id=@tab1_id
   update table2 set tab2_price=tab2_price-@tab3_amnt,messag='one include' where tab2_id=@tab2_id
   end
end

insert table3(tab3_id,tab3_type,tab3_amnt,tab1_id,tab2_id,tab3_date)
values('T005','p',10,'P0001','S00001','12-12-2015')

create trigger hello on table3 for insert 
as 
begin
select * from table3
end
drop trigger hello











