with not_order as (select menu.id as menu_id
from menu
except
select person_order.menu_id 
from person_order)

select pizza_name, price, pizzeria."name" as pizzeria_name
from not_order
join menu
on menu.id = menu_id
join pizzeria
on pizzeria.id = menu.pizzeria_id  
order by pizza_name, price



