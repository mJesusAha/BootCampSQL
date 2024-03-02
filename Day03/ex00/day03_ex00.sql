select menu.pizza_name, menu.price, pizzeria.name as pizzeria_name, person_visits.visit_date 
from menu
join person_visits
on person_visits.pizzeria_id = menu.pizzeria_id
join person
on person.id = person_visits.person_id 
join pizzeria
on pizzeria.id = menu.pizzeria_id 
where person.name = 'Kate' and (price >=800 and price<=1000) 
order by pizza_name
