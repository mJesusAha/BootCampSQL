with fam as (
	select distinct pizzeria_id
	from person_order
	join person
	on person.id  = person_order.person_id
	join menu
	on menu.id= person_order.menu_id 
	where person.gender  = 'female'
	), 
men as (	
	select distinct pizzeria_id
	from person_order
	join person
	on person.id  = person_order.person_id
	join menu
	on menu.id= person_order.menu_id 
	where person.gender  = 'male'
	), 

only_one as (
	(select *
	from fam
		except
	select *
	from men)
		union 
	(select *
	from men
		except
	select *
	from fam)
	)
select pizzeria.name as pizzeria_name
from only_one
join pizzeria
on pizzeria.id = only_one.pizzeria_id
order by pizzeria.name