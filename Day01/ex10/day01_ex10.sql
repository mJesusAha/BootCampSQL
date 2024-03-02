select person.name as person_name, 
		menu.pizza_name  as pizza_name, 
		pizzeria.name as pizzeria_name
from person_order
join person
on person.id = person_order.person_id
join menu
on menu_id = menu.id
join pizzeria
on menu.pizzeria_id  = pizzeria.id
order by person_name, pizza_name, pizzeria_name