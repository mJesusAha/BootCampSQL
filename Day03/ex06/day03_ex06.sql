with pizzerias as (
	select pizzeria.name as pizzeria_name, 
		pizzeria.id as pizzeria_id, 
		pizza_name, 
		price
	from menu
	join pizzeria
	on pizzeria.id = menu.pizzeria_id
	)
select pizzerias_1.pizza_name,
	pizzerias_1.pizzeria_name as pizzeria_name_1, 
	pizzerias.pizzeria_name as pizzeria_name_2,
	pizzerias_1.price
from pizzerias as pizzerias_1
join pizzerias
	on pizzerias_1.price = pizzerias.price 
		and 
		pizzerias_1.pizza_name = pizzerias.pizza_name
where pizzerias_1.pizzeria_id != pizzerias.pizzeria_id 
	and 
	pizzerias_1.pizzeria_id > pizzerias.pizzeria_id
order by pizzerias_1.pizza_name
