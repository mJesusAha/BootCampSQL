select person.name, 
		menu.pizza_name,
		menu.price,
		menu.price - (menu.price/100 * person_discounts.discount) as discount_price,
		pizzeria.name as pizzeria_name
from person_order
join person on person.id = person_order.person_id
join menu on menu.id  = person_order.menu_id 
join pizzeria on pizzeria.id = menu.pizzeria_id
join person_discounts on person_discounts.person_id = person_order.person_id and person_discounts.pizzeria_id = menu.pizzeria_id 
order by person.name, menu.pizza_name