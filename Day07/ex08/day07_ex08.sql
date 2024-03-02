select address, pizzeria.name, count(person_order.id) as count_of_orders	
from person_order
join person 
	on person.id = person_order.person_id 
join menu 
	on menu.id = person_order.menu_id 
join pizzeria 
	on pizzeria.id = menu.pizzeria_id
group by address, pizzeria.name
order by 1, 2