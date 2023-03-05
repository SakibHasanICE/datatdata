select distinct T. name from instructor as T, instructor as S where T.salary > S.salary and S.dept_name = 'Comp. Sci.'
select * from item
select * from customerandsuppliers
select item_price from item
select  distinct T.item_price from item as T, item 
as S where T.item_price > S.item_price and S.item_catagory = 'laptop'
