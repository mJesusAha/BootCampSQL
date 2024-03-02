insert into person_order
values (
	--id
(select (max(person_order.id)+1)
		from person_order),
	--person_id
		(select id
		from person
		where name = 'Denis'),
	--pizzeria_id
		(select menu.id
		from menu
		where pizza_name = 'sicilian pizza'
		), 
		--visit_date
		
		('2022-02-24'::date)),
		((select (max(person_order.id)+2)
		from person_order),
	--person_id
		(select id
		from person
		where name = 'Irina'),
	--pizzeria_id
		(select menu.id
		from menu
		where pizza_name = 'sicilian pizza'
		), 
		--visit_date
		
		('2022-02-24'::date))