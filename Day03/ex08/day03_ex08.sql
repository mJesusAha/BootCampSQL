--“sicilian pizza”

INSERT INTO menu
VALUES (
	(select max(id)+1 as id
from menu), (
select distinct pizzeria_id
from menu
join pizzeria
on menu.pizzeria_id = pizzeria.id
where pizzeria.name = 'Dominos'),

'sicilian pizza', 900)
       