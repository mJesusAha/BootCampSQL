select order_date as action_date, (SELECT name
    	from person
    	where person.id = person_order.person_id
    	) AS person_name
from person_order 
INTERSECT
select visit_date as action_date, (SELECT name
    	from person
    	where person.id = person_visits.person_id
    	) AS person_name 
from person_visits
order by action_date, person_name desc