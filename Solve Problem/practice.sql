use master
use pubs
select * from titles
select * from titleauthor
select * from sir
insert into sir values ('98','khan','56') 
alter sir add email
update sir set id='125' where id='123'
select * from titles
select price  from titles order by  asc
SELECT price FROM titles WHERE price=select(max(price) ORDER by price ASC;
select titles.title_id from titles where royalty in(select avg(royalty) from titles)
select  (au_fname +' '+au_lname) as author_name  from authors
  join titleauthor on titleauthor.au_id= authors.au_id join titles on  (titleauthor.title_id=titles.title_id)
 where (royalty in(select avg(royalty ) from titles))


select au_lname from authors where au_id in (select au_id from titleauthor where titleauthor.au_id= authors.au_id)

select * from sysobjects
create proc sp_showTitleAuthor
As
BEgin 
Select "Authors list name"=au_lname from authors where au_id in (select au_id from titleauthor where title_id='BU1032')
end 
EXEC sp_showTitleAuthor
