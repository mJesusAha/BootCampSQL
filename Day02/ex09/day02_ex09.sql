with women_order as (select person.id, name, menu.pizza_name
from person
join person_order
on person_order.person_id = person.id
join menu 
on menu.id = person_order.menu_id
where gender = 'female' )
select name
from women_order
where pizza_name = 'cheese pizza'
intersect
select name
from women_order
where pizza_name = 'pepperoni pizza'
order by name 
