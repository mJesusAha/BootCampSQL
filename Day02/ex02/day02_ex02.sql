select  
		(
		--if (person.name is null, '-', person.name)
		case
        when person.name is Null 
        then '-'
        else person.name
        end
           ) as person_name,
       visit_date,
       (case
        when pizzeria.name is Null 
        then '-'
        else pizzeria.name
        end 
        	) as pizzeria_name
from person
full join (select *
           from person_visits
           where person_visits.visit_date = '2022-01-01'::date
              or person_visits.visit_date = '2022-01-02'::date
              or person_visits.visit_date = '2022-01-03'::date) as dates
on person.id = dates.person_id
full  join  pizzeria
on dates.pizzeria_id = pizzeria.id
order by person_name, visit_date, pizzeria_name