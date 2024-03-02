insert  into  person_visits 
values (
(select max(id) as id
from person_visits)+1,
------------name_id
        (select distinct person_id
from person_visits
join person
on person.id = person_visits.person_id 
where person.name = 'Dmitriy' ),
-------pizzeria_id
        (select min(pizzeria.id) from pizzeria 
join menu m 
on m.pizzeria_id  = pizzeria.id and m.price <800 and pizzeria.name <> 'Papa Johns'), '2022-01-08'::date);

REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;