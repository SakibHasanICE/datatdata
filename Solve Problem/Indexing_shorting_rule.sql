use raj


create index hello on Student(Name);
create index hello2 on Student(Name,Father_name);
select * from Student
insert into Student values(7,'cbdul','kus','kal',20)

SELECT *
FROM Student WITH(INDEX(hello))