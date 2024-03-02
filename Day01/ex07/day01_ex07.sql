select person_order.order_date, concat(person.name, ' (age:', person.age, ')') as person_information
from person_order
join person
on person.id = person_order.person_id
order by person_order.order_date, person_information



