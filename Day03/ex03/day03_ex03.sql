with all_o as(((select person_visits.pizzeria_id
from person_visits
join person
on person.id  = person_visits.person_id

where person.gender  = 'male')
except all 
(select person_visits.pizzeria_id
from person_visits
join person
on person.id  = person_visits.person_id

where person.gender  = 'female'))
union all
((select person_visits.pizzeria_id
from person_visits
join person
on person.id  = person_visits.person_id

where person.gender  = 'female')
except all 
(select person_visits.pizzeria_id
from person_visits
join person
on person.id  = person_visits.person_id

where person.gender  = 'male')))
select distinct name as pizzeria_name
from all_o
join pizzeria on pizzeria.id = all_o.pizzeria_id
order by name