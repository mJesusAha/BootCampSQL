with one as (select pizzeria.name, count(person_order.id) as count
from pizzeria
join menu 
on pizzeria.id = menu.pizzeria_id
join person_order
on menu.id = person_order.menu_id 
group by pizzeria.name
order by 2 desc
)
,
two as
(
select pizzeria.name, count(person_visits.id) as count
from pizzeria
join person_visits
on pizzeria.id = person_visits.pizzeria_id 

group by pizzeria.name
order by 2 desc
), alls as 
(select two.name, count
from two
union all
select one.name, count
from one
order by 1 desc)
select name, sum(count) as total_count
from alls
group by name
order by 2 desc, 1
--group by two.name