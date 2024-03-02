with vis as (
	(select person_visits.pizzeria_id
	from person_visits
	join person
		on person.id  = person_visits.person_id
	where person.name  = 'Andrey')
			except 
	(select distinct pizzeria_id
	from person_order
	join person
		on person.id  = person_order.person_id
	join menu
		on menu.id= person_order.menu_id 
	where person.name = 'Andrey')
	)
select pizzeria.name as pizzeria_name
	from vis 
	join pizzeria
		on pizzeria.id = vis.pizzeria_id
