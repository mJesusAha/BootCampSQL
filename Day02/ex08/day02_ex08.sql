with names as (select id, name
from person
where gender = 'male' and (address = 'Moscow' or address = 'Samara'))

select names.name
from person_order
join menu
on menu.id = person_order.menu_id
join names 
on names.id = person_order.person_id
where pizza_name  = 'pepperoni pizza' or pizza_name = 'mushroom pizza'
order by names.name desc 