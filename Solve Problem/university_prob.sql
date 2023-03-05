use university
select  year  from instructor,teaches where instructor.ID='12121' 
select ID, name, salary/12 as k from instructor
select name from instructor where dept_name = 'Comp. Sci.' or salary > 80000
select name, course_id ,instructor.ID,teaches.ID from instructor, teaches where instructor.ID = teaches.ID

select section.course_id, semester, year, title,dept_name from section, course 
where section.course_id = course.course_id and dept_name = 'Comp. Sci.'

select name from instructor where name like '%san';
select * from instructor
select *  from teaches
select  course_id ,name,dept_name from instructor, teaches where (instructor.ID) = (teaches.ID) and dept_name='biology'

