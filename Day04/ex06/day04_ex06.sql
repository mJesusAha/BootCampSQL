create materialized view mv_dmitriy_visits_and_eats as
select pizzeria.name as pizzeria_name
from person_visits
join pizzeria 
on pizzeria.id = pizzeria_id
join person
on person.id = person_id
join menu
on pizzeria.id = menu.pizzeria_id
where visit_date = '2022-01-08'::date and person.name = 'Dmitriy' and price <800