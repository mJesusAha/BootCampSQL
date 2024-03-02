with amount as (select person_order.person_id, menu.pizzeria_id, count(person_order.person_id)
from person_order
join menu on person_order.menu_id = menu.id

group by person_id, menu.pizzeria_id )

insert into person_discounts (id, person_id, pizzeria_id, discount)
select row_number() over () as id,
       amount.person_id,
       amount.pizzeria_id,
       (case
           when amount.count = 1 then 10.5
           when amount.count = 2 then 22
           else 30
           end ) as discount
from amount
--drop table person_discounts