set enable_seqscan =off;
select menu.pizza_name, pizzeria.name as pizzeria_name
from menu
join pizzeria
on pizzeria.id = menu.pizzeria_id; 

explain analyze 
select menu.pizza_name, pizzeria.name as pizzeria_name
from menu
join pizzeria
on pizzeria.id = menu.pizzeria_id 
