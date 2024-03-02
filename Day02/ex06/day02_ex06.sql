with orders as (select name, menu_id from person_order
join person 
on person.id = person_id
where person.name = 'Anna' or person.name ='Denis')


select pizza_name, pizzeria.name as pizzeria_name
from menu
join pizzeria
on pizzeria.id = pizzeria_id
join orders 
on orders.menu_id = menu.id
order by pizza_name, pizzeria_name