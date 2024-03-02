select pizza_name, pizzeria.name as pizzeria_name, price
from menu
full join pizzeria
on pizzeria.id = pizzeria_id
where pizza_name = 'pepperoni pizza' or pizza_name = 'mushroom pizza'
order by pizza_name, pizzeria.name