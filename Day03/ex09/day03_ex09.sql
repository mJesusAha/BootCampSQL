insert into person_visits
values (
	--id
(select (max(person_visits.id)+1)
		from person_visits),
	--person_id
		(select id
		from person
		where name = 'Denis'),
	--pizzeria_id
		(select distinct person_visits.pizzeria_id
		from person_visits
		join pizzeria
		on pizzeria.id = person_visits.pizzeria_id
		where pizzeria.name = 'Dominos'
		), 
		--visit_date
		
		('2022-02-24'::date)),
		((select (max(person_visits.id)+2)
		from person_visits),
	--person_id
		(select id
		from person
		where name = 'Irina'),
	--pizzeria_id
		(select distinct person_visits.pizzeria_id
		from person_visits
		join pizzeria
		on pizzeria.id = person_visits.pizzeria_id
		where pizzeria.name = 'Dominos'
		), 
		--visit_date
		
		('2022-02-24'::date))