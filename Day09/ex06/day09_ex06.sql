create or replace function fnc_person_visits_and_eats_on_date
							(in pperson varchar default 'Dmitriy',
    in pprice numeric default  500,
    in pdate date default '2022-01-08'::date)
returns table 
		(
		pizzeria_name varchar
		)
as
$$
begin
	return query
	 select  pizzeria.name as pizzeria_name
        FROM person_visits
                 join menu on menu.pizzeria_id = person_visits.pizzeria_id
                 join pizzeria on pizzeria.id = person_visits.pizzeria_id
                 join person on person.id = person_visits.person_id
        where person_visits.visit_date = pdate and menu.price < pprice and person.name = pperson;

end;
$$
language plpgsql;


select *
from fnc_person_visits_and_eats_on_date(pprice := 800);

select *
from fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');
